Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AEA9CCD195
	for <intel-xe@archiver.kernel.org>; Thu, 16 Oct 2025 14:54:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B7C410EA04;
	Thu, 16 Oct 2025 14:54:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ibmFfdpj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2ADDD10EA04
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Oct 2025 14:54:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760626464; x=1792162464;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=HEJ/gumxO9GzmpkOUWBEmdw6jxYghlIHAydzcEyUxJw=;
 b=ibmFfdpjqtTIAlNKy5ag84Uh77KxCy36laMjLtaPJhNPM/MbrDRs/bVR
 ST1TdA1pMrk/ByUJsFHRW+X19qR5QylfgtkGuZPVxBepdi/C4Iu8Oughy
 PmSgJPYpH596NH//xXhFDfy/8bu+jrunugU9kJk4ggaxiSYtZmtOY425f
 dM4wYd5YZTIwDO91HNAT1GPUkI7bTYevvq69pb+geHex6M/9N0vd4JyCW
 SyT+qHunxs9T++KsOsw7Gr86tg4Vx9Cg6qewEXeDRFnJATJXdCHmBnk9h
 eOpNqp4U0G3wXVS817FehIUP3Ht5bOHbpCGWv45ZkuVE0F13gL/Pzxfbz g==;
X-CSE-ConnectionGUID: 07hoA1A8TKqSb83ma/1YNw==
X-CSE-MsgGUID: Z7yRUP5KSVW1kHafpEO0kQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11584"; a="73422094"
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; d="scan'208";a="73422094"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2025 07:54:24 -0700
X-CSE-ConnectionGUID: BVmW61SoTo2tC6LlrYWe7A==
X-CSE-MsgGUID: q9dVAPtZRBO8QVpFrn5+Ew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; d="scan'208";a="186746922"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2025 07:54:24 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 16 Oct 2025 07:54:23 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 16 Oct 2025 07:54:23 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.13) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 16 Oct 2025 07:54:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JzKFfLCMww08LeC9yzAQARBdRmmElhr9UOso0ndIuTAbjpOALjhnV+eHdaI9F8O4KH38lGL3Szmj56pJXLdZkV0YVl8pSfHC4IYPYT6cFVxH4iuGZ6KvNEUIvYS3lKE9rVGOvbru8vg/GjcBmGNQq5dF8dmTW3Th9eP935jVVHpFWeOWNM0W+L8k+DDsM4Ss/HnoM3TdEUMYlkUMXMv2yTxsBuWgmHjVfw+ZYm2kb3gQoEtl3OukH6/8IHh2yD5XImtY47IQyEa3MWozePNd0CpXqW5i6n+O2b407XTHF3G2dAyfI4FdAg/b6dlIcwagEcUJ5LoOCX39uDBAinL7hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HEJ/gumxO9GzmpkOUWBEmdw6jxYghlIHAydzcEyUxJw=;
 b=StJAtzecD1ry0ax/QR6zmMf6WHHB/wOCuwXFesHQXxMQaYYy6oTlj3WXTUP9nZC4idx1PViCQ2xo4DrLu+kr3O2Y0Hp05iJnZE/WeMB0X+mRDleGhtI34EZaDOkOJCbgl4BHOvpJw/MI0lqTtvlPKC15UutgimH3CYDVsfVyvhZc69hoAMItdRAhOfkXmoNO8NON3zhRwoMpVjczIxzl1cj90V5UYysaR1j4Yn0j0HsCx6Cv/hO40YQDSAGFkIk9WTRm3Emo3FMxBI+MJtBsIgfBs5UhB+ZVhLn84r2vJvyc9g9FDCwDJG2slZCwNiuXetvxQnbS1FovPGLz2znYwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5456.namprd11.prod.outlook.com (2603:10b6:5:39c::14)
 by IA3PR11MB8895.namprd11.prod.outlook.com (2603:10b6:208:579::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.10; Thu, 16 Oct
 2025 14:54:20 +0000
Received: from DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad]) by DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad%5]) with mapi id 15.20.9228.012; Thu, 16 Oct 2025
 14:54:20 +0000
