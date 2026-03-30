Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FFD2FF494B
	for <intel-xe@archiver.kernel.org>; Mon, 30 Mar 2026 07:21:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FDC510E3E5;
	Mon, 30 Mar 2026 07:21:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DS+3PIGP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A103D10E3C1
 for <intel-xe@lists.freedesktop.org>; Mon, 30 Mar 2026 07:21:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774855296; x=1806391296;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=cTpxm5JLogMY/8TftdgWdrz8xntg/5o7zjx2TA+k9Ag=;
 b=DS+3PIGPjfsmbHfQgvU+YhuiSfwGoLfVMYFkxMoPOS8LP9tRVStBHCoO
 MHzC34EwHzRs0TrMSnGOYI77Ldg6fjL0LLX5vT9TVUeBAQjbWevYExHe6
 W7FkxUzTGgMQwdyJuAtBtUtebDsa32vKRspYwF/9pMWXckieomdTkdllN
 g9bYM3aE5LmAW39DUpOhyyce2gD2tSw7KJrbyY+iBv9RtwybKwBQW1pg1
 yeRHGt/dS9ypxee4+isdT2l7zCl5n40ST0knbnHy+K03+I/16MNK23X1p
 oATrhsHvhAeyTQo1Unh501P8l+MFWmvN44rr/L0uUWg/P4PfK0/6EamlC g==;
X-CSE-ConnectionGUID: auQza8F+Q06ptKzIbwiiVQ==
X-CSE-MsgGUID: O89IsigKSYearhpR9E9wnA==
X-IronPort-AV: E=McAfee;i="6800,10657,11743"; a="79442154"
X-IronPort-AV: E=Sophos;i="6.23,149,1770624000"; d="scan'208";a="79442154"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2026 00:21:36 -0700
X-CSE-ConnectionGUID: PIwV70VqSZqokmBvjdzsyg==
X-CSE-MsgGUID: c+/aiAqYQhatvk9hgGKYug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,149,1770624000"; d="scan'208";a="223107998"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2026 00:21:36 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 30 Mar 2026 00:21:35 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 30 Mar 2026 00:21:35 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.43)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 30 Mar 2026 00:21:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ClPCP1MQNFZ6CdiP95g19/SpnXYvKrUW+dlSbJ/GUFGlnfBw3khsuZfnbseRYb1nbSaGdO/bvAx020VeYUDubRndH9Jf3u+0NfnsnrhpTcKIfJ4jpt1DBo9ciq8NJgkrMZPKKrpav6DUUlYHlc+33oF7F3444JEhnCbJYuc/3YGQx+QiorNTDGiL/CpZNZQPIXcxtLuJoKq2tw49HCkLKUrxSs/m9eB7rEXx5XaF6o7dwlKdrYffJk3/BCgKaaKfqFNJ8gI9d0sOTNERwJLKhX0CJkmzuf/4RT4ddvlivC6/TqEVTsfuWK8jO9y9hB0+MYsdtQJvF2z2b+FiakfO8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cTpxm5JLogMY/8TftdgWdrz8xntg/5o7zjx2TA+k9Ag=;
 b=Id+oKLWK2ZNtHY3sK/l0KLWq24ZwkU7WGhrtFtKe7hNzknfQ/OX032tE8YTAir2kywPW8UVJe8TNbVLmi32gKjpYXpfdf/3dVE+mU8IMlzVObbEu2GMQlMfTR+II2ckO95J2Q0J2/cH3biXUuFt3HUgKCCOUxobNhMC/yqkjTJZGr/h/ddJmDNNlHswlVqcpTuXAeUPOl2yaTtsz4dluaJI6Fs6ttR2OFyGX0IrtrP1n6tdHEqdcvAdVirzalkraTLdufrdhGb64myCz1tCwNoWoCPvjuLW3AqK07gCihmGXmq+SE9qL7TE5zttkLSTX7B8hkzh3ZESVjwOb0F0/3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA3PR11MB8118.namprd11.prod.outlook.com (2603:10b6:806:2f1::13)
 by SJ5PPFE62D2CE76.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::85b) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Mon, 30 Mar
 2026 07:21:32 +0000
Received: from SA3PR11MB8118.namprd11.prod.outlook.com
 ([fe80::b2e3:da3f:6ad8:e9a5]) by SA3PR11MB8118.namprd11.prod.outlook.com
 ([fe80::b2e3:da3f:6ad8:e9a5%4]) with mapi id 15.20.9769.014; Mon, 30 Mar 2026
 07:21:32 +0000
