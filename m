Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4807DC5AE59
	for <intel-xe@archiver.kernel.org>; Tue,  3 Jun 2025 17:35:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08CBC10E1F8;
	Tue,  3 Jun 2025 17:35:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ET2eR1T1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A606310E1F8
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Jun 2025 17:35:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748972143; x=1780508143;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=s578BqTz+TyzlSU95Arz6jlP91z9K1KAXcHXYxSO9rw=;
 b=ET2eR1T1KWulnPbZNg09ga5l3dvbIObsiPxPzcXR9SNdnQ+SRTmuZCrw
 6O8DyA6yJRwT6FXOqSiey6L3vtk4ia2Wpm3i3Uw4nf1GkL1CV7GFqnvOp
 4WyKJiv/o7EHyvpDi7C3CDHHf3YxqhMER8qPFSn63KrlxDWCpYpb5NsRk
 BoxmxfSyyXd4IMHLbbYHGgyyGhjQymbOmOZvJz0sx6e4tkPYukuBUht4L
 2vJpekKB1Kh3PRgcOMCHgN1dQTLs9BPNof2B5qWt4vfGoF9/yqD3AdN/a
 Kv9k5/UnLMOoGdGMbdgiajs6NjWag6kRH9yv2FXeaHmHAYYeYbTjLkhiP w==;
X-CSE-ConnectionGUID: neUdzxVjQ8+SNr39UY9fqQ==
X-CSE-MsgGUID: ROWDmMovQRqy3fEkAEmWig==
X-IronPort-AV: E=McAfee;i="6700,10204,11453"; a="50885803"
X-IronPort-AV: E=Sophos;i="6.16,206,1744095600"; d="scan'208";a="50885803"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 10:35:43 -0700
X-CSE-ConnectionGUID: lKEKmL13TFKkgb+PbNC4Tw==
X-CSE-MsgGUID: 2wEH9cKtThG79j7aB61Yow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,206,1744095600"; d="scan'208";a="144900288"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 10:35:43 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 3 Jun 2025 10:35:42 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 3 Jun 2025 10:35:42 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.64)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Tue, 3 Jun 2025 10:35:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u3XQPijoydF1UaPBtAN27IyIn/qE430qqqSlDMmKVI1wqlhd2wDj0DSOnIuBSbvzfudkrD44Mf4cU7ezPqn2RNt4+XyDb0OXw1nqGrXxFmKoECpJVHQnrnDxqw6+SFm96Dc6pCu8Qn2ZYKl8KgokQLs13VvzsTWi6f40Y1/1pGrAB3gongTBkBBDfDQGdYsMfYVeGgjxMiPATxsgmXRhDkxI59N62kCUayIC9pU9e0xEIBVs7bjP9rc1CP+h8laDdo/NUEjVyWvpXkmdgRX3YGWndIgtwTMXtqC/76P2LLaBbwds8gT+zfs0lHctS9klxpCchPC3WAZK5Lri0mNDVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s578BqTz+TyzlSU95Arz6jlP91z9K1KAXcHXYxSO9rw=;
 b=AS4OjGt5YdnPjgppd1T2nUTh1Ed/YLgxGnr/2u/CpiQK2WehtkDHCEC48qjjezpONdZ/4OV1hGy3gbGi3aOvv9ZLnMCV4S51gaRvVEeWLvFclySOhm66AFjm92aIxJzmaLA9LuYbG4Ju0aEl+LRADWDMU6/VqU8s66a1nPCNaqIQ0VBT5wlNHO+UyQIGOR6iNckTmQ5/gVulRZJLPEX5WUyH63qupiEXdkuisiBVCDNBvCzbMGA5CPzsJptthkbBDD9N7EtJl0f6EJKbJhCNz8o6SBzF9WVYH6zCoxpx0H5IuhfzhlDmpwK4B0t9MKu3AZvUgd0IzHDvJCFnbfh4Yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 DS4PPF2A0C3F85C.namprd11.prod.outlook.com (2603:10b6:f:fc02::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.37; Tue, 3 Jun
 2025 17:34:57 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b%6]) with mapi id 15.20.8792.034; Tue, 3 Jun 2025
 17:34:57 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