From: "Lin, Shuicheng" <shuicheng.lin@intel.com>
To: "Auld, Matthew" <matthew.auld@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Subject: RE: [PATCH v2 3/3] drm/xe: Change return type of detect_bar2_dgfx()
 from s64 to u64
Thread-Topic: [PATCH v2 3/3] drm/xe: Change return type of detect_bar2_dgfx()
 from s64 to u64
Thread-Index: AQHcOXE3rxarWU8riEWSYojbHuMHGrTEk7sAgABSXwA=
Date: Thu, 16 Oct 2025 14:54:20 +0000
Message-ID: <DM4PR11MB5456371E53090E765D3383F5EAE9A@DM4PR11MB5456.namprd11.prod.outlook.com>
References: <20251009230239.2830207-5-shuicheng.lin@intel.com>
 <20251009230239.2830207-8-shuicheng.lin@intel.com>
 <d177de7d-a98a-43ea-88ff-f52d8349d22a@intel.com>
In-Reply-To: <d177de7d-a98a-43ea-88ff-f52d8349d22a@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5456:EE_|IA3PR11MB8895:EE_
x-ms-office365-filtering-correlation-id: 085317f8-67e4-425a-a4cd-08de0cc3e387
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?YTN5VUkveWU0K1hhVWd3SWkrQm9BN3M5OTBZZlgxTlZtMk9tZjhlMGZpY3B1?=
 =?utf-8?B?d0pZdWxSdzcrdjhkS1pWMmdMQndJaUdvcjZXaXo1WURSV2xJQzBxaUhQcTVm?=
 =?utf-8?B?TzVNSHNuekJRNGZINzdldFRaNEphbW5Nc0dLOHBpRk1wSS8wVTY0VXVtcngy?=
 =?utf-8?B?TDZIMUp4b0RSTU1TbUgwOVNWTnRCV1UraFRNUkEyNUJQbHoxRSsvZUJ1TVh1?=
 =?utf-8?B?VzgycVR0VEFqcndjLy9ZVkMvY0xvbDl5K05Kd0JwSUV4NEs2aU5CVkUyd3RR?=
 =?utf-8?B?RGVDVnZBaGNhTDc4RUZvQ2hraXZBaXNpOWlXZUw5ZTBTUTVNc3FpaDhOOUFW?=
 =?utf-8?B?QlRNUm1WNUhvRGtsaXNsSWtyUnZOK2I4SWtCWDR0R3l1Mm4vRlVSTlZycHpp?=
 =?utf-8?B?OThYR2dwRE15eE5pdENaMHVWeGVWVk5Iam1vSG4zYVBmaUVzRWt5amZLbHg5?=
 =?utf-8?B?TUpMVmVPWEgvZWw1ZWU3cDA3V09LK3R0U3lGNVZCaTM5WlBHR1BLeHNESUFC?=
 =?utf-8?B?c0UxZ3hZd0Z2bmlxNDREZHA3ODNLQ0N0STNrM05sSFJuQkJMbmUweVFuVmN1?=
 =?utf-8?B?UGJXUnFheE5kUGxjeDhiOHZCNlNLM2tMVEplSWR1ZDlrTnVEdFg3ZEpZbk1r?=
 =?utf-8?B?MU4xNkxCdXpMaURCNnFDUFlaUHVTQ0QrY3FwNld2Wkh4QU5WdXkxQmRIb29N?=
 =?utf-8?B?OXhpNC9tU1hJRklFekJrYVhDTU1RQWZ5SU5PYnUrYkh0REY1QU44VndySjJt?=
 =?utf-8?B?M2NLalJJNGFGTkRJNm1mb2pRbUNPbEpVemV4My80TVBZQk5ia2w0TjExRENC?=
 =?utf-8?B?ZEp1RTQzUGJLL1FVYUFjMGhRbFU3bjVxNThsZkVwQWpPQ1o0THBKSFFqTHoz?=
 =?utf-8?B?Wmp2VWl1dks5ZmN0c1ZueDNWWmU0eVgyOHp6K2dkK3FTeTNyZ0pQdlkwc2lw?=
 =?utf-8?B?c1Vyd3VqcmtacTlUaG1IaUtyNU0yQW5URFd2RXk2TjFKUlBLcFlMOFZZa0dO?=
 =?utf-8?B?SzNlRGtVYzQ0dDdYL2dvRVlZT0Q3UzZPTzNobytOTDUvaVo3Z1BaSmZVRUU3?=
 =?utf-8?B?MEFxcnJ0b1hKbm9qOXBSa0lZcmdrOFp3bm9xcUIrWkxVZ0hmSUtwdHEzd0Fi?=
 =?utf-8?B?N3FhOFIydVFkMGFTMEhIV3FVWW90UHpDR09nNkZRa3B3bTd1VmhZZ1NRMFVl?=
 =?utf-8?B?Tmwrd2tFRXdlM1UzQ2t1WGN5dXBYazJTaXVrdDNHdmtuSWR3NFhpRm9raHZU?=
 =?utf-8?B?dlRoS0o3dmV0ekJsMlloME1RRzVFTzJHcll1NnhUSy9Sa01tUFBoMkg1ZlVi?=
 =?utf-8?B?WkF1QzUydVc3RFNNQVJtd3hJV3YrcVpzVjFiTTlxZzV2SnM3ejM0cGZRSUl5?=
 =?utf-8?B?MzBvU2lSWG1DOE8wTHV3ZU9iNmJvdC84WDF3MTMyNlFrOFBtOEtxbnQzTW9G?=
 =?utf-8?B?dm12OGcyRG1UQkNWa0hvaUxGeVpWaUFwNlFLUTM5OVpYV3liR0t6elV5Z1pN?=
 =?utf-8?B?SHVlVUd5NS9hT25zVE5uRkRGbU1TVm45NnMvaXhlQkovU1NkdlVqT1BXOFFo?=
 =?utf-8?B?d0xkSDlKL1pFZFJIVmhjaGl4RG9uRVFaVVBMZWIvNnNNcS9zRlZTaUY5UDlU?=
 =?utf-8?B?dmRzcjNFQ2dNcUdsaDhIZzM4cDc4NElhZHNnM1dqTExGWlpLWjhRc0JJQWtD?=
 =?utf-8?B?REZWa0haWFFKRTRubUZlUTZ4aUY4NWdha2tNTVJSVXIvRGh3ZEZ4WWUrTkdQ?=
 =?utf-8?B?MkVHb0ZTRGljWWltdjFHRzc3eXlHaVdnWU1JUml5SUluSk5TWlVleFlxYjBH?=
 =?utf-8?B?ejB0Zm9hUmZVYlQ2K1ZoR0JVNUk2M3JERlpuZStvOXVzekVlK2pMYlpRSEcv?=
 =?utf-8?B?NWJPSEt3OHY4bkhmWVVYVW4yU0k2SCtYZGVudXJkVk12N3doWnlXT3U2dG1D?=
 =?utf-8?B?OW9KMXpqN0dDV3NPT1dIMUhEM3lOSjh2ei9KUGdaM1NuSmVkekVWU1dHck1W?=
 =?utf-8?B?RktxYlVieFRRPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5456.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ME9lNnNDMGdLN3ZKUVZJalUya0twNHE2b3BUUngwOWUvMGJHK29Fams2eVQy?=
 =?utf-8?B?KzIzSUQvd080anYvUnQrWkpMTEd3VVBhREYvQldJWnAzS3Z2RTdCRm5VdHor?=
 =?utf-8?B?MUtHNDdDS09DNWl1YW1FK0hSN2VZbmxwQmJNdjd5Y1U1T29HNVNRZTFldTI0?=
 =?utf-8?B?aEdBNUw5RWVrQW1CZlo4Z2pGRytTbVNXWGErRFFZTmkzdHZZRER5aXVRdTVW?=
 =?utf-8?B?R1c4d1dHUDAveEVRV2NmZHJiWXdtb2ZGV1h1V2ZOQTg0czUyMFEyeFpWYllT?=
 =?utf-8?B?WWpYZ3RLc2xPMmpMWGFkS0VwN3VGV281WDlGOXZzZUw3MTBjbjZyeTF4ZGFF?=
 =?utf-8?B?bTNNTWw1NWhmZ3pJbzRwOUphWW1UM1NubzdyOCtYa2tkU1hzTWZOQngrZ1pR?=
 =?utf-8?B?Nk5xRllGNDVNQ1BtNGpUSkVwNDNjVHllL3pKMndwOGZ2UU53Y3YrT3VYcndF?=
 =?utf-8?B?UkxTQ0pLc0dubmo0aWVSNlpnSjgzVG1ONzR3d2tkaE01Rzl0U2p4WGY0aysw?=
 =?utf-8?B?TjIwQnZ4blg3d1VPQThkVFVtZ01jS0p2a2JhaEYyY3B2S01GZDFDUzIzdHNq?=
 =?utf-8?B?OWMrN1hIRmF6L3ZUNlhxWGdUY0NObEZYWURZOVF2TmpNN2tTcFZXeStab2NN?=
 =?utf-8?B?Rnd5Z2VvQ2NtZDFEL0hvTFAwdVcxZE51a1BiOXBxVmR1d1I1dDY1cDl6WkZh?=
 =?utf-8?B?VkhvNmF4Yys0UHRKVUVzbTRCR2VXNGdBZjRwTmthb2dySFhIazVXUnNOQ0pv?=
 =?utf-8?B?cE5DZzAvZXIwNVhXLytwOHE0Uk93eXplKzhQVTVJNmM2QUc5dEw2N3V2aVhQ?=
 =?utf-8?B?WlBwREI2NnYvZ1pKampMWlZhWXZZYWtyWUh3a2tKNFpnamlpTTJSNmQvN1E4?=
 =?utf-8?B?U2dQOUs1bUpaQ3N0NFdaL2tzSmRwSFZTc0VQVUM1OWtiR0dRTHR1STNnR2hU?=
 =?utf-8?B?RERHbEorcm5BM1JKdUptOUY3WDMyc0RFdWVQdExlM1VaV3dVYkpRaUdvUTA4?=
 =?utf-8?B?Q1JCS29hN2ZvTzdHQkNpd0R4aGZieWRoeFZyU1NYSmhXRlZrVmpuaXdMRytH?=
 =?utf-8?B?Sk90Y2VoOUIyMHZ1eVYwYUExSTRjOUFNTzFKT29kM3hQVW9RakRHOElyTTEx?=
 =?utf-8?B?RndQamwvQXBOMVRMb0hpMUVUdnRDZGk4WWZ3bS9UUFFiVzc0RWJ2NnJUTHJT?=
 =?utf-8?B?SXcvMkc4RVhQN2VOV0QwclN2K0JxSDRtaStSbEZOcHh6bXUwb2gza0xUOUpV?=
 =?utf-8?B?VXNEbGJ1QUExcGVaNFo4R3JYWkVZb0dnT3VKTDNXR3JLUEU5ckRseWszM3hQ?=
 =?utf-8?B?NWNwZ01meVRZZ3d3WHpoRmdQL0lDb0J3anRqSEhnRE1RcmI1TDNCV1Bjc0Vm?=
 =?utf-8?B?dDBSVmw4SGdLejEyb2FkVll0TTV5aVJKS1g0b0N0dU00emhvT3ExMkdkQ0lH?=
 =?utf-8?B?dm1EUWVpUlVSL1pseHYzR3pVcmF2eHBZTDd2MkcrVWhmTU0rRXR1Vk4vVmJw?=
 =?utf-8?B?TElSVFlpUmx6N2hickNRKy9yZ1lGNmw4Zys5M3U2cG5GYXhuWVVsbHVYRWJz?=
 =?utf-8?B?RXBGMzlTeHpVait5Z1RBVXNRN0lUYkswYTNxNE1ZL3RobHFWSVloSVp3WXlo?=
 =?utf-8?B?WFo1TnlPNW9yREt2MWFoYmFrcVpmQlRVdzZEM1h5Z0VXNW8xWlYyb3QrMnRv?=
 =?utf-8?B?OU5WN0dHdHVjZG9FRWpBSVJaWEFGMGhxekVWb1MrcU5HQ0w1MFpmbUNCRDgv?=
 =?utf-8?B?VG1MaWxtcEx4S3FBVzduVExFSDloRjUrdHpRalRReVpmY2lqazVGNkVKek5S?=
 =?utf-8?B?eDBZS1dSckxkekRyWG9lcWVERVJkaktIWHY0RDRJT24xVGl0elNXQ2VaZCt1?=
 =?utf-8?B?REZaVkNuVXpJNnhJSmFER0ZDc1V3Skc5cDd3eFQ3N3M5K2o0UHJwL1lBWjJ6?=
 =?utf-8?B?Y29MOVlRWlZ1ck1NRUJINHlKcWNlMW5FK0txUlY3TDFHTUtKQVE0S1FMSzFu?=
 =?utf-8?B?bVB3ZGhwcFFFWksvTEJYREhsdHY1ajQvSEo5d0NWYWVRMDBzbC95NXhSbnV5?=
 =?utf-8?B?c1RDbDBNbTJ3eEM1aXBrRjJiV3FEUkRvNWliYnF4MnZER1VqNWpKcC9OVnhm?=
 =?utf-8?Q?wKSd763JoFFojEPpP2PiiVTEw?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5456.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 085317f8-67e4-425a-a4cd-08de0cc3e387
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Oct 2025 14:54:20.8521 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HrLMhhNYGIqG5JGAxZ5KwUjL894T24AdYd/I4DCNdqZj/lJt8BHXXrOfLr7+JQ3Xxu0RqqsvbISQ9ZrJ8K81rw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB8895
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

