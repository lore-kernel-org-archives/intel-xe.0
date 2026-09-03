Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C9E0C61DD3
	for <intel-xe@archiver.kernel.org>; Thu,  3 Sep 2026 04:11:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDC2210E09C;
	Thu,  3 Sep 2026 04:11:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fJlO18oA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D51C110E04C;
 Thu,  3 Sep 2026 04:11:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788408703; x=1819944703;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=dvw0c5WA90aRnkJAXh7+42z9h9cLIuzl2CmWi2i8tOs=;
 b=fJlO18oAyfDAd3g6aOgodJ1d/2GrTLQi8THV5KCjp470/qFw9ZEeuZ5s
 t5W4zUUaGOTNLc38KQGhut41B1Dg2Rs/Bg8xA+50d38805sLptSltVWUQ
 FPwuzMiqaqA8RH79a0cUl36bpuQOI62ZGF1Nc2rnQhGKUU0GF+au1MJs1
 VMZP+1XUnjJXHf6QdDBuq6odI4ykJTQiZK7snifCQAWZpFtEdFnrVfv24
 mi2WlgxbOx9zfpskQ/H+EDx5qeH3l+jxZjqmZUX5b3FA2hyOicCFVzmw/
 Ztw5msVpyKcpfeGI3neAXXzL/7OaJuDm66r6guScgqt2BRwc18cKovkUn Q==;
X-CSE-ConnectionGUID: JZmcpthHSSKxA7PHSDuWfg==
X-CSE-MsgGUID: buZ1YaIcSE+/uut5M5R+uA==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="100234588"
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; d="scan'208";a="100234588"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 21:11:42 -0700
X-CSE-ConnectionGUID: 3VUzQNkVRXK3A1fvbLwzPA==
X-CSE-MsgGUID: bkhSc5M2QRmVtkQIc17mdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; d="scan'208";a="307798004"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 21:11:42 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 2 Sep 2026 21:11:41 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 2 Sep 2026 21:11:41 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.30) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 2 Sep 2026 21:11:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NBPpf7kt/vLxYBukgBkw/7FocMBvfES9waVx6w6fQu2rIeEG1BCkMJ07lM58gCd4+CcKIUJklDw4KH4D3se1cZOwmW8CZjvYeyvmfUKU7AZbfu66ACjyyE6fV+6A2YI4yFcFHQfjhSMq418dhdQT4KeKEyMJjBZKFhnTqgGQnf0JBWBVZtul5LfDptVjZO2IGEdyKNPCRbEyNMR9tDIS2FxNaNX7ATXWa9HFMajyWBTcInKxetolgqzmsr6wvCmRBLvHZKQpuzYLt2qv01eCPThAseiY0qxEW8smcYNWUotczJ6JZrXpk51WerKYX6mFrvfS3r+Msn0zDlL+EVKBzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dvw0c5WA90aRnkJAXh7+42z9h9cLIuzl2CmWi2i8tOs=;
 b=Z91GMovV/wkuGENNrbFk8aZx8yimMUCnZXYY6twVhqK9gxT1dEMqZ0bsLu6UOE38E+chUVYipq4AjRdqhNZ37XIaCnQ/0RS0urjsumfQK26E29xXeWHwGNgN54JwgqELDXwHQ9W0WIszmibSOBeUZ5OABeyPw72Z/0LpBY06arctrSodWfGIXeYTGjXKhwcCZnNkie68T42Ity0c4CdoVKveoodevU+wnWdqMNktF9H0U1pLCwvH4zUCtQT7lxNWLraGwX3b6sGtzsjR8w9xvDrYE4+95HUn3GJycj1VrUT72wxn/0tlyBqIPJhxfb5BNzoyAJ6wE6YL1v6YoeNhmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6019.namprd11.prod.outlook.com (2603:10b6:8:60::5) by
 PH3PPF7A88A980A.namprd11.prod.outlook.com (2603:10b6:518:1::d32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Thu, 3 Sep
 2026 04:11:33 +0000
Received: from DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::9086:5e0b:ad24:762]) by DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::9086:5e0b:ad24:762%6]) with mapi id 15.21.0360.008; Thu, 3 Sep 2026
 04:11:33 +0000
From: "Hogander, Jouni" <jouni.hogander@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "j@metarealtyinc.ca" <j@metarealtyinc.ca>
CC: "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>, "Nikula, 
 Jani" <jani.nikula@intel.com>, "Manna, Animesh" <animesh.manna@intel.com>
Subject: Re: [PATCH] drm/i915/alpm: Keep the extended fast wake ahead of the
 IO buffer wake
Thread-Topic: [PATCH] drm/i915/alpm: Keep the extended fast wake ahead of the
 IO buffer wake