CC: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
Subject: Re: [PATCH v3 2/4] drm/xe/guc: Ignore GuC CT errors when wedged
Thread-Topic: [PATCH v3 2/4] drm/xe/guc: Ignore GuC CT errors when wedged
Thread-Index: AQHb1BirND0BJv+nx0Gmz3at3lBeRrPxs3MA
Date: Tue, 3 Jun 2025 17:34:57 +0000
Message-ID: <11b5e74326ea99b8d809e5018621bbbf3383b6df.camel@intel.com>
References: <20250602234415.2015921-1-vinay.belgaumkar@intel.com>
 <20250602234415.2015921-3-vinay.belgaumkar@intel.com>
In-Reply-To: <20250602234415.2015921-3-vinay.belgaumkar@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|DS4PPF2A0C3F85C:EE_
x-ms-office365-filtering-correlation-id: 464681f9-2127-4b4a-91fe-08dda2c4f5da
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?Q3owdEljUW5SZEt6MHhWcUd6U2x3R3BsL0xEYU5LSVdwRWlNb3hhOURWaHNt?=
 =?utf-8?B?aUtzY3Vsb01Oakg0UEN5S0tSOVpkWVJ3RVZpK2VualF0Z3RzejN6UGg0eVl3?=
 =?utf-8?B?VkFmRFdtdW1Kb0RhSDQrUXFZWjBwdng2ZXdCVkdiRE1Kak1CVTd6ZTdOMndM?=
 =?utf-8?B?TnBDUEpKZW5maDVwYjBKMEU1UWRPby9BSVJDTXl4a2gvV1pBNEJMclUxS01S?=
 =?utf-8?B?Tjl3RXBFaE1ueWlHMmtMT0VpN0MrV2FlY2dPaVRnaU0zbk9RdmF2YWRsTDdL?=
 =?utf-8?B?b3ZTYWk1UUUvYnduV1hoUS9MdCs4bklDMVVnTXJ0UExkOG9zVGErbUsza1Vt?=
 =?utf-8?B?OXdGWU03S3BXcGRaWXFVazNDL25vZnNUM2JmdzFGMWtFeHdzNTk0Yk1hbFZV?=
 =?utf-8?B?MUFpRmc4TTRlczVaUTFJcnVtR0FEQ2xTRkpvOUdvakM2NHcxenRaVU5EZThq?=
 =?utf-8?B?dDRHT0loV0VGd0NRTlZhUTQraExzYnprWEx6R3o3Z2pnU0R1N2FhaTdsWVFK?=
 =?utf-8?B?WGZTWDBTNzA1UVZoU0F2bkY2bk5rRDc5YXlHQzFmUW13TDc4eklKeXRZREQ4?=
 =?utf-8?B?Vzh4enZ1bmVXUFgrbllEcVRHZDVUU0UzMGhmdTRTSkUrSG0xRm1UaVVFN3dH?=
 =?utf-8?B?ZFAwZ045RWo4aVFobTU1NjhibGtTd2xNSFdHVCt5RHR5bkNiSWc1d3RPU3ZB?=
 =?utf-8?B?Z1NBbGNtd3E2MkU2Z2RFVnk5VkJnc3RJUE1jSzhLeEorTTF1clBrdXZqd2Zi?=
 =?utf-8?B?VUpKYjlRMDFXeldqaUZqWi8vNlZjQ1YrZXJPVEk5MmZnY2w2c3RRUExteEtq?=
 =?utf-8?B?Q05mczVuZW9RS0p4WjRYVVBybzRBZU1vRit6a05DWmJ6bE1hRmxNbTVNVXhj?=
 =?utf-8?B?ZDE5L3FjYk9oM0U2MVJxWlFVTE1CejFCdWRhV3E1Nm5DaXNXOWtsc0pnZUdM?=
 =?utf-8?B?TVRGaFFEWEhkVjViajdnUzd3UVdDc0FVZ0RqUTlVS25xSVRhTFUvUTRNY3pa?=
 =?utf-8?B?Uk14Qk1vWWVTdWg3c1M5YndrWFlUdSt0ekFLQUUwb0taNmpFanlIU2g1ZEtT?=
 =?utf-8?B?dUtBQTd1Y1RWdFRmZWhwSEpoRFZLYklhQXEvaUI3dmpIcW5BTDBUMjFzTW5a?=
 =?utf-8?B?YXhNRFNTQ0orV3Y2Y1ZrTEVvNmRIU1JLanhzRXpEeHBpcXpSdndET2w3K29H?=
 =?utf-8?B?K1ZJOTdUQi9kdWpGWE0rK2tka0pLSU9qMzZ6SUxpUkQ3K0JPK01hS1k4RXVN?=
 =?utf-8?B?Qm1RSERPZlB6MEhoY2NGb0Riak9wZjQ4RUpGQmpqV1NBRW9keFUvZTlRT1Yx?=
 =?utf-8?B?d0FrNXc2Q0JlTDd1YXVpbXJMaTczdzRtTWlmdDlCYWFvRW1mY1VUVWIxYmpq?=
 =?utf-8?B?RXYxY3JWQWNKS0ZwSnJpRzRJU1F6Q2JSMmhDWW1tRkdwZjREWS91a0NFTWZP?=
 =?utf-8?B?MmhqU09yRG5yTFdLRHFEemU3djZyODg2Nys2R2p6eElud3dCd1hSYkd4MmR5?=
 =?utf-8?B?TVlvQUFHMDNLd09lY1dkc2NFTVJtOHVweWlvRnZNMS8wVE04RW9Uc3RTdEds?=
 =?utf-8?B?a2RPU05EWSsvUUdXbk45WlRFQVNYSmR2SVF2YmNCQW1JeldmRFFUVGpTS1U2?=
 =?utf-8?B?MytJcWwwQTFKQVFENTNDdS9NY1M0Q0RmV2U0SlBCUGNGaXl0VUtBVTJEME9o?=
 =?utf-8?B?THJHdm4va0F4RjBWSnVteitvVGxSY3IrZW1FeEVGQit0SE1hdG9BWUIvQ1ZR?=
 =?utf-8?B?ZmdvMFN6Qm5zQmVSZS9WTnBIUWp6UGZQK3hScWxHVGhLdWxmRFcxZzh6SGFv?=
 =?utf-8?B?ak1ON2M4UGhVTk5HMnJtMk1WZGlmVWpKNTFkOWN5YzhsbTdscXFnVHhPcHRa?=
 =?utf-8?B?VndBZktjdG1zSHVTZVU3M1JGTGxhYm9ZamJpV2w3bmVNWGpTL2Njcjh3eE43?=
 =?utf-8?B?R1RHalRjektRN0xXY3FZSmpHMmloTEtUc012N0pnanpJcURHckV4OUxGNHBv?=
 =?utf-8?B?TDlyVmZEUHNBPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?M0ZRdmdYMnV4b3Q5bVBFWGlublc2TWd5ZW9FZlcrcmVzbGxtcTYvVTE2VE5S?=
 =?utf-8?B?MFM5SHBIbnlnRDRFSURuVU9YN05JMzNXQjI0NzlkS0xxVmo4cklFNm15VHYx?=
 =?utf-8?B?U1NkVUhiMkk4eVFiWUxOWll1aTVEL0o3b1ptZEg1YVEwbCthT3kvQXloTUtE?=
 =?utf-8?B?K1k2SWpnUXpwWEFLK2pONERiRU1sU1RjV0VuM3Bwa2pMRHVKTjR4QUlxOW5k?=
 =?utf-8?B?N2NtTW1BWWlEeWg4RmhCc3YyaTNlS0wrRmdra3RpQnVDczJpdWRNWmJkbndG?=
 =?utf-8?B?MEhaa3ExdGRQNWFoUGtRV3N5dlpwMXZuYlh6SFBaTEJsSmhVa3A0M0JqdnJi?=
 =?utf-8?B?ejAxUUplRlk5UW9Vd1U1T2tPUGk1SnByQW1pcFVKUENrTzZ3cnRCN1llUVZp?=
 =?utf-8?B?UnQ4anFVdi9pa0tpaWwyWUtMamwvUjVsMzBUVmFWRUJLNkxGMkp1OGJ1cWwv?=
 =?utf-8?B?Rnh1b0pNTHljZy9WbjhDblZOZjFFSWliTE9LSG1qVjgvRGdvVTRDM1pWVnNo?=
 =?utf-8?B?dXNucGpJNE00US9HdDZKcS9tajBUaUlJU3liNllyQ1I1MWN4NnhDbDlET2ZR?=
 =?utf-8?B?WnpoWHJFellTandQa3BqZVBVWGpjdXYwLzY5Zk96Q0xnTUZMTlJaM0F3dWE4?=
 =?utf-8?B?TDdTUXZUdElxcmVoQW1MVitFdnFBaWM5Sk5YNytja2QvNkFha2lPU2swUHpP?=
 =?utf-8?B?WUEwVFdWOVNpRjN2dTlwR3o1RUM1UHplYlFPa0pHZ2hIZG94ZDl4Tzl2QmVj?=
 =?utf-8?B?WXljdGtWa1ZCelNMVHFhdHJFOGhUQVhPVzhHUU81TUdpdm5KV1FQNi96VnhI?=
 =?utf-8?B?U0VxWU42SUtZdTZHVE5mMDNQWHdXb0NtSEx4TytqSWJ5d1RUMTcrVG5sR2U1?=
 =?utf-8?B?WldRamFHVmdKN1hkcTRrRVhlbFFsdStBNDFiZTdZblYzVFUwWDRnOXlnNVA2?=
 =?utf-8?B?bWZLcHRONERXQVREQnhCWTNHVzVSa2IxV3Z1U05OaTNkak1QUW9jRExJTEMz?=
 =?utf-8?B?SDJESStSclRyMmpSaTNJUVo1MHJGVTg0Wmx2TzE1TjlvOE9UWDJVc09objBt?=
 =?utf-8?B?bkxNa3BxTXNMWTFrb2xvZW9yMGpwRnBSa2krbk9QUDNDSWlsbjZsNXNnMER4?=
 =?utf-8?B?UTAwZzk0QnNNeUFQYU9rWXUyQTN3ek1tRWtjSjVJYnd2T1U2eTJSbytYOU1F?=
 =?utf-8?B?cTdKeFJtQ3JwV2hsMHVoQmFGT3BUckZSbTROdUhrOHZoOE1uU2Z2Q29CZHU0?=
 =?utf-8?B?UUZ6Mit0TnIzTzd6K1BneDd1djEzaXQxZzFIREpyV0I1bHJYUWRLRUJmWm1C?=
 =?utf-8?B?OHhpRWtkT2RQWmdIZUZORHNoQU03ZTZYMk5kQkI1Rk9QVmFkZzlZalRuUmUx?=
 =?utf-8?B?aUcyZEx1WVQvcmRPekJYZWhFNWpmd2d1cFRsVVhXNVZlQ3BacGp2VHk0eG1t?=
 =?utf-8?B?Sy9tTmpNQ0s0RzF0WnpBbmRuandlRmo0NkhXVkY3QThkSE5pb3Bod3l5MitU?=
 =?utf-8?B?SG80UEh4SVBrS1ozOWZWTGJiQi9XM0FDMVBUVzRwL3dXZWNGMjc0UUF3R3Z3?=
 =?utf-8?B?ZGRsbFovQWlXSi9JaldBcEFpbWhhS09kUXExNlMvcHdKdklCOUxrTmZrMUFG?=
 =?utf-8?B?RzU2MlFuZHl0VTljaGJCN3N3VVN4cGJyVG53dDFqTnBSNkpVN3JpTkxTNzAy?=
 =?utf-8?B?MmxBNi9zWkxCU3hrQ3ltSGpnN3d6eVhWbEhRTDUyZTlWSElkVmxCTU8xUmtM?=
 =?utf-8?B?YWFJUjlYWFlBU1R3dEx5SWRPeThjd2lKWWI4UkVwVTBEY3YwaVBDWnh4aW1T?=
 =?utf-8?B?ZDhJSmdYRkRUMm40MWsyYlROZW9ad0FKUUhSMnpnT0pjU00vK29xMjM2Wi9I?=
 =?utf-8?B?N3BhMW1ibUJqaEM2d3FMUFhaWlV3cldNSlh0L08zSGxCbmVGY2llZVdCRmR5?=
 =?utf-8?B?KzJkdHc2ZjdUaXVOK1dXamptVXplWWFOUitTb1k5elFnVUkxMTJvU0Joczhx?=
 =?utf-8?B?VnoyRFBPTmN2QnBXUXBnZWNIM1RtYjlKTjYwVTErMzNDR25LclBFQllEQ29G?=
 =?utf-8?B?QStRVDNUckxJRm51NzlncTlhMzZXZ3Z3WjhLZU40b0FYS1JXcDNtRnFhaU5N?=
 =?utf-8?B?UXlHUDYzaUtRUUdTRUFLNTRBY1NlOURncVp1OFhycit4MzExUk9xKzNRZDE4?=
 =?utf-8?B?UkE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8F4CC5F6C6EAB04A83B5762FC5D72E6B@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 464681f9-2127-4b4a-91fe-08dda2c4f5da
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jun 2025 17:34:57.8405 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ox4SbwupVQhYnaHUAz8q2EDQl7mUnI6PugGke1jICGZxegPmUEIROgYQ5Qp5ANcr9gbgmNe0MrNuvNc2HYnBZdItzGLyxhAXV3C8od/CrVY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF2A0C3F85C
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