T24gVGh1LCBPY3QgMTYsIDIwMjUgMjo1OCBBTSBNYXR0aGV3IEF1bGQgd3JvdGU6DQo+IE9uIDEw
LzEwLzIwMjUgMDA6MDIsIFNodWljaGVuZyBMaW4gd3JvdGU6DQo+ID4gVGhlIGZ1bmN0aW9uIG5l
dmVyIHJldHVybnMgYSBuZWdhdGl2ZSB2YWx1ZSwgYW5kIHRoZSByZXR1cm4gdmFsdWUgaXMNCj4g
PiBhc3NpZ25lZCB0byBhIHU2NCB2YXJpYWJsZS4gVXNlIHU2NCBmb3IgYmV0dGVyIHR5cGUgY29y
cmVjdG5lc3MgYW5kDQo+ID4gY2xhcml0eS4NCj4gPg0KPiA+IHYyOiBhZGQgYXNzZXJ0IHRvIGNh
dGNoIHRoZW9yZXRpY2FsIG5lZ2F0aXZlIG9yIHplcm8gc3RvbGVuIHNpemUuDQo+ID4gKFJvZHJp
Z28pDQo+ID4NCj4gPiBDYzogUm9kcmlnbyBWaXZpIDxyb2RyaWdvLnZpdmlAaW50ZWwuY29tPg0K
PiA+IFNpZ25lZC1vZmYtYnk6IFNodWljaGVuZyBMaW4gPHNodWljaGVuZy5saW5AaW50ZWwuY29t
Pg0KPiA+IC0tLQ0KPiA+ICAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX3R0bV9zdG9sZW5fbWdyLmMg
fCA0ICsrKy0NCj4gPiAgIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDEgZGVsZXRp
b24oLSkNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfdHRtX3N0
b2xlbl9tZ3IuYw0KPiA+IGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3R0bV9zdG9sZW5fbWdyLmMN
Cj4gPiBpbmRleCA5YjAwYmRjOGVmMWEuLmUzNjhiMmEzNmJhYyAxMDA2NDQNCj4gPiAtLS0gYS9k
cml2ZXJzL2dwdS9kcm0veGUveGVfdHRtX3N0b2xlbl9tZ3IuYw0KPiA+ICsrKyBiL2RyaXZlcnMv
Z3B1L2RybS94ZS94ZV90dG1fc3RvbGVuX21nci5jDQo+ID4gQEAgLTgxLDcgKzgxLDcgQEAgc3Rh
dGljIHUzMiBnZXRfd29wY21fc2l6ZShzdHJ1Y3QgeGVfZGV2aWNlICp4ZSkNCj4gPiAgIAlyZXR1
cm4gd29wY21fc2l6ZTsNCj4gPiAgIH0NCj4gPg0KPiA+IC1zdGF0aWMgczY0IGRldGVjdF9iYXIy
X2RnZngoc3RydWN0IHhlX2RldmljZSAqeGUsIHN0cnVjdA0KPiA+IHhlX3R0bV9zdG9sZW5fbWdy
ICptZ3IpDQo+ID4gK3N0YXRpYyB1NjQgZGV0ZWN0X2JhcjJfZGdmeChzdHJ1Y3QgeGVfZGV2aWNl
ICp4ZSwgc3RydWN0DQo+ID4gK3hlX3R0bV9zdG9sZW5fbWdyICptZ3IpDQo+ID4gICB7DQo+ID4g
ICAJc3RydWN0IHhlX3ZyYW1fcmVnaW9uICp0aWxlX3ZyYW0gPSB4ZV9kZXZpY2VfZ2V0X3Jvb3Rf
dGlsZSh4ZSktDQo+ID5tZW0udnJhbTsNCj4gPiAgIAlyZXNvdXJjZV9zaXplX3QgdGlsZV9pb19z
dGFydCA9IHhlX3ZyYW1fcmVnaW9uX2lvX3N0YXJ0KHRpbGVfdnJhbSk7DQo+ID4gQEAgLTEwNSw2
ICsxMDUsOCBAQCBzdGF0aWMgczY0IGRldGVjdF9iYXIyX2RnZngoc3RydWN0IHhlX2RldmljZSAq
eGUsDQo+IHN0cnVjdCB4ZV90dG1fc3RvbGVuX21nciAqbWdyKQ0KPiA+ICAgCQlyZXR1cm4gMDsN
Cj4gPg0KPiA+ICAgCXN0b2xlbl9zaXplID0gdGlsZV9zaXplIC0gbWdyLT5zdG9sZW5fYmFzZTsN
Cj4gPiArDQo+ID4gKwl4ZV9hc3NlcnQoeGUsIHN0b2xlbl9zaXplID4gd29wY21fc2l6ZSk7DQo+
IA0KPiBUaGlzIGxvb2tzIHRvIGJlIHRyaWdnZXJpbmc6DQo+IGh0dHBzOi8vZ2l0bGFiLmZyZWVk
ZXNrdG9wLm9yZy9kcm0veGUva2VybmVsLy0vaXNzdWVzLzYzNTkNCg0KTGV0IG1lIGhhdmUgYSBs
b29rLiBUaGFua3MgZm9yIHRoZSBub3RpZmljYXRpb24uDQoNClNodWljaGVuZw0KDQo+IA0KPiA+
ICAgCXN0b2xlbl9zaXplIC09IHdvcGNtX3NpemU7DQo+ID4NCj4gPiAgIAkvKiBWZXJpZnkgdXNh
Z2UgZml0cyBpbiB0aGUgYWN0dWFsIHJlc291cmNlIGF2YWlsYWJsZSAqLw0KDQo=
