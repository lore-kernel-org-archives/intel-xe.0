Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB749CD6E64
	for <intel-xe@archiver.kernel.org>; Wed,  3 Jun 2026 08:24:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D79F10FA0A;
	Wed,  3 Jun 2026 08:24:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GAwVemqd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DCD210FA0A
 for <intel-xe@lists.freedesktop.org>; Wed,  3 Jun 2026 08:24:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780475049; x=1812011049;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=t/oAMNEUqWfqTTikA6ZvGufQxh+8NHmCoWbnf3WiHrw=;
 b=GAwVemqdKUHDXsiVzW+hduQlgr53zHx1Z3IRMfZj6+PXUssFPsUJXzkT
 jPow4Hy2zgYyC8oCU6fftfKhxdSl0ahrKp7CeGbUrIK5je/GrMd/U7ord
 /2fG8fmgr8TxvDVLsJVkSe7+ltXDIXzPvJ4H/Lcn5vIohaaByf1XcTeJS
 FZLjfKovcTsRufrkOCq4SUvXqSxsITQKf6McwWsUlfnseONEKv4iEhuTR
 MRF0I+0W7WFDjJHuJz/MfkELo2IxeVErXv1fpc26NujvCXk90DIMLpIgr
 jXqgxB4zfYOU9BMs6QPLlVPWKUAtOq1WGpx6lm3ZErlI6GGRNeqBrqr0t g==;
X-CSE-ConnectionGUID: 6lKwCxdlRla8PaFsp4GKlg==
X-CSE-MsgGUID: puopxwGBSKSbDHOxI0uujA==
X-IronPort-AV: E=McAfee;i="6800,10657,11805"; a="81014263"
X-IronPort-AV: E=Sophos;i="6.24,184,1774335600"; d="scan'208";a="81014263"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2026 01:24:08 -0700
X-CSE-ConnectionGUID: GZsEOassQBSV9J3jvsNZsg==
X-CSE-MsgGUID: mGKfMWFpRAK3Z59xAbfbAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,184,1774335600"; d="scan'208";a="241163341"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2026 01:24:08 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 3 Jun 2026 01:24:07 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 3 Jun 2026 01:24:07 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.47) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 3 Jun 2026 01:24:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T3sTJaDo2H7cNoSWbcCOG7TZzKUKB+h3md2RnojcmhBzY+Gr1+NZcmaR+Z28wGQLjovojI6BsGvyzykPDopYVQNx9PxG1R2dXLV9/q6bPYAe3GBnmjOOKCAEcd5JnrsTDmlV2F4Z0PoDHlNuahYy8bXr5c5qt56eBwp6OOq6CsjC9ZN3Gv51U0dl2HoJjX9O2es8Eg+ZbQx0AYkKFLy1EMj5VmOe5dlpTSMIuLO9wDqhxpX4d+DAUBPrUGikDjJPbpbsXIAr7eSQMdl0ofUYfJ0b3/8Fr0m6cVZ6cekrni/HvxV11GyLZYQwePUTHw97OU06WrdVXRd2F4khc3tbLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t/oAMNEUqWfqTTikA6ZvGufQxh+8NHmCoWbnf3WiHrw=;
 b=FIU51afLLETgH5h2nz2f+GSA2V2FnFp6zKNod0faSNoBiM62DOvPL7Nx5WIJ3Az5kMPbLmTdIz6/EePsGI171JuVNMeWiTErHYeOm3x8TCo+eUScHudx/Vd1d7uxPb+ADCeDIO0v4OV0gJ5DH32E70mRmWa5CncywSox1h3kqhnoxWDeMSaFI+IYkqGV7aRqSoLpOdgz4btPmhjuorGVBhROpp+CtD2/LkFdAzHQSiz0751I8H3zLGsp4N8nMMFvSAoo4Ffqc8JoS6vDc7r3mPQ21U3fbCtZwN5B6YHS5oqlfuux6SF9ZjPjkQvL4dTASQTz/k3FoJ9W3OfifSbY2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA3PR11MB7625.namprd11.prod.outlook.com (2603:10b6:806:305::12)
 by PH0PR11MB4968.namprd11.prod.outlook.com (2603:10b6:510:39::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 08:24:05 +0000
Received: from SA3PR11MB7625.namprd11.prod.outlook.com
 ([fe80::a120:f916:60ba:5ad3]) by SA3PR11MB7625.namprd11.prod.outlook.com
 ([fe80::a120:f916:60ba:5ad3%5]) with mapi id 15.21.0071.015; Wed, 3 Jun 2026
 08:24:05 +0000
From: "Tangudu, Tilak Tirumalesh" <tilak.tirumalesh.tangudu@intel.com>
To: "Vivekanandan, Balasubramani" <balasubramani.vivekanandan@intel.com>,
 "Roper, Matthew D" <matthew.d.roper@intel.com>, "Belgaumkar, Vinay"
 <vinay.belgaumkar@intel.com>, "Upadhyay, Tejas" <tejas.upadhyay@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH] drm/xe: Add wa_14025941587 to xe2, xe3 and xe3p platforms