T24gTW9uLCAyMDI1LTA2LTAyIGF0IDE2OjQ0IC0wNzAwLCBWaW5heSBCZWxnYXVta2FyIHdyb3Rl
Ogo+IE1lc3NhZ2luZyB0byBHdUMgbWF5IGdldCBjYW5jZWxlZCB3aGVuIGRldmljZSBpcyB3ZWRn
ZWQuIERvbid0Cj4gZmxhZyB0aGlzIGFzIGFuIGVycm9yIGluIHhlX2d1Y19wYyBjb2RlLgoKU28g
aWYgd2UncmUgd2VkZ2VkIGFscmVhZHkgd2UgYXJlIGFscmVhZHkgaW4gYW4gZXJyb3Igc3RhdGUg
cmlnaHQ/IEkKY2FuIHVuZGVyc3RhbmQgZmxhZ2dpbmcgYWRkaXRpb25hbCBlcnJvcnMgbWF5YmUg
Z2l2ZXMgYSBmYWxzZSBuZWdhdGl2ZSwKb3IgcmF0aGVyIHdvdWxkIHByb21wdCB1cyB0byBsb29r
IGF0IHRoZSBlYXJsaWVyIGVycm9ycyB0byBtYWtlIHN1cmUKdGhlc2UgYXJlbid0IGp1c3QgY2Fz
Y2FkaW5nLCBidXQgZG8gd2UgcmVhbGx5IG5lZWQgdG8gY2hlY2sgZm9yIHRoaXM/CgpUaGFua3Ms
ClN0dWFydAoKPiAKPiBDYzogRGFuaWVsZSBDZXJhb2xvIFNwdXJpbyA8ZGFuaWVsZS5jZXJhb2xv
c3B1cmlvQGludGVsLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBWaW5heSBCZWxnYXVta2FyIDx2aW5h
eS5iZWxnYXVta2FyQGludGVsLmNvbT4KPiAtLS0KPiDCoGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9n
dWNfcGMuYyB8IDEwICsrKysrLS0tLS0KPiDCoDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMo
KyksIDUgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94
ZV9ndWNfcGMuYwo+IGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y19wYy5jCj4gaW5kZXggY2Iw
NTYzNDk0ZmNjLi43OTNkZjM0ODZkMWYgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hl
L3hlX2d1Y19wYy5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y19wYy5jCj4gQEAg
LTE1NCw3ICsxNTQsNyBAQCBzdGF0aWMgaW50IHBjX2FjdGlvbl9yZXNldChzdHJ1Y3QgeGVfZ3Vj
X3BjICpwYykKPiDCoMKgwqDCoMKgwqDCoMKgaW50IHJldDsKPiDCoAo+IMKgwqDCoMKgwqDCoMKg
wqByZXQgPSB4ZV9ndWNfY3Rfc2VuZChjdCwgYWN0aW9uLCBBUlJBWV9TSVpFKGFjdGlvbiksIDAs
IDApOwo+IC3CoMKgwqDCoMKgwqDCoGlmIChyZXQpCj4gK8KgwqDCoMKgwqDCoMKgaWYgKHJldCAm
JiAhKHhlX2RldmljZV93ZWRnZWQocGNfdG9feGUocGMpKSAmJiByZXQgPT0gLQo+IEVDQU5DRUxF
RCkpCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB4ZV9ndF9lcnIocGNfdG9fZ3Qo
cGMpLCAiR3VDIFBDIHJlc2V0IGZhaWxlZDogJXBlXG4iLAo+IMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIEVSUl9QVFIocmV0KSk7Cj4gwqAKPiBAQCAt
MTc4LDcgKzE3OCw3IEBAIHN0YXRpYyBpbnQgcGNfYWN0aW9uX3F1ZXJ5X3Rhc2tfc3RhdGUoc3Ry
dWN0Cj4geGVfZ3VjX3BjICpwYykKPiDCoAo+IMKgwqDCoMKgwqDCoMKgwqAvKiBCbG9ja2luZyBo
ZXJlIHRvIGVuc3VyZSB0aGUgcmVzdWx0cyBhcmUgcmVhZHkgYmVmb3JlCj4gcmVhZGluZyB0aGVt
ICovCj4gwqDCoMKgwqDCoMKgwqDCoHJldCA9IHhlX2d1Y19jdF9zZW5kX2Jsb2NrKGN0LCBhY3Rp
b24sIEFSUkFZX1NJWkUoYWN0aW9uKSk7Cj4gLcKgwqDCoMKgwqDCoMKgaWYgKHJldCkKPiArwqDC
oMKgwqDCoMKgwqBpZiAocmV0ICYmICEoeGVfZGV2aWNlX3dlZGdlZChwY190b194ZShwYykpICYm
IHJldCA9PSAtCj4gRUNBTkNFTEVEKSkKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oHhlX2d0X2VycihwY190b19ndChwYyksICJHdUMgUEMgcXVlcnkgdGFzayBzdGF0ZQo+IGZhaWxl
ZDogJXBlXG4iLAo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIEVSUl9QVFIocmV0KSk7Cj4gwqAKPiBAQCAtMjAxLDcgKzIwMSw3IEBAIHN0YXRpYyBp
bnQgcGNfYWN0aW9uX3NldF9wYXJhbShzdHJ1Y3QgeGVfZ3VjX3BjCj4gKnBjLCB1OCBpZCwgdTMy
IHZhbHVlKQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuIC1FQUdBSU47
Cj4gwqAKPiDCoMKgwqDCoMKgwqDCoMKgcmV0ID0geGVfZ3VjX2N0X3NlbmQoY3QsIGFjdGlvbiwg
QVJSQVlfU0laRShhY3Rpb24pLCAwLCAwKTsKPiAtwqDCoMKgwqDCoMKgwqBpZiAocmV0KQo+ICvC
oMKgwqDCoMKgwqDCoGlmIChyZXQgJiYgISh4ZV9kZXZpY2Vfd2VkZ2VkKHBjX3RvX3hlKHBjKSkg
JiYgcmV0ID09IC0KPiBFQ0FOQ0VMRUQpKQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgeGVfZ3RfZXJyKHBjX3RvX2d0KHBjKSwgIkd1QyBQQyBzZXQgcGFyYW1bJXVdPSV1Cj4gZmFp
bGVkOiAlcGVcbiIsCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgaWQsIHZhbHVlLCBFUlJfUFRSKHJldCkpOwo+IMKgCj4gQEAgLTIyMyw3ICsyMjMs
NyBAQCBzdGF0aWMgaW50IHBjX2FjdGlvbl91bnNldF9wYXJhbShzdHJ1Y3QgeGVfZ3VjX3BjCj4g
KnBjLCB1OCBpZCkKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJldHVybiAtRUFH
QUlOOwo+IMKgCj4gwqDCoMKgwqDCoMKgwqDCoHJldCA9IHhlX2d1Y19jdF9zZW5kKGN0LCBhY3Rp
b24sIEFSUkFZX1NJWkUoYWN0aW9uKSwgMCwgMCk7Cj4gLcKgwqDCoMKgwqDCoMKgaWYgKHJldCkK
PiArwqDCoMKgwqDCoMKgwqBpZiAocmV0ICYmICEoeGVfZGV2aWNlX3dlZGdlZChwY190b194ZShw
YykpICYmIHJldCA9PSAtCj4gRUNBTkNFTEVEKSkKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoHhlX2d0X2VycihwY190b19ndChwYyksICJHdUMgUEMgdW5zZXQgcGFyYW0gZmFpbGVk
Ogo+ICVwZSIsCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgRVJSX1BUUihyZXQpKTsKPiDCoAo+IEBAIC0yNDAsNyArMjQwLDcgQEAgc3RhdGljIGlu
dCBwY19hY3Rpb25fc2V0dXBfZ3VjcmMoc3RydWN0IHhlX2d1Y19wYwo+ICpwYywgdTMyIG1vZGUp
Cj4gwqDCoMKgwqDCoMKgwqDCoGludCByZXQ7Cj4gwqAKPiDCoMKgwqDCoMKgwqDCoMKgcmV0ID0g
eGVfZ3VjX2N0X3NlbmQoY3QsIGFjdGlvbiwgQVJSQVlfU0laRShhY3Rpb24pLCAwLCAwKTsKPiAt
wqDCoMKgwqDCoMKgwqBpZiAocmV0KQo+ICvCoMKgwqDCoMKgwqDCoGlmIChyZXQgJiYgISh4ZV9k
ZXZpY2Vfd2VkZ2VkKHBjX3RvX3hlKHBjKSkgJiYgcmV0ID09IC0KPiBFQ0FOQ0VMRUQpKQo+IMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgeGVfZ3RfZXJyKHBjX3RvX2d0KHBjKSwgIkd1
QyBSQyBlbmFibGUgbW9kZT0ldQo+IGZhaWxlZDogJXBlXG4iLAo+IMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIG1vZGUsIEVSUl9QVFIocmV0KSk7Cj4g
wqDCoMKgwqDCoMKgwqDCoHJldHVybiByZXQ7Cgo=