From: "Gote, Nitin R" <nitin.r.gote@intel.com>
To: "Lin, Shuicheng" <shuicheng.lin@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH 5/5] drm/xe: Normalize double-underscore include guards to
 single-underscore
Thread-Topic: [PATCH 5/5] drm/xe: Normalize double-underscore include guards
 to single-underscore
Thread-Index: AQHctlmz1QWpSpb7ikOKBU9HoIe4SLXGvqBA
Date: Mon, 30 Mar 2026 07:21:31 +0000
Message-ID: <SA3PR11MB81183F59A452BF482C3338C9D052A@SA3PR11MB8118.namprd11.prod.outlook.com>
References: <20260317215732.2208976-7-shuicheng.lin@intel.com>
 <20260317215732.2208976-12-shuicheng.lin@intel.com>
In-Reply-To: <20260317215732.2208976-12-shuicheng.lin@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA3PR11MB8118:EE_|SJ5PPFE62D2CE76:EE_
x-ms-office365-filtering-correlation-id: d2b8e8c7-9a01-42e2-9f78-08de8e2cf7c5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|22082099003|56012099003|18002099003|38070700021;
x-microsoft-antispam-message-info: 2OIKWFKPpEgy1JNxHbiHD9P5knh1iW0xljEfxTTjawpjVHs/aqF9n7z4vsqnR0vY//6hqliIMfGtPeIL+4rKQY+QDZDH90pes1qccmKUfpoL5/mziiuu//w2/rty6dFpAybKMP+atHaYRsXlwQboMfakV7Q53gifRC+gSE3HFTC+aM4iqOiSC+nW4+GYp7vxrC8tnxdfAoz9Dr19hMdELvbjFXl1HvSkJHeW+7b0CySjsIgMz2A7bkucJKnUL1oiQnNICChAdSFkHcbhY1NByWvbxs+HeQmdSHuEMMcFeScH5DzlYfCcZa4B93btjH4OSRyyriSXNhr2o5jARLLhbLSLvKKoYxU7irx1gn/ukmnPxBxkPHe7B8ht5ngIEfA2SmjLl/WeTI8IQvkN6FelzTAsytriUEz9nQ2EscQ/nJXA7sJ4kPMW1pzBcxvlA9WE4qksGHjVeM1cMxGxam0R7NDhCpqV5AaQ/v/9tjwlZ7jSRtosZscHgKxQt3hv7NTPtqss6gOyqCj77keM4cIpQKjO+vbZpE2xg0UzvPi1p5lu3hJRSiyluqzbRzbAjeLLmtwnTKIbcOTS41L40xx8BTrBs/gSAbTvGI9F9TYK53hCDg9yBZnf6Z0fUkTs+rjWzQdKRj/dRg0vIpIszqTDHPW7iUdJlGhIQWJS7Y0x5WWjiy9G5NdTaLJ4lxsIv9wNT751MPMIXCHN9LmBeaVPR1utuCuDrBgQjJyGx9AeFYUtGGuvMF+FD/e/pQVS/fpGzETqVPEivE/jVQfbJixf54QyJY2vo06IlxPEn4L088E=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA3PR11MB8118.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(22082099003)(56012099003)(18002099003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?T3gyK2x3bm54dXlBdlNOTkhvYjlEZG53c3J3K2xKUVJNMGtPc1VIbkozNERK?=
 =?utf-8?B?dmRmUisyb3ovU2dNS2VPOGl4OHhTZE9HWFRGRmpyMWpoc0JScXFPWDIxZ3RR?=
 =?utf-8?B?c1ZZR2pZOFJSR1lsZ1VaLzNrMy9LckphWDJmQXZOMVcwVmNKRyt3UGhOZDBQ?=
 =?utf-8?B?anJSdnNNMWlmTFhwSEVJdkFJRUZrUy81dmdraVlLa2FDS0FHc0JubG9JN3E0?=
 =?utf-8?B?THNKUGkrVkJIWlNEVW96blYyZFlpcGJBUXNGMnZUbXc1enlSV2JWUktjVVJX?=
 =?utf-8?B?YzJIL0VCSXBnYmJIOWlOSUhTdGpvM2wzZmNncGFERmVhM1k2b05vUnpEMlNY?=
 =?utf-8?B?NmNnd1lCQ0RjMTNUcDJMZWFqRkhPME9lR3BDZHdnNEQ4eVpUK1ZqMGR0WHJ1?=
 =?utf-8?B?eU1nekhhSnJnN29HTVFWS05qQ1paQndXYWZmejdIV203MFhreURzTmlkVDdT?=
 =?utf-8?B?VmVaWVhTRTJRM1dEMDZJWWQ2SisrUzdOMzE4M3VGdE1qdzlaTGYwcmRDd2xi?=
 =?utf-8?B?YkRFcXdYSndsQnNkelRGbTIrbWczQ3lHSXppcWhmNmk3Rm5rOS9SaFpTdS9W?=
 =?utf-8?B?Tm9raGRudkh5MHlwZ09JemVZd1BJSU1wQ0xxNTBwRCtlbmVDMmdBbGVBaTJv?=
 =?utf-8?B?dG1WalltQmhERlFVa0R5bzFYdCtISGtZS2xjdmVzUld1d3RWNjRZYTdWb0Vn?=
 =?utf-8?B?b2ZKRzVMV0d5MFNIM3U1OElXdFdJNVM1V1hLejNWYUxyaVBwZlE2TTFNRGNz?=
 =?utf-8?B?TERScGMwZmlwVnB5YldPSGxHejI4YTRTaHVUZUI4Vm9tM3l1QzAzZ1VPWVhL?=
 =?utf-8?B?ZkVtQkhydUZneTlSb3k3RlR2WlhxMVFtcVNVZGNNc20zMThCZzNQakgrSEp6?=
 =?utf-8?B?c0swY0ErWU1KdGdnQS8wZHF0c1F4SnpmaThMUVZJYndqRkRNYTk3YWliMDBn?=
 =?utf-8?B?YkhRcXlsM1JEd2YzR0pXd3k3T2x3NnQva1dIQjVUZXQzamRsTVRGWEczUzk1?=
 =?utf-8?B?SUJSM3VKQzVLd20wU1I5UlExQWxvMzZ6WlBvU0EzSldFQy9pRmRJcFVrNVB4?=
 =?utf-8?B?aE1BQnE1L3l3aUdIb1BoUjlCdld0aThnSnZXK2taVDFISDA1dldvZ0E3NXBO?=
 =?utf-8?B?UlRub2FnM0RnYUVXeCtiZmU0dCsvNTI2Q1NZMVBLSGhCNjRqazI0RE83dVBV?=
 =?utf-8?B?d1VNamhtODZTTUsrR3pGTlpBa1RnN3I0aTRRTjJnNUVqcXQzblY2NldTdC9a?=
 =?utf-8?B?ZkNnbmtRSXNxNTVnclJQZFo4U0krR2Y0M0lCZUVycDl6RVJVSFh0S1hnN09L?=
 =?utf-8?B?RXBISUJOdFExZzVSU3NpZHUrdXdxRTE3L3lqMjl3bUp6QmZyd1RyMDNFV1JF?=
 =?utf-8?B?U1p2ZjdMWW0rQWQ3cDlRcStaVFpseWMrRDA5YVBoODhNdXhIZzd5bE5ENHZY?=
 =?utf-8?B?enloMmk0blhlTUd6RlhYSWswM0RwNHg2YTVnYUpDQ3cwZ2RISkdoaldIQ1FW?=
 =?utf-8?B?Z2pvRXdaTXFUY043amhhNElIY25qNEdwczZuQk1mbTJVQlo4blNWNGJ3Ykc0?=
 =?utf-8?B?YmV1SVNtR2kvMVlqbi9oSmUrb05VRFNwbWdBYW5TcDZrdTMwcWNYbElEalVt?=
 =?utf-8?B?cUlJdTZ2M2ljSElFaVMyMGRMTGdGTHJrWlM5TXZhS3VQZUxwOFE4OGJsbmhk?=
 =?utf-8?B?UEhWZFJjRjg5MmxrZmVlRVdUSk9oMWpXWG5qVkN3RCtURGFuRGJEbzVoQnZI?=
 =?utf-8?B?WG1yaEhBcVQ2YjdldW1jV2VuNFM1YVdZWVp0Zm9WMU04NzIwVURUUDEzWW9t?=
 =?utf-8?B?dFZnc0dkOHlHRmJZMVlWaFFBaUNGZ2V3cDh4TTZMOGVENEtpdjFyb3VPU1Ft?=
 =?utf-8?B?QW83VTdJc0Zyd21HL2lBanZobkVoQ05YaE1NYnU4eXBPeEhzR1NhdFZrckJ6?=
 =?utf-8?B?bm9YQlFoeEQwQzdSY3F2TkRnTjZTRHN1ZEM0L21qdTJtNTlIOVZuVThCSHpv?=
 =?utf-8?B?Vy94djVKWGozcUo1Q1lTalB4M3h3dGs2REFPM202VmUxdGwyV21rdHNNNHhF?=
 =?utf-8?B?RlFvRm50TGx5OTlTRlhQQis4NTNOdGltNVhkSHNyWUhReG1rcUFYUXIxT0V4?=
 =?utf-8?B?R2xZSFNCVjVraWdCblE3cmNndU5YZlpJR25MUE9sWGplY0huSUs3QU5NWXls?=
 =?utf-8?B?V1RFSGorZzhrZWoyOXZ0OFJTcVJXa3ZVODZtUU82bE1QNVlHNE5Gbnd6TStO?=
 =?utf-8?B?K0lmLzV3NWVISWhsallZUjBIV2hEWFdWMkxseU1CcVpqcmxpb3dPbVlmWUJz?=
 =?utf-8?B?S1RnYmE1dFN6bU1Td1VBNFJmRXhyREVHWFdwV0hXaU13bU1uV2x2UT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: lotbBPCj9fkHP/hMZ1wRVN3xxdR97sWkynhUNyD7AegZa93sbZjyhO69Aqb5yrbRQIPHuAxRGpjSdrKbYHlbrwdb2LtFytmWe8mRnnJLuviNlInA6Cq/jJX3PNtUzRvjDQJ6ivAiEIieBZ6vj3wLMv9cOk7Sl08W9Zxc/A26KIGK1vvMY8llTPCI/eqFtmwef6MV1KdtMjJ3ioiRGOtOIN3DxDfIeJPMJ7FD0SjCF1TI8P5ykD1LUKwBAMjzNPA2qEVPd+zSZJC8UOHQdgUthopPEoFRGA50mJ4578EHXBBGPZaKAElGqrmGABa+zjj6HJggEDXsfdFnNGNkH7EIJA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA3PR11MB8118.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2b8e8c7-9a01-42e2-9f78-08de8e2cf7c5
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Mar 2026 07:21:31.9574 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SyseFlMLjWneCzliTJIYvlgD0mM8YMTNZ8ohLLUEydmGg3C4vfrGIG2/cFU0jgRBeDB/Aacgi5zuTi+XWMc8wA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFE62D2CE76
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTGluLCBTaHVpY2hlbmcg
PHNodWljaGVuZy5saW5AaW50ZWwuY29tPg0KPiBTZW50OiBXZWRuZXNkYXksIE1hcmNoIDE4LCAy
MDI2IDM6MjcgQU0NCj4gVG86IGludGVsLXhlQGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBDYzog
TGluLCBTaHVpY2hlbmcgPHNodWljaGVuZy5saW5AaW50ZWwuY29tPjsgR290ZSwgTml0aW4gUg0K
PiA8bml0aW4uci5nb3RlQGludGVsLmNvbT4NCj4gU3ViamVjdDogW1BBVENIIDUvNV0gZHJtL3hl
OiBOb3JtYWxpemUgZG91YmxlLXVuZGVyc2NvcmUgaW5jbHVkZSBndWFyZHMgdG8NCj4gc2luZ2xl
LXVuZGVyc2NvcmUNCj4gDQo+IFNpeCBoZWFkZXJzIHVzZSBfX1hFXzxOQU1FPl9IX18gKGRvdWJs
ZS11bmRlcnNjb3JlIHByZWZpeCBhbmQgc3VmZml4KSBhcw0KPiB0aGVpciBpbmNsdWRlIGd1YXJk
cy4gTm9ybWFsaXplIHRoZW0gdG8gdGhlIHNpbmdsZS11bmRlcnNjb3JlIF9YRV88TkFNRT5fSF8N
Cj4gY29udmVudGlvbiB1c2VkIGJ5IHRoZSByZXN0IG9mIHRoZSB4ZSBjb2RlYmFzZS4NCj4gDQo+
IEZpbGVzIGZpeGVkOg0KPiAgIC0geGVfZXVfc3RhbGwuaDogICAgIF9fWEVfRVVfU1RBTExfSF9f
ICAgICAtPiBfWEVfRVVfU1RBTExfSF8NCj4gICAtIHhlX252bS5oOiAgICAgICAgICBfX1hFX05W
TV9IX18gICAgICAgICAgLT4gX1hFX05WTV9IXw0KPiAgIC0geGVfcHhwLmg6ICAgICAgICAgIF9f
WEVfUFhQX0hfXyAgICAgICAgICAtPiBfWEVfUFhQX0hfDQo+ICAgLSB4ZV9weHBfZGVidWdmcy5o
OiAgX19YRV9QWFBfREVCVUdGU19IX18gLT4gX1hFX1BYUF9ERUJVR0ZTX0hfDQo+ICAgLSB4ZV9w
eHBfc3VibWl0Lmg6ICAgX19YRV9QWFBfU1VCTUlUX0hfXyAgLT4gX1hFX1BYUF9TVUJNSVRfSF8N
Cj4gICAtIHhlX3B4cF90eXBlcy5oOiAgICBfX1hFX1BYUF9UWVBFU19IX18gICAtPiBfWEVfUFhQ
X1RZUEVTX0hfDQo+IA0KPiBObyBmdW5jdGlvbmFsIGNoYW5nZS4NCj4gDQo+IFN1Z2dlc3RlZC1i
eTogTml0aW4gR290ZSA8bml0aW4uci5nb3RlQGludGVsLmNvbT4NCj4gQXNzaXN0ZWQtYnk6IEdp
dEh1YiBDb3BpbG90OmNsYXVkZS1vcHVzLTQuNg0KPiBTaWduZWQtb2ZmLWJ5OiBTaHVpY2hlbmcg
TGluIDxzaHVpY2hlbmcubGluQGludGVsLmNvbT4NCj4gLS0tDQo+ICBkcml2ZXJzL2dwdS9kcm0v
eGUveGVfZXVfc3RhbGwuaCAgICB8IDQgKystLQ0KPiAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX252
bS5oICAgICAgICAgfCA0ICsrLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9weHAuaCAgICAg
ICAgIHwgNiArKystLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9weHBfZGVidWdmcy5oIHwg
NiArKystLS0NCj4gZHJpdmVycy9ncHUvZHJtL3hlL3hlX3B4cF9zdWJtaXQuaCAgfCA2ICsrKy0t
LQ0KPiAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX3B4cF90eXBlcy5oICAgfCA2ICsrKy0tLQ0KPiAg
NiBmaWxlcyBjaGFuZ2VkLCAxNiBpbnNlcnRpb25zKCspLCAxNiBkZWxldGlvbnMoLSkNCj4gDQo+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZXVfc3RhbGwuaCBiL2RyaXZlcnMv
Z3B1L2RybS94ZS94ZV9ldV9zdGFsbC5oDQo+IGluZGV4IGQxYzc2ZTUwMzc5OS4uODQyYmVmOWY2
ODcyIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZXVfc3RhbGwuaA0KPiAr
KysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZXVfc3RhbGwuaA0KPiBAQCAtMyw4ICszLDggQEAN
Cj4gICAqIENvcHlyaWdodCDCqSAyMDI1IEludGVsIENvcnBvcmF0aW9uDQo+ICAgKi8NCj4gDQo+
IC0jaWZuZGVmIF9fWEVfRVVfU1RBTExfSF9fDQo+IC0jZGVmaW5lIF9fWEVfRVVfU1RBTExfSF9f
DQo+ICsjaWZuZGVmIF9YRV9FVV9TVEFMTF9IXw0KPiArI2RlZmluZSBfWEVfRVVfU1RBTExfSF8N
Cj4gDQo+ICAjaW5jbHVkZSAieGVfZ3RfdHlwZXMuaCINCj4gICNpbmNsdWRlICJ4ZV9zcmlvdi5o
Ig0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX252bS5oIGIvZHJpdmVycy9n
cHUvZHJtL3hlL3hlX252bS5oIGluZGV4DQo+IGZkMzQ2N2FkMzVhNC4uYjE0NzIyMTAzZjgxIDEw
MDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfbnZtLmgNCj4gKysrIGIvZHJpdmVy
cy9ncHUvZHJtL3hlL3hlX252bS5oDQo+IEBAIC0zLDggKzMsOCBAQA0KPiAgICogQ29weXJpZ2h0
KGMpIDIwMTktMjAyNSBJbnRlbCBDb3Jwb3JhdGlvbi4gQWxsIHJpZ2h0cyByZXNlcnZlZC4NCj4g
ICAqLw0KPiANCj4gLSNpZm5kZWYgX19YRV9OVk1fSF9fDQo+IC0jZGVmaW5lIF9fWEVfTlZNX0hf
Xw0KPiArI2lmbmRlZiBfWEVfTlZNX0hfDQo+ICsjZGVmaW5lIF9YRV9OVk1fSF8NCj4gDQo+ICBz
dHJ1Y3QgeGVfZGV2aWNlOw0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94
ZV9weHAuaCBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9weHAuaCBpbmRleA0KPiA3MWEyMzI4MGI5
MDAuLjRmYjZlMGFmZmZkMiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3B4
cC5oDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9weHAuaA0KPiBAQCAtMyw4ICszLDgg
QEANCj4gICAqIENvcHlyaWdodChjKSAyMDI0LCBJbnRlbCBDb3Jwb3JhdGlvbi4gQWxsIHJpZ2h0
cyByZXNlcnZlZC4NCj4gICAqLw0KPiANCj4gLSNpZm5kZWYgX19YRV9QWFBfSF9fDQo+IC0jZGVm
aW5lIF9fWEVfUFhQX0hfXw0KPiArI2lmbmRlZiBfWEVfUFhQX0hfDQo+ICsjZGVmaW5lIF9YRV9Q
WFBfSF8NCj4gDQo+ICAjaW5jbHVkZSA8bGludXgvdHlwZXMuaD4NCj4gDQo+IEBAIC0zMiw0ICsz
Miw0IEBAIGludCB4ZV9weHBfa2V5X2Fzc2lnbihzdHJ1Y3QgeGVfcHhwICpweHAsIHN0cnVjdCB4
ZV9ibw0KPiAqYm8pOyAgaW50IHhlX3B4cF9ib19rZXlfY2hlY2soc3RydWN0IHhlX3B4cCAqcHhw
LCBzdHJ1Y3QgeGVfYm8gKmJvKTsgIGludA0KPiB4ZV9weHBfb2JqX2tleV9jaGVjayhzdHJ1Y3Qg
ZHJtX2dlbV9vYmplY3QgKm9iaik7DQo+IA0KPiAtI2VuZGlmIC8qIF9fWEVfUFhQX0hfXyAqLw0K
PiArI2VuZGlmIC8qIF9YRV9QWFBfSF8gKi8NCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS94ZS94ZV9weHBfZGVidWdmcy5oDQo+IGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3B4cF9kZWJ1
Z2ZzLmgNCj4gaW5kZXggOTg4NDY2YWFkNTBiLi4yOTk3ZGUwYzkwYjIgMTAwNjQ0DQo+IC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9weHBfZGVidWdmcy5oDQo+ICsrKyBiL2RyaXZlcnMvZ3B1
L2RybS94ZS94ZV9weHBfZGVidWdmcy5oDQo+IEBAIC0zLDExICszLDExIEBADQo+ICAgKiBDb3B5
cmlnaHQgwqkgMjAyNCBJbnRlbCBDb3Jwb3JhdGlvbg0KPiAgICovDQo+IA0KPiAtI2lmbmRlZiBf
X1hFX1BYUF9ERUJVR0ZTX0hfXw0KPiAtI2RlZmluZSBfX1hFX1BYUF9ERUJVR0ZTX0hfXw0KPiAr
I2lmbmRlZiBfWEVfUFhQX0RFQlVHRlNfSF8NCj4gKyNkZWZpbmUgX1hFX1BYUF9ERUJVR0ZTX0hf
DQo+IA0KPiAgc3RydWN0IHhlX3B4cDsNCj4gDQo+ICB2b2lkIHhlX3B4cF9kZWJ1Z2ZzX3JlZ2lz
dGVyKHN0cnVjdCB4ZV9weHAgKnB4cCk7DQo+IA0KPiAtI2VuZGlmIC8qIF9fWEVfUFhQX0RFQlVH
RlNfSF9fICovDQo+ICsjZW5kaWYgLyogX1hFX1BYUF9ERUJVR0ZTX0hfICovDQo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfcHhwX3N1Ym1pdC5oDQo+IGIvZHJpdmVycy9ncHUv
ZHJtL3hlL3hlX3B4cF9zdWJtaXQuaA0KPiBpbmRleCBjOWVmZGEwMmY0YjAuLmRiYmJlNmI5MmJi
MiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3B4cF9zdWJtaXQuaA0KPiAr
KysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfcHhwX3N1Ym1pdC5oDQo+IEBAIC0zLDggKzMsOCBA
QA0KPiAgICogQ29weXJpZ2h0KGMpIDIwMjQsIEludGVsIENvcnBvcmF0aW9uLiBBbGwgcmlnaHRz
IHJlc2VydmVkLg0KPiAgICovDQo+IA0KPiAtI2lmbmRlZiBfX1hFX1BYUF9TVUJNSVRfSF9fDQo+
IC0jZGVmaW5lIF9fWEVfUFhQX1NVQk1JVF9IX18NCj4gKyNpZm5kZWYgX1hFX1BYUF9TVUJNSVRf
SF8NCj4gKyNkZWZpbmUgX1hFX1BYUF9TVUJNSVRfSF8NCj4gDQo+ICAjaW5jbHVkZSA8bGludXgv
dHlwZXMuaD4NCj4gDQo+IEBAIC0xOSw0ICsxOSw0IEBAIGludCB4ZV9weHBfc3VibWl0X3Nlc3Np
b25fdGVybWluYXRpb24oc3RydWN0IHhlX3B4cCAqcHhwLA0KPiB1MzIgaWQpOyAgaW50IHhlX3B4
cF9zdWJtaXRfc2Vzc2lvbl9pbnZhbGlkYXRpb24oc3RydWN0DQo+IHhlX3B4cF9nc2NfY2xpZW50
X3Jlc291cmNlcyAqZ3NjX3JlcywNCj4gIAkJCQkgICAgICAgdTMyIGlkKTsNCj4gDQo+IC0jZW5k
aWYgLyogX19YRV9QWFBfU1VCTUlUX0hfXyAqLw0KPiArI2VuZGlmIC8qIF9YRV9QWFBfU1VCTUlU
X0hfICovDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfcHhwX3R5cGVzLmgN
Cj4gYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfcHhwX3R5cGVzLmgNCj4gaW5kZXggZjlhOGMzMjNi
MDQwLi40MmNlYTQxYjIxYzQgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9w
eHBfdHlwZXMuaA0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfcHhwX3R5cGVzLmgNCj4g
QEAgLTMsOCArMyw4IEBADQo+ICAgKiBDb3B5cmlnaHQoYykgMjAyNCwgSW50ZWwgQ29ycG9yYXRp
b24uIEFsbCByaWdodHMgcmVzZXJ2ZWQuDQo+ICAgKi8NCj4gDQo+IC0jaWZuZGVmIF9fWEVfUFhQ
X1RZUEVTX0hfXw0KPiAtI2RlZmluZSBfX1hFX1BYUF9UWVBFU19IX18NCj4gKyNpZm5kZWYgX1hF
X1BYUF9UWVBFU19IXw0KPiArI2RlZmluZSBfWEVfUFhQX1RZUEVTX0hfDQoNClJldmlld2VkLWJ5
OiBOaXRpbiBHb3RlIDxuaXRpbi5yLmdvdGVAaW50ZWwuY29tPg0KDQo+IA0KPiAgI2luY2x1ZGUg
PGxpbnV4L2NvbXBsZXRpb24uaD4NCj4gICNpbmNsdWRlIDxsaW51eC9pb3N5cy1tYXAuaD4NCj4g
QEAgLTEzMiw0ICsxMzIsNCBAQCBzdHJ1Y3QgeGVfcHhwIHsNCj4gIAl1MzIgbGFzdF9zdXNwZW5k
X2tleV9pbnN0YW5jZTsNCj4gIH07DQo+IA0KPiAtI2VuZGlmIC8qIF9fWEVfUFhQX1RZUEVTX0hf
XyAqLw0KPiArI2VuZGlmIC8qIF9YRV9QWFBfVFlQRVNfSF8gKi8NCj4gLS0NCj4gMi40My4wDQoN
Cg==