Thread-Topic: [PATCH] drm/xe: Add wa_14025941587 to xe2, xe3 and xe3p platforms
Thread-Index: AQHc8kjmqG8+DqVeWUWUxYiP+kzRprYseKMAgAAF6LA=
Date: Wed, 3 Jun 2026 08:24:04 +0000
Message-ID: <SA3PR11MB762511821674A50F092E74F8C8132@SA3PR11MB7625.namprd11.prod.outlook.com>
References: <20260602043231.3119355-1-tilak.tirumalesh.tangudu@intel.com>
 <ah_eYJpPX1_YKtHf@bvivekan-mob1>
In-Reply-To: <ah_eYJpPX1_YKtHf@bvivekan-mob1>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA3PR11MB7625:EE_|PH0PR11MB4968:EE_
x-ms-office365-filtering-correlation-id: fc9b04cd-abf5-4548-72a5-08dec149798e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|3023799007|38070700021|56012099006|4143699003|11063799006|22082099003|18002099003;
x-microsoft-antispam-message-info: JcN7NppCBtdq4LuYqCchDnn88s58o0mzy4EN/TF9IOhRgq3l7AC4C7Q1/ALXDOQu1yR5otteXY5bs4SoTrFhqN98dSpHcb8qDVV4pcf40shqkXs2ZI6MLHET7DXtS+uOjBa+/CkjffQHMUALdgAAPh8UV7ErmPiRaMpkc+zHcNumRPIryCHnmGuIiCcXQ8s1ccyTOhEKW9LIInfhLwWvWAFBCVImb8OyNezDOPpudu3atSjK1oXg+0B8StzJtWQQE4tMIaGDb5WX3qvhMd3632T9WaOrwrnAAYvenpLgLW57vkgO0rkh6RUa6q7TBrMiwQ4F4rUncDnElSklYGe5VNHcpIyrwCGH/DgNyaDs+oTARGezNFyHHUTAumC9iqV3W4eM7uuYa8xQx/C2N9i7oDBjxUNX5ii4j8ndD41cXWw4OpIpHkLZVpnu0BCptnkEpg6cVzigDEyzxCBlsPhxrHjxzuVXcLgu14jdS36ALWgOsLSyG0jmcOINm9h5pjP2ak2lqgFhJFUMsWt2aFLSH62tD8Z0z/g2Cx77kg5F7ozbi+sWL0oNOUaBLgyUcHRlp4Lt6NFLu0Y7PLMAKIZ7VjkwOQuvWVnEN0wONKUpTtklJbUn5IItODLhe9C9lE9jMZIn4l6ssRXcDXDGMndMaxjPVBb1dNVzZBoLFmkS2z/GI0DZMdZ2kE+NMeQgEMRyP+49mHNozz7BZe6sYnyGruk+Rplp00KPmThmGzaMXyKsczoqOaTs4BMzidpjQrv3
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA3PR11MB7625.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(3023799007)(38070700021)(56012099006)(4143699003)(11063799006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZG10N3VaaitsbG5JNmcwNy94U2F6RDdLK1lBUmRoU0c0YmVtNXF6QlB5eDhs?=
 =?utf-8?B?eElnZytPZ1pFbkhUOVdqL0dGeXYxYkM5TW83MW1NUHZzd05DWWs3YlUrejBi?=
 =?utf-8?B?eG9KZjEycW9zSlBMdWRuOUdmb0V5RkRiWDF5aVYyd3lQVEtPNmd4VDFDRVF0?=
 =?utf-8?B?M0lmL3NhY2dRUXFjKzloSUFDcVo3UXJacWszMGxLYnVoeWltUmVlQlNBWGhx?=
 =?utf-8?B?UjU3YUQvQkJ0UUZxUmsyWFRLUmIyTE45d20yQVUzOGFiMFBYak9zM250MjNV?=
 =?utf-8?B?NkFBRWppRko5WmhRUnNmdkZKSU1pS1lhNDRyeGU5LzRhVkliVGFzWFF0OXMv?=
 =?utf-8?B?Z0dXaVhKRTJqcHNKVGZPYittL0hlOHgycTNqdUpUWDBRUGxmdDNkYS95QWc0?=
 =?utf-8?B?V3l0cnA5VnJNNkxUSklYK2Q2THJGQkdxMFNGRHVaQlRLTWp6eWw2eFpqVmFk?=
 =?utf-8?B?d0UrTm1YQ3UyR2k3cVRhUit1UnhGOUNkb3JqZ0picis5OW5vT0ZPUVBWTFhS?=
 =?utf-8?B?YWlxQ3hGV3g1dEZWRmhBNjdCZFE2dlNzY2NlYUs3SFNBSWZCMStZSkg2SzVF?=
 =?utf-8?B?V2E1L2ZialpxbEtYTXRqaTQ3ZEFzaTRIQVhQQ2ZHWU1RSE00VC90dVhuTTdW?=
 =?utf-8?B?MSt4dkg4NEdtL2pxMi9VNURPbGkwcDV6aFZiS3RJNGp1RzVOeEdJMzF3THAy?=
 =?utf-8?B?Y2RwdDhFRGR1SEQ1T1B4SVhVenl6T3ViaVowT1BzemZzbVlrdjR3a3BjU0VH?=
 =?utf-8?B?UE5qa1FaZ0NkektkZ2xIK0RyMVJoRUs4cTRLMWdZS3dpMkNXQ1dibXFCRkNL?=
 =?utf-8?B?WnBaYndYN01PbDNLRDJhaWRtQjltZHhDNExQeTVZRE9IUlBtTGxXN1VWVDk3?=
 =?utf-8?B?UHFHVjRQc3l1dGVEUkk4Z05TTkZLc21VTVcwQU9UeTV5eWhkQjd5RklvVGJC?=
 =?utf-8?B?ZlB4MklzaDBxMkdjUDdJVnowZWdtRXExNzdQOFJJZjl2UU5kQ00yYi9KdVg1?=
 =?utf-8?B?WHhxWVZvWXpndTgyZFpQRTdOOVpUWkFrN283SDVUUWZFQmo2YVV3eUVBcTgr?=
 =?utf-8?B?MVJiaVRoRFpSRTQzdzVkWk4reVMzVjdMNVlVQkJFdzdMQnVWaHo4SGhZcEJj?=
 =?utf-8?B?YjJnSHBrM205MWlOZmt0dU1semc5dzN1ZVZjUWhFTjg2a3RDejdTZXVXay9y?=
 =?utf-8?B?cU1zQmV5ZVY3amZpVmRsMW43aWdBSW5Pa0dLV0tzL1dGT3c1eU5qOEcwUnMz?=
 =?utf-8?B?U0ZQUys1bVdVaWlYTER5YnlkeWs3NnFtN3NDUnV6N3JPeUZzTzg4VFFSQmw5?=
 =?utf-8?B?NzlwT3ljbjVBWkR2byt1WHRzSlJJQk84MTlFMmFzQ2FBR3RmMEVsbUZudmQ5?=
 =?utf-8?B?MlEvU09qSldQdUc1TWREd2U1OUg1NVRTN2F5M2tGMmVLV0taNGNFOVQvL2Y2?=
 =?utf-8?B?SExGbUpXWWNYVFBVRldKaDBLMWluNms1VlBIWUpkaTFXVlY1MGpQc2xzNWto?=
 =?utf-8?B?ZTJBL25Xbld1aVNqOWNKQjJZbklsT09IQ3N6UWc1bHhwSVdTaXZ4VENXNCtS?=
 =?utf-8?B?MU93UkNWSFFuZWFmOHFhMURIY0F1VG9mTERmeDMvVFR0anU5a015OFI4WFR1?=
 =?utf-8?B?M2V4dXZQcU1wZXMwUnVoRldJdUNmYS83Q1kzQ2ZFcXpPU0dCTHVrd09RM0hj?=
 =?utf-8?B?VmFRVkl5aVQ2aG1zR09kNGxxUjdCTmV1LzJHKzRtU3Z3eGRXcGJKeG8vVDhp?=
 =?utf-8?B?ZEMrU0JMelpaUyt6MDNCMzk2bmdFaHFNR08yZHlWMkdjRGV3THFPZ3VKU2Fi?=
 =?utf-8?B?QTRmS1RTVjJpaGM4V3U0R25sblhHNmFMczA3cDRKTXpVNjFBZlBrOFVGZHpM?=
 =?utf-8?B?VmMzV0pyS0xya3N2cExBdkgzTjNscFU2UTV2SVA1NXViM1M4Tk0xUFMvUDBG?=
 =?utf-8?B?MFF6c3puQnpxN2xRVjhNSVZ4bWF4N3ppSlFMZzloV3lqQmdrTE9VbWZaZnBi?=
 =?utf-8?B?VENYMVovdzd0MktidW0xTjBmTDRGQTNwNkRSOVl0OWxzTlNXS1JiVmhyQ0RM?=
 =?utf-8?B?bDdtZmptQnBnc2NNcnBydEEzMUJSNEx1bUZTMFVOaGtzSkpwMEZJV3N0bHpF?=
 =?utf-8?B?OTYwczFwZkl2aHdNeG9Pb2pESURoT3RBUy9WQWg4bkI2RzMxQTZtbVRkdEtX?=
 =?utf-8?B?aU8ralpNNkFEYzVwU1BCOTZlbXRTbGNqdVJwcmVhRDBwOUM5cEN5TCtnL0pV?=
 =?utf-8?B?cy9kR0lFb0dZT3NuaEx1UTZDTDl2WGEwMFZlblBHUk5NdERNOGZDWEtnM2E2?=
 =?utf-8?B?dzQvcTVxbmp4M0pWcGxURWZtNlhUTkpMYTUya2tpQkw0VXNTdFVzZ2RUL1dl?=
 =?utf-8?Q?UFiYPI25qS/LpVEc=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: Qhrw0BqTCelSDhsLTjQ1FX1tFPgezwPalF/bg6hztuuTJ48vk53YHPyR9mv85BuAPk46L3QX34sOSiQQ89QQJih0LT3tlGtpADEI28afd4AYV4n3TSVcUFYn2RiqaUnqFY4l7/qFqTArBl08dO5/Ho6kYqr6S0TYDwGRjw43g/oMw1rAWcIfl+IRwGhTLP7/FTYh2tFh8C8Hc6PBm1lZepRN+sOfkKsOC4iNq3oi/YzK+mFcSI1efkGhXoSoeYehAmLd9QV21C8bBLmW/TmpwmMje2gtQXAumGjvOHT+64FHokUruHr3Z6xHGYXILmZE+f/aCMY6EVZ2Q70VFu0xtg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA3PR11MB7625.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc9b04cd-abf5-4548-72a5-08dec149798e
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jun 2026 08:24:04.9225 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +sbqNefN6SRT34PGXws4tzoR93Fn/WBTFkfPhVhBJ3+9wBTdtc+WeYKNFxFVQOP4gE1ASsIbH0DXdffSCvwB4ietYEHOQvJpDo1gYQhBo/+B2vo7jiu4y54jJyEvBdnD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4968
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

DQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBWaXZla2FuYW5kYW4sIEJhbGFz
dWJyYW1hbmkgPGJhbGFzdWJyYW1hbmkudml2ZWthbmFuZGFuQGludGVsLmNvbT4gDQpTZW50OiAw
MyBKdW5lIDIwMjYgMTM6MjcNClRvOiBUYW5ndWR1LCBUaWxhayBUaXJ1bWFsZXNoIDx0aWxhay50
aXJ1bWFsZXNoLnRhbmd1ZHVAaW50ZWwuY29tPjsgUm9wZXIsIE1hdHRoZXcgRCA8bWF0dGhldy5k
LnJvcGVyQGludGVsLmNvbT47IEJlbGdhdW1rYXIsIFZpbmF5IDx2aW5heS5iZWxnYXVta2FyQGlu
dGVsLmNvbT47IFVwYWRoeWF5LCBUZWphcyA8dGVqYXMudXBhZGh5YXlAaW50ZWwuY29tPjsgaW50
ZWwteGVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQpTdWJqZWN0OiBSZTogW1BBVENIXSBkcm0veGU6
IEFkZCB3YV8xNDAyNTk0MTU4NyB0byB4ZTIsIHhlMyBhbmQgeGUzcCBwbGF0Zm9ybXMNCg0KT24g
MDIuMDYuMjAyNiAxMDowMiwgdGlsYWsudGlydW1hbGVzaC50YW5ndWR1QGludGVsLmNvbSB3cm90
ZToNCj4gRnJvbTogVGFuZ3VkdSBUaWxhayBUaXJ1bWFsZXNoIDx0aWxhay50aXJ1bWFsZXNoLnRh
bmd1ZHVAaW50ZWwuY29tPg0KPiANCj4gQXZvaWQgSURMRURMWSB0aW1lciBwcm9ncmFtbWluZyBs
ZXNzdGhhbiA1IG1pY3JvIHNlY3MuDQo+IEFwcGx5IHdhXzE0MDI1OTQxNTg3IHRvIEdyYXBoaWNz
IFZlcnNpb25zIDIwLjAxIHRvIDM1LjExIGFuZCBNZWRpYSANCj4gVmVyc2lvbnMgMTMuMDEgdG8g
MzUuMDMNCj4gDQo+IHYyOiBVc2UgeGVfcnRwX21hdGNoX25vdF9zcmlvdl92ZiwgbW92ZSB0byBs
b2NhbCB2YXJpYWJsZQ0KPiAgICAgUmVtb3ZlIHdhcm4gYW5kIG90aGVyIGtuaXRzICAgICAgICAg
ICAgLSBNYXR0IFINCj4gDQo+IHYzOiBBZGQgdmVyYm9zZSBjb21tZW50IC0gVGVqYXMNCj4gDQo+
IHY0OiBSZXN0b3JlIElETEVfRExZIHJlZ2lzdGVyIG9uIGVuZ2luZSByZXNldC4NCj4gICAgIEFk
ZCBpdCB0byBHVUMgc2F2ZS1yZXN0b3JlIGxpc3QuIC1WaXZlaw0KPiANCj4gdjU6IEV4dGVuZCBX
QSB0byBNZWRpYSBWZXJzaW9ucyAxMy4wMSB0byAzNS4wMyAtIFZpbmF5DQo+IA0KPiBTaWduZWQt
b2ZmLWJ5OiBUYW5ndWR1IFRpbGFrIFRpcnVtYWxlc2ggDQo+IDx0aWxhay50aXJ1bWFsZXNoLnRh
bmd1ZHVAaW50ZWwuY29tPg0KPiAtLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNfYWRz
LmMgICAgfCAgMiArLQ0KPiAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2h3X2VuZ2luZS5jICB8IDI2
ICsrKysrKysrKysrKysrKysrKysrKysrLS0tICANCj4gZHJpdmVycy9ncHUvZHJtL3hlL3hlX3dh
X29vYi5ydWxlcyB8ICAyICsrDQo+ICAzIGZpbGVzIGNoYW5nZWQsIDI2IGluc2VydGlvbnMoKyks
IDQgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hl
X2d1Y19hZHMuYyANCj4gYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3VjX2Fkcy5jIGluZGV4IGM5
ODQ1NDU0NWE4NS4uMjA4MGUwZTY1MGViIA0KPiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL3hlL3hlX2d1Y19hZHMuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3VjX2Fk
cy5jDQo+IEBAIC03NjgsNyArNzY4LDcgQEAgc3RhdGljIHVuc2lnbmVkIGludCBndWNfbW1pb19y
ZWdzZXRfd3JpdGUoc3RydWN0IHhlX2d1Y19hZHMgKmFkcywNCj4gIAkJfQ0KPiAgCX0NCj4gIA0K
PiAtCWlmIChYRV9HVF9XQShod2UtPmd0LCAxNjAyMzEwNTIzMikpDQo+ICsJaWYgKFhFX0dUX1dB
KGh3ZS0+Z3QsIDE2MDIzMTA1MjMyKSB8fCBYRV9HVF9XQShod2UtPmd0LCANCj4gKzE0MDI1OTQx
NTg3KSkNCj4gIAkJZ3VjX21taW9fcmVnc2V0X3dyaXRlX29uZShhZHMsIHJlZ3NldF9tYXAsDQo+
ICAJCQkJCSAgUklOR19JRExFRExZKGh3ZS0+bW1pb19iYXNlKSwNCj4gIAkJCQkJICBjb3VudCsr
KTsNCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9od19lbmdpbmUuYyANCj4g
Yi9kcml2ZXJzL2dwdS9kcm0veGUveGVfaHdfZW5naW5lLmMNCj4gaW5kZXggOGM2NmZmNmYzZDNj
Li5kZDhlZWMwOThiZGYgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9od19l
bmdpbmUuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfaHdfZW5naW5lLmMNCj4gQEAg
LTU4NCw4ICs1ODQsMTIgQEAgc3RhdGljIHZvaWQgYWRqdXN0X2lkbGVkbHkoc3RydWN0IHhlX2h3
X2VuZ2luZSAqaHdlKQ0KPiAgCXUzMiBpZGxlZGx5X3VuaXRzX3BzID0gOCAqIGd0LT5pbmZvLnRp
bWVzdGFtcF9iYXNlOw0KPiAgCXUzMiBtYXhjbnRfdW5pdHNfbnMgPSA2NDA7DQo+ICAJYm9vbCBp
bmhpYml0X3N3aXRjaCA9IDA7DQo+ICsJYm9vbCB3YV9hcHBsaWVkID0gZmFsc2U7DQo+ICsNCj4g
KwlpZiAoKCFJU19TUklPVl9WRihndF90b194ZShod2UtPmd0KSkgJiYgWEVfR1RfV0EoZ3QsIDE2
MDIzMTA1MjMyKSkgfHwNCj4gKwkgICAgWEVfR1RfV0EoZ3QsIDE0MDI1OTQxNTg3KSkgew0KPiAr
CQl1MzIgbWluY250X2lkbGVkbHlfbnMgPSA1MDAwOw0KPiAgDQo+IC0JaWYgKCFJU19TUklPVl9W
RihndF90b194ZShod2UtPmd0KSkgJiYgWEVfR1RfV0EoZ3QsIDE2MDIzMTA1MjMyKSkgew0KPiAg
CQlpZGxlZGx5ID0geGVfbW1pb19yZWFkMzIoJmd0LT5tbWlvLCBSSU5HX0lETEVETFkoaHdlLT5t
bWlvX2Jhc2UpKTsNCj4gIAkJbWF4Y250ID0geGVfbW1pb19yZWFkMzIoJmd0LT5tbWlvLCANCj4g
UklOR19QV1JDVFhfTUFYQ05UKGh3ZS0+bW1pb19iYXNlKSk7DQo+ICANCj4gQEAgLTU5NSw4ICs1
OTksMjQgQEAgc3RhdGljIHZvaWQgYWRqdXN0X2lkbGVkbHkoc3RydWN0IHhlX2h3X2VuZ2luZSAq
aHdlKQ0KPiAgCQltYXhjbnQgPSBSRUdfRklFTERfR0VUKElETEVfV0FJVF9USU1FLCBtYXhjbnQp
Ow0KPiAgCQltYXhjbnQgKj0gbWF4Y250X3VuaXRzX25zOw0KPiAgDQo+IC0JCWlmICh4ZV9ndF9X
QVJOX09OKGd0LCBpZGxlZGx5ID49IG1heGNudCB8fCBpbmhpYml0X3N3aXRjaCkpIHsNCj4gLQkJ
CWlkbGVkbHkgPSBESVZfUk9VTkRfQ0xPU0VTVCgoKG1heGNudCAtIDEpICogMTAwMCksDQo+ICsJ
CS8qIFdhXzE0MDI1OTQxNTg3OiBhcHBsaWVkIHByaW9yIHRvIFdhXzE2MDIzMTA1MjMyLA0KPiAr
CQkgKiBhcyB0aGUgbGF0dGVyIGhhcyBoaWdoZXIgcHJpb3JpdHksIGFsdGhvdWdoIGNvbmZsaWN0
DQo+ICsJCSAqIGlzIG5vdCBleHBlY3RlZC4NCj4gKwkJICovDQo+ICsJCWlmIChYRV9HVF9XQShn
dCwgMTQwMjU5NDE1ODcpICYmDQo+ICsJCSAgICBpZGxlZGx5IDwgbWluY250X2lkbGVkbHlfbnMp
IHsNCj4gKwkJCWlkbGVkbHkgPSBtaW5jbnRfaWRsZWRseV9uczsNCj4gKwkJCXdhX2FwcGxpZWQg
PSB0cnVlOw0KDQo+SWYgdGhlcmUgd291bGQgYmUgYSBwbGF0Zm9ybSBmb3Igd2hpY2ggMTQwMjU5
NDE1ODcgYXBwbGllcyBidXQgbm90IDE2MDIzMTA1MjMyLCB0aGVuIHRoZSA+YWJvdmUgY29uZGl0
aW9uIHdvdWxkIHNpbGVudGx5IGNsZWFyIHRoZSBpbmhpYml0X3N3aXRjaCAoYml0IDMxIG9mIElE
TEVETFkgcmVnaXN0ZXIpIHRob3VnaCA+MTQwMjU5NDE1ODcgZG9lc24ndCBleHBsaWNpdGx5IGFz
a3MgZm9yIGNsZWFyaW5nIGl0Lg0KPkJ1dCBpZGxlIGRlbGF5IHRpbWVvdXQgd29uJ3QgYXBwbHkg
d2hlbiBpbmhpYml0X3N3aXRjaCBiaXQgaXMgc2V0Lg0KPlRoZSBXQVJOIHN0YXRlbWVudCBiZWxv
dyBmb3IgV0EgMTYwMjMxMDUyMzIsIGlzIGhlbHBpbmcgdG8gYWxlcnQgdXMgd2hlbiB3ZSBhcmUg
Y2xlYXJpbmcgPmluaGliaXRfc3dpdGNoIGJpdCB0aG91Z2ggdGhlIFdBIGlzIG5vdCBhc2tpbmcg
Zm9yIGl0IGV4cGxpY2l0bHkuDQoNCj5UaGVyZWZvcmUgSSB3b3VsZCBzdWdnZXN0IHdlIGFkZCBh
IHNpbWlsYXIgV0FSTiBzdGF0ZW1lbnQgY2hlY2tpbmcgZm9yIGlkbGVkbHkgdmFsdWUgYW5kID5p
bmhpYml0X3N3aXRjaCBldmVuIGZvciAxNDAyNTk0MTU4Ny4NClRoYW5rcyBmb3IgdGhlIHJldmll
dyBvbiB0aGlzLCB3YXJuIG9uIGluaGliaXRfc3dpdGNoIG92ZXJyaWRlIGlzIHN1ZmZpY2llbnQg
cmlnaHQ/DQp3YXJuIG9uIElkbGVkbHkgdmFsdWUgY29uZGl0aW9uIGlzIG5vdCBuZWVkZWQgcmln
aHQgPyBhcyB3ZSBpbnRlbmQgdG8gb3ZlcnJpZGUgYXMgcGFydCBvZiBXQS4NCj4gKwkJfQ0KPiAr
DQo+ICsJCWlmIChYRV9HVF9XQShndCwgMTYwMjMxMDUyMzIpICYmDQo+ICsJCSAgICAoeGVfZ3Rf
V0FSTl9PTihndCwgaWRsZWRseSA+PSBtYXhjbnQgfHwgaW5oaWJpdF9zd2l0Y2gpKSkgew0KPiAr
CQkJaWRsZWRseSA9IChtYXhjbnQgLSAxKTsNCj4gKwkJCXdhX2FwcGxpZWQgPSB0cnVlOw0KDQpS
ZWdhcmRzLA0KQmFsYQ0KDQo+ICsJCX0NCj4gKw0KPiArCQlpZiAod2FfYXBwbGllZCkgew0KPiAr
CQkJaWRsZWRseSA9IERJVl9ST1VORF9DTE9TRVNUKChpZGxlZGx5ICogMTAwMCksDQo+ICAJCQkJ
CQkgICAgaWRsZWRseV91bml0c19wcyk7DQo+ICAJCQl4ZV9tbWlvX3dyaXRlMzIoJmd0LT5tbWlv
LCBSSU5HX0lETEVETFkoaHdlLT5tbWlvX2Jhc2UpLCBpZGxlZGx5KTsNCj4gIAkJfQ0KPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3dhX29vYi5ydWxlcyANCj4gYi9kcml2ZXJz
L2dwdS9kcm0veGUveGVfd2Ffb29iLnJ1bGVzDQo+IGluZGV4IGY4YTE4NTEwM2I4MC4uNWQ1MDQx
MTY4ZmE4IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfd2Ffb29iLnJ1bGVz
DQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV93YV9vb2IucnVsZXMNCj4gQEAgLTY1LDMg
KzY1LDUgQEANCj4gIA0KPiAgMTQwMjU4ODMzNDcJTUVESUFfVkVSU0lPTl9SQU5HRSgxMzAxLCAz
NTAzKQ0KPiAgCQlHUkFQSElDU19WRVJTSU9OX1JBTkdFKDIwMDQsIDMwMDUpDQo+ICsxNDAyNTk0
MTU4NyAgICBHUkFQSElDU19WRVJTSU9OX1JBTkdFKDIwMDEsIDM1MTEpLCBGVU5DKHhlX3J0cF9t
YXRjaF9ub3Rfc3Jpb3ZfdmYpDQo+ICsJICAgICAgIE1FRElBX1ZFUlNJT05fUkFOR0UoMTMwMSwg
MzUwMyksIA0KPiArRlVOQyh4ZV9ydHBfbWF0Y2hfbm90X3NyaW92X3ZmKQ0KPiAtLQ0KPiAyLjQ2
LjANCj4gDQo=