Thread-Index: AQHdOve5X2T0l15fqUSns0f4ZOH+ULa8PqmA
Date: Thu, 3 Sep 2026 04:11:32 +0000
Message-ID: <ddb81e28fa7cee2b8bf4e7f7e2f679da2d36abb2.camel@intel.com>
References: <20260902162531.73598-1-j@metarealtyinc.ca>
In-Reply-To: <20260902162531.73598-1-j@metarealtyinc.ca>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6019:EE_|PH3PPF7A88A980A:EE_
x-ms-office365-filtering-correlation-id: 146d322d-da0a-4548-7438-08df0971705e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|23010399003|376014|22082099003|18002099003|3023799007|56012099006|38070700021|11063799006|10067099003;
x-microsoft-antispam-message-info: W/vyPZbYjjCR+evD4eB9i0ZMID0CuikKuibI4jiNr8HtXSEvgbzqN+5C4VSwZyI9dpXzWB42K03oXJiEXWrlLWTscysRP/wYRtjB733MN22eiUmgaBF2OlwWNQOEIPFQWFFUxARQpzA6OhUqobHyC4Qlp3W+CvUt9CSwHm5PF7CuVifxKC8rpGNb9I3ajvOV2dgDO/erf98/Iuc7K18p0CreTtotC5fwDaVTJxdy4ShYcU/QH49SNv8N8W85ySLJpjSkshRyBhpr6WcMdGFFccQCxlhEtivec/pd1dSN2b7O9ElxvZbD2gLcg9y7rzXPeWP56iHAvx4BBpDgX0ombiZ23anOUnqqA3zjD1iQu0b83w5CvGL1d9fxxNlqN6GTyr4kCI2/2enbVwbdLwCbtR5TPxyPMJ4FStGNZc/CFmw0xSbmnml2x6Cy8dviDSCm0kxn4KUqu1uVqdTvOvvCSbbuciq1ViVbT7vMPXki8coomfJkPLd+ylUTMrAlNquYmm2biXTJGxfDvcP9XOqLgD7Y2h7+GfHDzhoWovQjEfGwnCM0cY5icieFT37oE1GPg5yOT9HIHW4TNKm6+WFA/cN2Q1t5VBjdDHu8Q0+7wbZddpLiAPrtE+r1E1f7kU45iFR+6LVYJHfhv4o0/ZB8Od1FrBifmNp1orrpfpxy7aE=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(22082099003)(18002099003)(3023799007)(56012099006)(38070700021)(11063799006)(10067099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cUZabUd5MHZFU3BMbEFNVDFIUTY3dnl0WVNJM3ZWMEV3MllaQm01dTdBNHIz?=
 =?utf-8?B?RERUZ2c2YXVYUURja012YlV6WklncExnMlhrOCsvcEY4U1U5cldaR3BBZ25X?=
 =?utf-8?B?MWRCeDJ2SnN5dWNrVVA5N1FCUFVCWXJDVEFuZzdnWG03bkdabHJIMzdVSlVq?=
 =?utf-8?B?ZkV5RzlZQXVFVGVlZlhIMmRjUTc1alBnT3NNQ2pFRW9LWWU1dXNZYVNkemdN?=
 =?utf-8?B?UGxXQ2FWN1psV1pjNUNHZXVJNi91L21hU21JVnFuSWM5QXRQK3JTRlUycmx3?=
 =?utf-8?B?T3VnaEI3NXFtNERieTczaHlrWnFFM1RIK0FVUmM5cG9TZ2tPVHlRUnM0WHZ4?=
 =?utf-8?B?NHl2VTlFRDNybm1xWnV6SGNmU1ZPUjl4cjdhMHV1NFJiT3R2QTBZcFdmdHh2?=
 =?utf-8?B?TTRNd2RMaGJWekllYUljc3NEQXZ1N0tRWmhVbTJjTzdrdGxnaE4xWmJhSmRy?=
 =?utf-8?B?MkwzdlFTZjZBVm9VWWc4U2QwUXdGa3FtTmFQekl4aFVlRE01Q2RtdjNySU1H?=
 =?utf-8?B?NXg5SVMxd0FiVjBORUVGS0NzNHUvWUNNSXgxTStZTU0wZ3F2ZE5wc3QvdWZM?=
 =?utf-8?B?cTdJWVAxeEZLU3ZaM3B3SkJPTmhmUEZyN3RmMlo2dnlhV0FPeEZpUHJ1dmhH?=
 =?utf-8?B?WUhGclpyNGdIdSswL2J1U2RXNHZVSWNVYVA5TVlsTlJsOW9UVlV5djQzbjBt?=
 =?utf-8?B?dWxtUVVJaWo0OG1SdGN1K2xYUkx1azR0UnpPNms1elJTWWJCU3dtUFFzS0xQ?=
 =?utf-8?B?R09Nc1dTM1l2UEFIRWhmeURMY3I3RHM2cFc0TzhGeThtQWx2QWFybFpSY1gy?=
 =?utf-8?B?eE9sWitvWTJqUnc4b0swRW9nS2Vmb0Nva2x2cUNaakFxUmRxWXRqVXlhVUpC?=
 =?utf-8?B?Vy9SZDQxS1BRUFZyWUZ4VWtLS3RjVlJ6djlFWGNhV1JRZnhoS3h2TDJ3RjlI?=
 =?utf-8?B?ZUU2TVFmb3pVRHZiZTI4ZkE3TVJqajIvSFR5bitpMXpkQXBadDZva2ZJWEV0?=
 =?utf-8?B?V1NXcVNiMFc1WUZ4bWxQaDhNN0w2cHptU3RQUUdmam9UWjR5SjhDWU1xeUVD?=
 =?utf-8?B?V29aM0Z2OUpDUXRlZUVtdnRqZzBPTG9oZ3A0c1JIVjRRSzdWTTBXNkFmNm1I?=
 =?utf-8?B?M1pPTlVHUk1ITHlkTzF4NXBHUlc2dlFPUW0rR1VLU3cyaFlmNnI2SGVhVFBu?=
 =?utf-8?B?TVBkeEJrWk5CMVNPT3plYVNsUFdIMm1QRnNUMFA2UTR1bDgxTFY3ZUk0eGo2?=
 =?utf-8?B?eGg2SStocGZIU01SaDlHZkhQVm10djRwekRqdytucjRXMTVKMEpGbG03S2Fs?=
 =?utf-8?B?RHVFR2xldWVnL1NkYTFGQ3FsOW03WUMvSzRWY1VxNEwzM01rOUdtNnV4VVFX?=
 =?utf-8?B?b2pETXhtNDMxUkt0c2ZoV1Z5Q0UzRklFTlRNTERJQnVXL08rRUx4eXN6NGZu?=
 =?utf-8?B?VDBtV0pYZmgyQUVnVURLaXptR0lGbjI5ZXFPY0lobFFxdFpDYnFFa0t6cXRn?=
 =?utf-8?B?OEpCbzFmRE9wU1pXbjM2cGpxL090aEtCUVovNzNPTFpOK2tmcmpsbVlYSHRO?=
 =?utf-8?B?a3Y4amFhS1JseWdmcFJ1eVBudm9jL3FmazBHZG94WXhpc3l0Rk1lMmF3TnNU?=
 =?utf-8?B?ZytXczhBS2V3SjZ5bXYzdlUxOHpOb2t6c2NKdzE3Ylg5Nml5TWhXUGFKTk5E?=
 =?utf-8?B?YldTL3kxWTZ2OUtJcjZ2M041TTVwcStuUlgxbnQyTmROWCtIVmNYS3RTRnA4?=
 =?utf-8?B?cXBLc2JmV1BBN3ppZFYxcndLdzF4L09MQTl3OU4xdHd0Y293eW54N1BhaWtZ?=
 =?utf-8?B?RnJZMG9vakRreGxRQXRTSzE5eU5QZ0QySFVETkltdmsyM2grNHcyN2pQOW5T?=
 =?utf-8?B?bFlVUUlJVlJXWDdrK05Qcnhlcy9vbnQ4R2ZkS3BJd1Q5QldiUFNDSldzTzlF?=
 =?utf-8?B?N0Y2Uy9sVUpsY0NoWHBMQUQzTm9aWEd1UE5USk5XRlBoOGJaNjU3cHdhMWRH?=
 =?utf-8?B?NEtYQ0p3Q0VJd1lUTHBWazlaVVRsYWlFVEI3ZGRyUWt5aStyS3NaMStWQUpO?=
 =?utf-8?B?V0oxMG5pcWJDUUs4MWNuYXR4dVd5OS9QdVlMQ3Q3dzBSUEdvZzVKZ3BYRXBM?=
 =?utf-8?B?UFFZbWlNbmpWNUZzOEpCZHNNZGJ5QnpnMDZoT3hXa3ZSL3hWNTFGTTdKTGlk?=
 =?utf-8?B?NGFweGE2SUdJRjlWeG5QWnJqa2ZXSEE1MjJhODE3bnRTM3VrM3RybmdwaHhi?=
 =?utf-8?B?eElXSy9PZEYrQlJFOVlpMm4zVnpURlA3WXpCTVBZdkpNcDVLbktrR2J6bGZ4?=
 =?utf-8?B?emhaWHZ0aG9JTXowbmgwU0JaM2tzamxIbEJhRnZMNmV6L2lTa2NBTEcxdTdL?=
 =?utf-8?Q?YXBRmKH9UG1gpzjk=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A284B4AD997F354493A301EDAFE1E88D@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: JvBz8huSmHNatIUd9oslBKV98JrFFSQozTLyThGR6XIGH7OfJyzwKWwYk+syk0GSug+pIKOhxiWfbuaBTeL/4ltnGP2zIZ+sWkzVO/5Dw8Gf6sScYNymndgzVhqNF6hvOSaVSh+ctU7oxWQ3ywDBpN4QKJke7BGsXUyoKjv4hGKDuQMcgYTlAX06d2o+VMPZ9GziG7EtG5IMFIfSCH07PehGYqAj0ChJC+VLN1dfTlp+0RAUTReIdTmSwYaNvvNv6WhvtzcwsNu4jOQoWf7T/YSriQYwyUyRM82n9BWAS7EmV2PPOeH+oXy5TkrncRAXKc9GxnyDfxxTB+6gPv0tbQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 146d322d-da0a-4548-7438-08df0971705e
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Sep 2026 04:11:33.0463 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zq6Pff2iUynYjnc4B8Y9Mk3pZjqzW/+lTn8Z4H8rs10x1Fcwv4BJV7b/Cplm+b0uPzCP5cjaEH3O1hg+O4jwPTN6QWndrbTTP5L+1xDcdrQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF7A88A980A
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

T24gV2VkLCAyMDI2LTA5LTAyIGF0IDEyOjI1IC0wNDAwLCBKYWtlIFN0ZWlubWFuIHdyb3RlOg0K
PiBPbiBkaXNwbGF5IHZlcnNpb24gMjArIHRoZSBleHRlbmRlZCBmYXN0IHdha2UgdGltZSBpcyBw
cm9ncmFtbWVkIGluDQo+IEFMUE1fQ1RMIGFuZCB0aGUgSU8gYnVmZmVyIHdha2UgaW4gUFNSMl9D
VEwuDQo+IGludGVsX2FscG1fY29tcHV0ZV9wYXJhbXMoKQ0KPiBkZXJpdmVzIGJvdGggZnJvbSBw
cmVjaGFyZ2UgKyBwcmVhbWJsZSArIFBIWSB3YWtlICsgdEZXIGV4aXQgbGF0ZW5jeQ0KPiAoNDIg
dXMgaGVyZSk7IHRoZSBJTyBidWZmZXIgd2FrZSBvbmx5IGRpZmZlcnMgd2hlbg0KPiBpb19idWZm
ZXJfd2FrZV90aW1lDQo+IGlzIGxhcmdlciB0aGFuIHRoZSBwcmVjaGFyZ2UsIHdoaWNoIGlzIG5v
dCB0aGUgY2FzZSBvbiB0aGlzIHBhbmVsLiBTbw0KPiBib3RoIGVuZCB1cCBvbiB0aGUgc2FtZSBu
dW1iZXIgb2Ygc2NhbmxpbmVzLCAxMSBvbiB0aGlzIG1vZGUuDQo+IA0KPiBPbiB0aGUgRGVsbCBY
UFMgMTYgREExNjI2MCAoUGFudGhlciBMYWtlLCBMRyBwYW5lbCB3aXRoIHNpbmsgT1VJDQo+IDAw
OjIyOmI5LCAzMjAweDIwMDBAMTIwLCA0IHggMi43IEdicHMsIERTQykgZXF1YWwgdmFsdWVzIG1h
a2UgZXZlcnkNCj4gQUxQTQ0KPiBsaW5rIHdha2UgZmFpbDogdGhlIHNpbmsgc2V0cyB0aGUgTGlu
ayBDUkMgZXJyb3IgYml0IGluDQo+IERQX1BTUl9FUlJPUl9TVEFUVVMgd2l0aGluIH4yNSBtcyBv
ZiBpdCBiZWluZyBjbGVhcmVkLCBvbiBldmVyeSB3YWtlLA0KPiBmb3INCj4gYXMgbG9uZyBhcyBQ
U1IyIGlzIGFjdGl2ZS4gQ2hhbmdpbmcgdGhlIHR3byBmaWVsZHMgYXQgcnVudGltZSBzaG93cw0K
PiB0aGF0DQo+IHRoZSByZWxhdGlvbiBiZXR3ZWVuIHRoZW0gbWF0dGVycywgbm90IHRoZSBhYnNv
bHV0ZSB0aW1lOg0KPiANCj4gwqAgZmFzdCB3YWtlIDExIC8gSU8gd2FrZSAxMcKgIC0+IENSQyBl
cnJvciBvbiBldmVyeSB3YWtlDQo+IMKgIGZhc3Qgd2FrZSAxMiAvIElPIHdha2UgMTHCoCAtPiBj
bGVhbg0KPiDCoCBmYXN0IHdha2UgNDAgLyBJTyB3YWtlIDQwwqAgLT4gQ1JDIGVycm9yIG9uIGV2
ZXJ5IHdha2UNCj4gwqAgZmFzdCB3YWtlIDQwIC8gSU8gd2FrZSAyMMKgIC0+IGNsZWFuDQo+IMKg
IGZhc3Qgd2FrZSAxMSAvIElPIHdha2UgMjDCoCAtPiBDUkMgZXJyb3Igb24gZXZlcnkgd2FrZQ0K
PiANCj4gVGhlIGZhc3Qgd2FrZSBzZXF1ZW5jZSBoYXMgdG8gc3RhcnQgc3RyaWN0bHkgYmVmb3Jl
IHRoZSBJTyBidWZmZXINCj4gd2FrZS4NCj4gV2l0aCB0aGUgY3VycmVudCB2YWx1ZXMgUFNSMiBv
biB0aGlzIHBhbmVsIG9ubHkgbG9va2VkIHVzYWJsZSBiZWNhdXNlDQo+IHRoZSBjb25zdGFudCB3
YWtlIGZhaWx1cmVzIGtlcHQgZm9yY2luZyB0aGUgc2luayB0byByZXN5bmMuDQo+IA0KPiBNYWtl
IGZhc3Rfd2FrZV9saW5lcyBzdHJpY3RseSBncmVhdGVyIHRoYW4gaW9fd2FrZV9saW5lcyBvbiBk
aXNwbGF5DQo+IDIwKywNCj4gb3IsIHdoZW4gYWxyZWFkeSBhdCB0aGUgbWF4aW11bSwgcHV0IHRo
ZSBJTyBidWZmZXIgd2FrZSBvbmUgbGluZQ0KPiBiZWxvdw0KPiBpdC4gVXNlIHRoZSBsYXJnZXIg
b2YgdGhlIHR3byBpbiB0aGUgdmJsYW5rIGFuZCBndWFyZGJhbmQgY2hlY2tzLA0KPiB3aGljaA0K
PiBzbyBmYXIgb25seSBsb29rZWQgYXQgdGhlIElPIGJ1ZmZlciB3YWtlIG9uIGRpc3BsYXkgMjAr
Lg0KDQpUaGFuayB5b3UgZm9yIHRoZSBwYXRjaC4gSGF2ZSB5b3UgdHJpZWQgaW5jcmVhc2luZyB2
YmxhbmsvZ3VhcmRiYW5kDQphbG9uZT8gQWRkaXRpb24gdG8gdmJsYW5rIGFuZCBndWFyZGJhbmQg
eW91ciBjaGFuZ2UgaXMgYWxzbyBhZmZlY3RpbmcNCmhvdyBQU1IyL0FMUE0gaXMgY29uZmlndXJl
ZC4NCg0KPiANCj4gVGhpcyBpcyBvbmUgb2YgdGhlIHR3byBtYWNoaW5lcyBiZWhpbmQgdGhlIGVE
UCBQYW5lbCBSZXBsYXkgcXVpcmsgaW4NCj4gaW50ZWxfcXVpcmtzLmMgKERlbGwgWFBTIDE0IERB
MTQyNjAgLyBYUFMgMTYgREExNjI2MCkuIFRoZSBjaGFuZ2UNCj4gZG9lcw0KPiBub3QgbWFrZSBQ
YW5lbCBSZXBsYXkgb3IgUFNSMiBzZWxlY3RpdmUgdXBkYXRlcyB3b3JrIHRoZXJlIG9uIGl0cw0K
PiBvd246DQo+IHdpdGggdGhlIHdha2UgZml4ZWQgdGhlIHBhbmVsIHN0aWxsIG5ldmVyIHJlY2Vp
dmVzIGEgc2VsZWN0aXZlIHVwZGF0ZQ0KPiAoc2luayAweDIwMGEgc3RheXMgYXQgUFNSX1NUQVRF
IG9ubHkpIHdoaWxlIHRoZSBQU1IyIGVuZ2luZSBzaXRzIGluDQo+IFNVX1NUQU5EQlkgYW5kIGNv
bnN1bWVzIHRoZSBUUkFOU19QVVNIIGZyYW1lIGNoYW5nZSBldmVudHMuIFRoYXQgaXMNCj4gcmVw
b3J0ZWQgc2VwYXJhdGVseSBvbiBpbnRlbC1nZnguDQoNCllvdXIgY2hhbmdlIGlzIGNvbmZsaWN0
aW5nIHdpdGggdGhlIHNwZWMuIEl0IG1pZ2h0IGJlIGEgdHJhY2UgdG8gdGhlDQphY3R1YWwgcHJv
YmxlbS4gUGxlYXNlIG5vdGUgdGhhdCBpbyB3YWtlIHRpbWUgY2FuIGJlID49IGZhc3Rfd2FrZV90
aW1lDQphbmQgdGhlc2UgZm9ybXVsYXMgYXJlIGRpcmVjdGx5IHRha2VuIGZyb20gb3VyIGh3IHNw
ZWMuDQoNCglpb193YWtlX3RpbWUgPSBtYXgocHJlY2hhcmdlLCBpb19idWZmZXJfd2FrZV90aW1l
KGNydGNfc3RhdGUpKQ0KKyBwcmVhbWJsZSArIHBoeV93YWtlICsgdGZ3X2V4aXRfbGF0ZW5jeTsN
CglmYXN0X3dha2VfdGltZSA9IHByZWNoYXJnZSArIHByZWFtYmxlICsgcGh5X3dha2UgKw0KdGZ3
X2V4aXRfbGF0ZW5jeTsNCg0KSGF2ZSB5b3UgdHJpZWQgZmlkZGxpbmcgd2l0aCB0aGUgZmFzdCB3
YWtlIHN5bmMgcHVsc2UgY291bnQ/IFNlZQ0KZHJpdmVyL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2lu
dGVsX2RwX2F1Yy5jOmludGVsX2RwX2F1eF9md19zeW5jX2xlbi4NCg0KV2UgY291bGQgY29uc2lk
ZXIgdXNpbmcgc29tZXRoaW5nIGxpa2UgaW4gdGhpcyBwYXRjaCBhcyBhIHF1aXJrIGlmIGl0DQpz
b2x2ZXMgeW91ciBwcm9ibGVtLg0KDQpCUiwNCkpvdW5pIEjDtmdhbmRlcg0KDQo+IA0KPiBMaW5r
Og0KPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9pbnRlbC1nZngvMjAyNjA5MDIxNjIxNTAuNTg3
NzgtMS1qQG1ldGFyZWFsdHlpbmMuY2EvDQo+IExpbms6IGh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNr
dG9wLm9yZy9kcm0veGUva2VybmVsLy0vaXNzdWVzLzc1MjENCj4gTGluazogaHR0cHM6Ly9naXRs
YWIuZnJlZWRlc2t0b3Aub3JnL2RybS94ZS9rZXJuZWwvLS93b3JrX2l0ZW1zLzc2ODINCj4gQ2M6
IEpvdW5pIEjDtmdhbmRlciA8am91bmkuaG9nYW5kZXJAaW50ZWwuY29tPg0KPiBDYzogQW5pbWVz
aCBNYW5uYSA8YW5pbWVzaC5tYW5uYUBpbnRlbC5jb20+DQo+IENjOiBWaWxsZSBTeXJqw6Rsw6Qg
PHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPg0KPiBDYzogSmFuaSBOaWt1bGEgPGphbmku
bmlrdWxhQGludGVsLmNvbT4NCj4gQ2M6IGludGVsLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcN
Cj4gQ2M6IGludGVsLXhlQGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBTaWduZWQtb2ZmLWJ5OiBK
YWtlIFN0ZWlubWFuIDxqQG1ldGFyZWFsdHlpbmMuY2E+DQo+IC0tLQ0KPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9hbHBtLmMNCj4gYi9kcml2ZXJzL2dw
dS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2FscG0uYw0KPiBpbmRleCBmMTM4Mzc2Li5jMjQ0Mjcz
IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2FscG0u
Yw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2FscG0uYw0KPiBA
QCAtMjM4LDggKzIzOCwyOSBAQCBib29sIGludGVsX2FscG1fY29tcHV0ZV9wYXJhbXMoc3RydWN0
IGludGVsX2RwDQo+ICppbnRlbF9kcCwNCj4gwqAJCWlvX3dha2VfbGluZXMgPSBmYXN0X3dha2Vf
bGluZXMgPSBtYXhfd2FrZV9saW5lczsNCj4gwqANCj4gwqAJLyogQWNjb3JkaW5nIHRvIEJzcGVj
IGxvd2VyIGxpbWl0IHNob3VsZCBiZSBzZXQgYXMgNyBsaW5lcy4NCj4gKi8NCj4gLQljcnRjX3N0
YXRlLT5hbHBtX3N0YXRlLmlvX3dha2VfbGluZXMgPSBtYXgoaW9fd2FrZV9saW5lcywNCj4gNyk7
DQo+IC0JY3J0Y19zdGF0ZS0+YWxwbV9zdGF0ZS5mYXN0X3dha2VfbGluZXMgPQ0KPiBtYXgoZmFz
dF93YWtlX2xpbmVzLCA3KTsNCj4gKwlpb193YWtlX2xpbmVzID0gbWF4KGlvX3dha2VfbGluZXMs
IDcpOw0KPiArCWZhc3Rfd2FrZV9saW5lcyA9IG1heChmYXN0X3dha2VfbGluZXMsIDcpOw0KPiAr
DQo+ICsJLyoNCj4gKwkgKiBPbiBkaXNwbGF5IDIwKyB0aGUgZXh0ZW5kZWQgZmFzdCB3YWtlIHNl
cXVlbmNlIHByb2dyYW1tZWQNCj4gaW4NCj4gKwkgKiBBTFBNX0NUTCBoYXMgdG8gc3RhcnQgc3Ry
aWN0bHkgYmVmb3JlIHRoZSBJTyBidWZmZXIgd2FrZQ0KPiBwcm9ncmFtbWVkDQo+ICsJICogaW4g
UFNSMl9DVEwuIEJvdGggYXJlIGRlcml2ZWQgZnJvbSB0aGUgc2FtZSBwcmVjaGFyZ2UsDQo+IHBy
ZWFtYmxlLA0KPiArCSAqIFBIWSB3YWtlIGFuZCB0RlcgZXhpdCBsYXRlbmN5IGFib3ZlLCBzbyB0
aGV5IG5vcm1hbGx5IGVuZA0KPiB1cCBvbiB0aGUNCj4gKwkgKiBzYW1lIG51bWJlciBvZiBsaW5l
cy4gV2l0aCBlcXVhbCB2YWx1ZXMgdGhlDQo+ICsJICogTEcgcGFuZWwgKHNpbmsgT1VJIDAwOjIy
OmI5KSBpbiB0aGUgRGVsbCBYUFMgMTQvMTYNCj4gREExNDI2MC9EQTE2MjYwDQo+ICsJICogcmVw
b3J0cyBhIExpbmsgQ1JDIGVycm9yIG9uIGV2ZXJ5IGxpbmsgd2FrZS4gT25lIGV4dHJhDQo+IGZh
c3Qgd2FrZQ0KPiArCSAqIGxpbmUgaXMgZW5vdWdoIHRvIGZpeCBpdDsgd2hlbiB3ZSBhcmUgYWxy
ZWFkeSBhdCB0aGUNCj4gbWF4aW11bSBrZWVwDQo+ICsJICogdGhlIElPIGJ1ZmZlciB3YWtlIG9u
ZSBsaW5lIGJlbG93IHRoZSBmYXN0IHdha2UgaW5zdGVhZC4NCj4gKwkgKi8NCj4gKwlpZiAoRElT
UExBWV9WRVIoZGlzcGxheSkgPj0gMjAgJiYgZmFzdF93YWtlX2xpbmVzIDw9DQo+IGlvX3dha2Vf
bGluZXMpIHsNCj4gKwkJaWYgKGlvX3dha2VfbGluZXMgPCBtYXhfd2FrZV9saW5lcykNCj4gKwkJ
CWZhc3Rfd2FrZV9saW5lcyA9IGlvX3dha2VfbGluZXMgKyAxOw0KPiArCQllbHNlDQo+ICsJCQlp
b193YWtlX2xpbmVzID0gZmFzdF93YWtlX2xpbmVzIC0gMTsNCj4gKwl9DQo+ICsNCj4gKwljcnRj
X3N0YXRlLT5hbHBtX3N0YXRlLmlvX3dha2VfbGluZXMgPSBpb193YWtlX2xpbmVzOw0KPiArCWNy
dGNfc3RhdGUtPmFscG1fc3RhdGUuZmFzdF93YWtlX2xpbmVzID0gZmFzdF93YWtlX2xpbmVzOw0K
PiDCoA0KPiDCoAlyZXR1cm4gdHJ1ZTsNCj4gwqB9DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX3Bzci5jDQo+IGIvZHJpdmVycy9ncHUvZHJtL2k5MTUv
ZGlzcGxheS9pbnRlbF9wc3IuYw0KPiBpbmRleCBjMDkzM2RkLi5lYzgwYTJlIDEwMDY0NA0KPiAt
LS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX3Bzci5jDQo+ICsrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfcHNyLmMNCj4gQEAgLTE0NDMsNyArMTQ0
Myw4IEBAIHN0YXRpYyBib29sIHdha2VfbGluZXNfZml0X2ludG9fdmJsYW5rKHN0cnVjdA0KPiBp
bnRlbF9kcCAqaW50ZWxfZHAsDQo+IMKgCQl3YWtlX2xpbmVzID0gRElTUExBWV9WRVIoZGlzcGxh
eSkgPCAyMCA/DQo+IMKgCQkJcHNyMl9ibG9ja19jb3VudF9saW5lcyhjcnRjX3N0YXRlLQ0KPiA+
YWxwbV9zdGF0ZS5pb193YWtlX2xpbmVzLA0KPiDCoAkJCQkJwqDCoMKgwqDCoMKgIGNydGNfc3Rh
dGUtDQo+ID5hbHBtX3N0YXRlLmZhc3Rfd2FrZV9saW5lcykgOg0KPiAtCQkJY3J0Y19zdGF0ZS0+
YWxwbV9zdGF0ZS5pb193YWtlX2xpbmVzOw0KPiArCQkJbWF4KGNydGNfc3RhdGUtPmFscG1fc3Rh
dGUuaW9fd2FrZV9saW5lcywNCj4gKwkJCcKgwqDCoCBjcnRjX3N0YXRlLT5hbHBtX3N0YXRlLmZh
c3Rfd2FrZV9saW5lcyk7DQo+IMKgDQo+IMKgCS8qDQo+IMKgCSAqIEd1YXJkYmFuZCBoYXMgbm90
IGJlZW4gY29tcHV0ZWQgeWV0LCBzbyB3ZSBjb25zZXJ2YXRpdmVseQ0KPiBjaGVjayBpZiB0aGUN
Cj4gQEAgLTQ1NTYsNyArNDU1Nyw4IEBAIHZvaWQgaW50ZWxfcHNyX2NvbXB1dGVfY29uZmlnX2xh
dGUoc3RydWN0DQo+IGludGVsX2RwICppbnRlbF9kcCwNCj4gwqAJCXdha2VfbGluZXMgPSBESVNQ
TEFZX1ZFUihkaXNwbGF5KSA8IDIwID8NCj4gwqAJCQnCoMKgwqDCoCBwc3IyX2Jsb2NrX2NvdW50
X2xpbmVzKGNydGNfc3RhdGUtDQo+ID5hbHBtX3N0YXRlLmlvX3dha2VfbGluZXMsDQo+IMKgCQkJ
CQkJwqDCoMKgIGNydGNfc3RhdGUtDQo+ID5hbHBtX3N0YXRlLmZhc3Rfd2FrZV9saW5lcykgOg0K
PiAtCQkJwqDCoMKgwqAgY3J0Y19zdGF0ZS0+YWxwbV9zdGF0ZS5pb193YWtlX2xpbmVzOw0KPiAr
CQkJwqDCoMKgwqAgbWF4KGNydGNfc3RhdGUtDQo+ID5hbHBtX3N0YXRlLmlvX3dha2VfbGluZXMs
DQo+ICsJCQkJIGNydGNfc3RhdGUtDQo+ID5hbHBtX3N0YXRlLmZhc3Rfd2FrZV9saW5lcyk7DQo+
IMKgCWVsc2UNCj4gwqAJCXdha2VfbGluZXMgPSAwOw0KPiDCoA0KPiBAQCAtNDYxMiw3ICs0NjE0
LDggQEAgaW50IGludGVsX3Bzcl9taW5fZ3VhcmRiYW5kKHN0cnVjdA0KPiBpbnRlbF9jcnRjX3N0
YXRlICpjcnRjX3N0YXRlKQ0KPiDCoAkJd2FrZV9saW5lcyA9IERJU1BMQVlfVkVSKGRpc3BsYXkp
IDwgMjAgPw0KPiDCoAkJCcKgwqDCoMKgIHBzcjJfYmxvY2tfY291bnRfbGluZXMoY3J0Y19zdGF0
ZS0NCj4gPmFscG1fc3RhdGUuaW9fd2FrZV9saW5lcywNCj4gwqAJCQkJCQnCoMKgwqAgY3J0Y19z
dGF0ZS0NCj4gPmFscG1fc3RhdGUuZmFzdF93YWtlX2xpbmVzKSA6DQo+IC0JCQnCoMKgwqDCoCBj
cnRjX3N0YXRlLT5hbHBtX3N0YXRlLmlvX3dha2VfbGluZXM7DQo+ICsJCQnCoMKgwqDCoCBtYXgo
Y3J0Y19zdGF0ZS0NCj4gPmFscG1fc3RhdGUuaW9fd2FrZV9saW5lcywNCj4gKwkJCQkgY3J0Y19z
dGF0ZS0NCj4gPmFscG1fc3RhdGUuZmFzdF93YWtlX2xpbmVzKTsNCj4gwqAJZWxzZQ0KPiDCoAkJ
cmV0dXJuIDA7DQo+IMKgDQoNCg==
