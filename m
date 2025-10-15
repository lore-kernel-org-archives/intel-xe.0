Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1433ECCD199
	for <intel-xe@archiver.kernel.org>; Wed, 15 Oct 2025 18:15:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4B6D10E8AB;
	Wed, 15 Oct 2025 18:15:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Hq6zdeIS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7951110E8AB
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Oct 2025 18:15:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760552140; x=1792088140;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=JRM0FkstSdwmsbne5uzn8l4krTNyPNuAvwPugP+Ovzk=;
 b=Hq6zdeISJU55wIFnrLVYzihUs8aEo/Jz0PFPOo5elmAgCLwxxoTYQXzw
 2+CJ6wIDreKYXmQKKGKWqWSK0/alwhsWLXlGN5FhGfooqEA+XcdUOxEsa
 70306S6Tp3Jv4Baf4YwcE4kWJ7VvwuosqmIX4Hn7AZpgAi1sy0RJ0bNjj
 gzdvtC66dRiCj2Nujm/c0fGXDFhBl6RPZ59ghOJ6CVUdWWiGs8INkv6eu
 sJjEvR1zS4T1tOQfQH1bDnrmffXExzv0OlFsGAZoMT3wicbF+nhZkPIKX
 gde7TXH7qfNL3PYEEV3lTDIWwGZD3yMZM8lMGiL+FLF0dk45dzF1TJTxY A==;
X-CSE-ConnectionGUID: Kcvdl0ZzQzyOskw08IsxZg==
X-CSE-MsgGUID: 47XU0CHQT5GKJAqselfqLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11583"; a="61944068"
X-IronPort-AV: E=Sophos;i="6.19,232,1754982000"; d="scan'208";a="61944068"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 11:15:39 -0700
X-CSE-ConnectionGUID: /Co3OV8fRI28o3MBI1WeKA==
X-CSE-MsgGUID: dLNmqxRDSbaRyUer2hyzMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,232,1754982000"; d="scan'208";a="182032734"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 11:15:38 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 15 Oct 2025 11:15:37 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 15 Oct 2025 11:15:37 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.0) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 15 Oct 2025 11:15:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dVgzjUKYmeK9etG1w1DVVk3g1PBv3HVcY5RxOZxI7VtUvUCAKgICH5mpE3jZKVM/aQ7SbajZc6cLQNh5DYrUUJuMLCX7Ujqo5ayR2x1bhcF7vubpBrxijiXUtZWldZxwQMQwIPD9oxAMBFCpF0dpnxh+hnxNMyN4+25ST1UyvoqIxRXQ4RvGaJpsZGbCPuBvgjOG2/s+njHKByvqyWSy8VEfTCg0yJeGkmsj0U01eUZUfigl5lopbYbULkDHLFI1QsSVsgX2HpGoPUK4c+XezGEunXJn/rD8mGjVlJ31ZJI5Y5rCCip3lZx2VIISuze0F+8rw0eL2Sx6id6V2Xcp+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JRM0FkstSdwmsbne5uzn8l4krTNyPNuAvwPugP+Ovzk=;
 b=egt6jy1rZNDa0GS8pXRyTEmDZj9nYPBney3tS8mf7ygoSfnXQNQxEhLmJZTfH7ew/QSZ61Zhdq7ebZnwdwRi2tg4fcTehwv0DTcWUtiwBkz58KYXVEWQ78W/tH1OqRt7Q7KGUkk8Ey0Ubq8CdbkAaYs9XckaKG6vwhea+l0KQll0U65aBGz+K3Kan1gTa8CxgvXY/DGz+dxLNs3UF/Cs/Uw7TsJVt0qurslkJP4dILGIEdBl/U3G+tX11NYmJGnFXfMyCHE0haBs7c5AblFAud0jSWTeby0jihBhjruxNIjhuZjamXLqIkX6I3xZ77EoY3kDWTQi/KiLqv5nLN8C6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 LV8PR11MB8679.namprd11.prod.outlook.com (2603:10b6:408:1f9::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9228.10; Wed, 15 Oct 2025 18:15:33 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b%5]) with mapi id 15.20.9203.009; Wed, 15 Oct 2025
 18:15:33 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Lin,
 Shuicheng" <shuicheng.lin@intel.com>
CC: "Brost, Matthew" <matthew.brost@intel.com>, "Ceraolo Spurio, Daniele"
 <daniele.ceraolospurio@intel.com>, "Auld, Matthew" <matthew.auld@intel.com>
Subject: Re: [PATCH] drm/xe/guc: Destroy LR exec queue directly if GuC is not
 running
Thread-Topic: [PATCH] drm/xe/guc: Destroy LR exec queue directly if GuC is not
 running
Thread-Index: AQHcPLwi64tkWwNSlUKp2dQn70WvpbTDctMAgAAPB4CAAALTAIAAATyA
Date: Wed, 15 Oct 2025 18:15:33 +0000
Message-ID: <a051e041d27c98d60fed5d7368b262745024ee2d.camel@intel.com>
References: <20251014033646.1619865-2-shuicheng.lin@intel.com>
 <DM4PR11MB5456BE10B3AFD01CA3AC61CBEAE8A@DM4PR11MB5456.namprd11.prod.outlook.com>
 <14bbd55cc2e92dc8b70fd894a955e2785dc74204.camel@intel.com>
 <DM4PR11MB5456A099DB75CBEC655B3B8EEAE8A@DM4PR11MB5456.namprd11.prod.outlook.com>
In-Reply-To: <DM4PR11MB5456A099DB75CBEC655B3B8EEAE8A@DM4PR11MB5456.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|LV8PR11MB8679:EE_
x-ms-office365-filtering-correlation-id: 0c95001c-dc2e-4446-0a74-08de0c16d4d7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?ZFlkejFUOFNDNVZSR0Jycnc3c2JIY2NRVnBMTXpIYnUwQitnTS85N2VVTDVD?=
 =?utf-8?B?eXNhamdLNzZudU15Zmg2cnU1RmxlWG5ack1jVS9nZS9IUEt6LzgvQ3JEa2tJ?=
 =?utf-8?B?QXdpYy9OTlBMQWNDcUw5ZFMyWTFTWGpEWFBzZnFIUU5ZSkRkbmhzU1E1dnBG?=
 =?utf-8?B?ZzVOWW1pU2xHUDYwUDJPcW8wdCtmakpVemp0UmZPaldsdDZwYjA2aDJsd01D?=
 =?utf-8?B?UTRGTUd0bzNvNnZzbVBFdXBTN2dJZnc2ZHFDUThoM2xVL1NLYTNJTVpaWmZU?=
 =?utf-8?B?SzI2VkZ6OUdNK1dhcEsxeU00cGdUb20xbEZFTGExL3ovUC9pL0UwU2hnNk4x?=
 =?utf-8?B?Q2EvdTZkcHdyYS9LVE5LQmFpZXMwZURESEdvZ0ozaTFvNmVrS1o4UU9EWnVv?=
 =?utf-8?B?dTJkaS8rTG54YnN6WWYrOHhCOFNTa1ZGYmZwZmVKdTJvek5BUVVoVkdmSEF3?=
 =?utf-8?B?dlpyT05HY1BzZWR1ckp1Ymx3ZFdhajRWbWd5eko3NytFVG1aZnBsYWY0cytT?=
 =?utf-8?B?RVhlTjVmRytadUhWckYzcXhsSTkzRjBIQzRKZE1jaEVFd3lJQkNsQnBxUncz?=
 =?utf-8?B?TTFsTWdhdmZjdDllem9wbHplUWZVS2JYZkJIcXlDdjJCQ3VabC9XM0x0VEkx?=
 =?utf-8?B?dXhBWlFRZEhsZjVXNlVDeE9STGV1emhpM2dZUnZhR0ZNbEQ1OCsyM0FvbitH?=
 =?utf-8?B?M0hYWk9xSDdyejU4Z2pCeGsrWEQySnFXd2tvS0h0bnRhYnlURGJZK2ZuSjNL?=
 =?utf-8?B?Qm9OdlVDQlhJYWxKYm1FK1BvNkRxNU1ENEJUam9PdlhLbUI4UWVGOWQ3dlRT?=
 =?utf-8?B?TEJjTU93WmtWb0NzZXo3OXZYL2x3ODhsOFBhZXowZVlPQ0MwUXQyK2Rnbmo0?=
 =?utf-8?B?bmE5cENLeldnSzRVRjRVMGxWcUhQcU1IQ3QxblFqL2ZDODYwb1ZpSXMvZzEv?=
 =?utf-8?B?YVR2UStHVnhKdEZITW4zUktJTVJtMGphWW53TVNveW50ekRucGI1VTRBaEdY?=
 =?utf-8?B?TTM5eXhWdi9jMWdGNGJhZjVka2tkOVhzUVBScDZ5NE1GUEYvdmJ5SWNEQ1Zi?=
 =?utf-8?B?VExYTmNjNk5ZZU5NT1MvNHE4Y01NeGQ2a2xXYmZsUFFIMVFUUzgySXdXeDdP?=
 =?utf-8?B?cXZEQzZMR0lGRFVvd3VDc3lGMmg5MTBVQkhZSFlVMDJsdzFVWHZFbzF3S0k4?=
 =?utf-8?B?Zlc1NlJ2S3hYMGxDNk10V3NnaEg3SVNRMEpyakdpeUZTbXVPM0Y5ZUp6VFFX?=
 =?utf-8?B?VGdMUTRVWkFBZW5LL3ZyVjRtQkFvQnBBbVk3TGJwVGxaVm9GdkwvRlJ3ZHZh?=
 =?utf-8?B?Tis1RmMxNGZpV2hFTVFZVjFjaUkvejlnMWtWUlo4UFZFYVFpa1VWdGEvSW9r?=
 =?utf-8?B?OG55cUdPUkkvS2lUUGFSbzg1dHVJdldEZCsvZkEvampFenJLMStmN2t1NjA2?=
 =?utf-8?B?TU5zWE41NU0xaHFGS3dpa2ZyT2JoK2JFSnZ2R096eVNmeG9RSWZrNnNpd3hV?=
 =?utf-8?B?ckgzM0p0cE9KQVh4cUhnRmFrR0p4U2ovVVFpOXl2NktNTXZ5aWxSR0hRN0V2?=
 =?utf-8?B?Ylc4VDkrYlVVN01Ca1BpTDVQK1FpMlNpSU53aTJxUU5IYlRFM0hFL01DQlha?=
 =?utf-8?B?d253YjJqc0dDNXV2TFM4T1Y5em5vaFZPMExYVDFpdWF3YmYyODBEYm44dXNH?=
 =?utf-8?B?clNNNmFUaGZYODFNeENKVysveDhKdWg2cU9SRjdLUlFqd0UyZGFEc0lYRFRw?=
 =?utf-8?B?ZE9YdCsxSmJZSmZKUHljZjhidjBKb3VFOVFzYktqVjFUMjFPT01UK0pCa042?=
 =?utf-8?B?UDFHUXNxN3VGeldZNUhZRHNybnFPNWdkWnMwNnFrRUxoeEtQM052MU40WnN6?=
 =?utf-8?B?Q1BIcHYzMnRJSDdlVmRxbkQ4TE80bk82WU91cmxuL3R1RnJGUFhMTzBDVkY1?=
 =?utf-8?B?NW1BczYwdGZHaWJObVhpSHJvVjB4aUx6aE9GUDFrSktzQ0ZVQXREd3J2YjVF?=
 =?utf-8?B?MGw5VXY2dnF3PT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YlkrUWZsMDcwbC9NZVduNE5QL1JTVEp1TWYxeGNqZTFGVWNPMEJqR0Q2TE9N?=
 =?utf-8?B?cFpQcm0wdENTeG5DSWhwZ1JmSU5HUmF4OVdTTXJDYmxOMXUvam9QcHZXTlJE?=
 =?utf-8?B?M3padEg1N1VlejR4Z21GdngvY2tlVU5IVUdwZURHbXhIUm5rMW9yL3BSakR5?=
 =?utf-8?B?UU1rOHBNR1pzNEY3anVRTHl5ZDVaZjZhV3RsL0ZQbThyTUM3Z3EzNERhb0U2?=
 =?utf-8?B?dFRUMy9SZjRWRDQ0TmowMGhKZU9QaTlVWTRIREJSMTdIdGszOHBzcjFGQmVw?=
 =?utf-8?B?OFJER0xNUkhET1VJTFNSMnhvQlZFMmt1dTdtVnZTNzEwdzBiK2laN1hOK0F6?=
 =?utf-8?B?d0JhUFlmS1pVRldVZGJGdGNrNGF1UVJKcTVwUWtEeGlYS3JZMWlDdmxlT1Iv?=
 =?utf-8?B?ek1sMmFkRkxxSEp0VldSbHVWRTltTGVhYXlVZ0xZQTJ0ZTU0eEk5b2wzcnFJ?=
 =?utf-8?B?dllBcTlWbDBpNklOSGR4Q1A5MmVwZzBqemRvWFE1Q3ppNnRaSStVS2xwMHJ5?=
 =?utf-8?B?S0tTMG1qOEFpcUtpWHBMWEtadGVlMklzSk5udUtpblZaeWJsOVFWK2xwalNo?=
 =?utf-8?B?Z2pRcHVOcGJVeGcvL0VHM1hwV1cxSG9aZGs0WUg0dVRzM2RvNVc2OG9NSDJa?=
 =?utf-8?B?UDJ2UGtwR1dTK2lGUzJ4Uy9vY3BObTZSYVp1c01sWkI1ck9HMnc2b0dsc0o4?=
 =?utf-8?B?Uzh0dnU5OHN5RFdDVjhMWUlXU0ZVNXFGRlZTZ1hIN2Fjc25JU1hEU1Y2NTVT?=
 =?utf-8?B?dCszOTZPYVVINEd1OHhVaU5xSTVQbCtZWWppcnlLVy83TW9ncUw0MWVTRUpj?=
 =?utf-8?B?MHZIVWxpVFRLOEJ3U25hR1l1N2hsRUd3RXZSMVpYQVMzK2c3eDVwakhjRE5i?=
 =?utf-8?B?eHJEQVVaL3NveHgzOWFmYXA5RjJaNWRjWlRjMzU5N3QxOGprV1hyRXNXcnh6?=
 =?utf-8?B?MTFaM25TeWtrMWVXODlGdnRXT05obisxOEZVY1Zsc01QL3RDV1lkUEQxKzVG?=
 =?utf-8?B?TWp5M1BMR2t2TE5rb0s1c0NVdnlCbUJrTjRuQkVTajI3aWVXSmFFSXlFOHJx?=
 =?utf-8?B?UnhXakJoaFdYTEZQaWFyVkltUDc2bEpjcU1zRWg3RDQvQXFDRHUxM1dxbFlK?=
 =?utf-8?B?N2tNcEw2NVRSOXRxR00yeU1yWkh5T1JPenlGbkg3YWU5MFN4eU1CTUNPYWtv?=
 =?utf-8?B?TGI0SjJHUTYzd1U0WVh2SkZhUDU3bE5FYkJrQ2hPS0JHYXhKcnhtcTg3bUNm?=
 =?utf-8?B?TTRjdHZlSFF2QXhqR1o4MzN3WldtMlJMQ0VtdGZQM2t0bGs5Q21uU1RuTGZh?=
 =?utf-8?B?U1FYWmV5NVVSZ014WEVDNWxHRTY2bTVDUXIzaGR2UUpHQVh1VVlrQ3plT2dZ?=
 =?utf-8?B?cVRDTXpzUEZJRjdnMENpNUFFRkF6Ni9wN1B4SExpSThUYlM0cjBFU0lUM0dx?=
 =?utf-8?B?VFpyQi9tWEpWV3g5S3ExV0tEQTBqK1l4TDJBVE8zMGJTT1hvVnNKMmM3Y2RH?=
 =?utf-8?B?NDRyRDY3L3RCeDBiZURpTWlPK1FzK212aFg1aktTSGYyT29aUVozM0lnRktM?=
 =?utf-8?B?cVc2eGxjKzNzb1pyWlF5NmpBaVNSQkVoU1BpbWdYMnRMQzZsdkVNcXJESExS?=
 =?utf-8?B?WXRSRktrOWlab1ZUVFBkaERXb3NFLytYdkpXN0VVc3hoQk5tYU5ZRWRIQ3FP?=
 =?utf-8?B?NDRLWHdGeUMxejM0c0lMNUZIWlJmTmk4R2NKUU5lcjZOVzZrYXNmdGhEcGR3?=
 =?utf-8?B?Vlo0N3Exd1J4NHcyenFlTWJvbUtWWWtRMFBEeXlETE5vR3FqYkFaNFJQcFdV?=
 =?utf-8?B?OUkxMzlJK2FyZ3daS05HbEpvNFlnZElXOW1oNWZMRE0weThnL3hUaHcvM3U2?=
 =?utf-8?B?d0g4YkJUV3JsQ1hWQUhZRVp3aDhjNzJ0dEdaWC91N2ptZnY2aXI0cWZsMS9B?=
 =?utf-8?B?czVzZDZTeFgrSnpQQnMyUmF2Z3RzaUg5VlptY29WUmxIWVcrOGVWNlMxNnJ6?=
 =?utf-8?B?MnlvYWFlUDgwNlBkZitrbTlsbVdMajJoYkJYV09VN2N3c0JJKzlRbDZkRjRo?=
 =?utf-8?B?V2UxY056TlFtSWN3anNSbTFKZGVOTDlnUG5LbGtLY0h1TkFUMDRvdUFna1NL?=
 =?utf-8?B?RWtwZEdMV3Z3YkxKOGV0SmJuNTJYTU9rNjFtYVMwQ3hTaWZ4elVXd2pMU0pC?=
 =?utf-8?B?T0E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4AA8B4F60CF80344AC7456079AD11297@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c95001c-dc2e-4446-0a74-08de0c16d4d7
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Oct 2025 18:15:33.2712 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qHz11qkYACEryqDHAtBzLLc4f8x6NZMGyKgL5op+HkNX07TquhapNpRrVSvseHIFP2rzeCIsS8LLqx48sl5gJnpe71+s54Zu1w2rucSqtCY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8679
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

T24gV2VkLCAyMDI1LTEwLTE1IGF0IDE4OjExICswMDAwLCBMaW4sIFNodWljaGVuZyB3cm90ZToN
Cj4gT24gV2VkLCBPY3QgMTUsIDIwMjUgMTE6MDEgQU0gU3R1YXJ0IFN1bW1lcnMgd3JvdGU6DQo+
ID4gT24gV2VkLCAyMDI1LTEwLTE1IGF0IDE3OjA3ICswMDAwLCBMaW4sIFNodWljaGVuZyB3cm90
ZToNCj4gPiA+IEhpIGFsbCwNCj4gPiA+IENvdWxkIHlvdSBwbGVhc2UgaGVscCByZXZpZXcgdGhl
IHBhdGNoPw0KPiA+ID4gVGhhbmtzIGluIGFkdmFuY2UgZm9yIHlvdXIgdGltZSBhbmQgc3VwcG9y
dCENCj4gPiA+IA0KPiA+ID4gQmVzdCBSZWdhcmRzDQo+ID4gPiBTaHVpY2hlbmcNCj4gPiA+IA0K
PiA+ID4gT24gTW9uLCBPY3TCoCAxMywgMjAyNSA4OjM3IFBNIFNodWljaGVuZyBMaW4gd3JvdGU6
DQo+ID4gPiA+IER1cmluZyBMUiBleGVjIHF1ZXVlIGNsZWFudXAsIGlmIHRoZSBHdUMgZmlybXdh
cmUgaXMgbm90DQo+ID4gPiA+IHJ1bm5pbmcsDQo+ID4gPiA+IHRoZSBkcml2ZXIgY2Fubm90IGNv
bW11bmljYXRlIHdpdGggdGhlIEd1QyB0byBwcm9wZXJseQ0KPiA+ID4gPiBkZXJlZ2lzdGVyDQo+
ID4gPiA+IHRoZSBleGVjIHF1ZXVlLiBJbiB0aGlzIGNhc2UsIGRpcmVjdGx5IGRlc3Ryb3kgdGhl
IGV4ZWMgcXVldWUNCj4gPiA+ID4gaW5zdGVhZCBvZiBhdHRlbXB0aW5nIGRlcmVnaXN0cmF0aW9u
Lg0KPiA+ID4gPiANCj4gPiA+ID4gVGhpcyBwcmV2ZW50cyBzY2hlZHVsZSBkaXNhYmxlIGZhaWx1
cmUgYW5kIEd1QyBJRCByZXNvdXJjZQ0KPiA+ID4gPiBsZWFrcyBhcw0KPiA+ID4gPiBiZWxvdyBk
bWVzZyBsb2c6DQo+ID4gPiA+ICINCj4gPiA+ID4gW8KgwqAgNTAuMjQyNTY0XSBwY2kgMDAwMDow
MzowMC4wOiBbZHJtXSBHVDA6IFNjaGVkdWxlIGRpc2FibGUNCj4gPiA+ID4gZmFpbGVkDQo+ID4g
PiA+IHRvIHJlc3BvbmQsIGd1Y19pZD0yIFvCoMKgIDUwLjI0MjU2OF0gLS0tLS0tLS0tLS0tWyBj
dXQgaGVyZQ0KPiA+ID4gPiBdLS0tLS0tLS0tLS0tIFvCoMKgIDUwLjI0MjU4NF0gcGNpIDAwMDA6
MDM6MDAuMDogW2RybV0gQXNzZXJ0aW9uDQo+ID4gPiA+IGByZXRgDQo+ID4gPiA+IGZhaWxlZCEN
Cj4gPiA+ID4gLi4uDQo+ID4gPiA+IFvCoMKgIDUwLjI0NDk0Ml0gcGNpIDAwMDA6MDM6MDAuMDog
W2RybV0gKkVSUk9SKiBHVDA6IEdVQyBJRA0KPiA+ID4gPiBtYW5hZ2VyDQo+ID4gPiA+IHVuY2xl
YW4gKDEvNjU1MzUpIFvCoMKgIDUwLjI0NDk3MF0gcGNpIDAwMDA6MDM6MDAuMDogW2RybV0gR1Qw
Og0KPiA+ID4gPiB0b3RhbCA2NTUzNSBbwqDCoCA1MC4yNDUwMDJdIHBjaSAwMDAwOjAzOjAwLjA6
IFtkcm1dIEdUMDrCoMKgwqDCoA0KPiA+ID4gPiB1c2VkIDEgWw0KPiA+ID4gPiA1MC4yNDUwMzJd
IHBjaSAwMDAwOjAzOjAwLjA6IFtkcm1dIEdUMDrCoMKgwqDCoCByYW5nZSAyLi4yICgxKSAiDQo+
ID4gPiA+IA0KPiA+ID4gPiBGaXhlczogOGFlOGEyZThkZDIxICgiZHJtL3hlOiBMb25nIHJ1bm5p
bmcgam9iIHVwZGF0ZSIpDQo+ID4gPiA+IENjOiBNYXR0aGV3IEJyb3N0IDxtYXR0aGV3LmJyb3N0
QGludGVsLmNvbT4NCj4gPiA+ID4gU2lnbmVkLW9mZi1ieTogU2h1aWNoZW5nIExpbiA8c2h1aWNo
ZW5nLmxpbkBpbnRlbC5jb20+DQo+ID4gPiA+IC0tLQ0KPiA+ID4gPiDCoGRyaXZlcnMvZ3B1L2Ry
bS94ZS94ZV9ndWNfc3VibWl0LmMgfCAxMCArKysrKysrKystDQo+ID4gPiA+IMKgMSBmaWxlIGNo
YW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPiA+ID4gPiANCj4gPiA+ID4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNfc3VibWl0LmMNCj4gPiA+ID4g
Yi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3VjX3N1Ym1pdC5jDQo+ID4gPiA+IGluZGV4IDBlZjY3
ZDM1MjNhNy4uZDJkZmJkYzgyOTIwIDEwMDY0NA0KPiA+ID4gPiAtLS0gYS9kcml2ZXJzL2dwdS9k
cm0veGUveGVfZ3VjX3N1Ym1pdC5jDQo+ID4gPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94
ZV9ndWNfc3VibWl0LmMNCj4gPiA+ID4gQEAgLTQ3LDYgKzQ3LDggQEANCj4gPiA+ID4gwqAjaW5j
bHVkZSAieGVfdWNfZncuaCINCj4gPiA+ID4gwqAjaW5jbHVkZSAieGVfdm0uaCINCj4gPiA+ID4g
DQo+ID4gPiA+ICtzdGF0aWMgdm9pZCBfX2d1Y19leGVjX3F1ZXVlX2Rlc3Ryb3koc3RydWN0IHhl
X2d1YyAqZ3VjLA0KPiA+ID4gPiBzdHJ1Y3QNCj4gPiA+ID4gK3hlX2V4ZWNfcXVldWUgKnEpOw0K
PiA+ID4gPiArDQo+ID4gPiA+IMKgc3RhdGljIHN0cnVjdCB4ZV9ndWMgKg0KPiA+ID4gPiDCoGV4
ZWNfcXVldWVfdG9fZ3VjKHN0cnVjdCB4ZV9leGVjX3F1ZXVlICpxKcKgIHsgQEAgLTEwNjAsMTAN
Cj4gPiA+ID4gKzEwNjIsMTUNCj4gPiA+ID4gQEAgc3RhdGljIHZvaWQgeGVfZ3VjX2V4ZWNfcXVl
dWVfbHJfY2xlYW51cChzdHJ1Y3Qgd29ya19zdHJ1Y3QNCj4gPiA+ID4gKncpDQo+ID4gPiA+IMKg
wqDCoMKgwqDCoMKgwqAgKiBzdGF0ZS4NCj4gPiA+ID4gwqDCoMKgwqDCoMKgwqDCoCAqLw0KPiA+
ID4gPiDCoMKgwqDCoMKgwqDCoMKgaWYgKCF3ZWRnZWQgJiYgZXhlY19xdWV1ZV9yZWdpc3RlcmVk
KHEpICYmDQo+ID4gPiA+ICFleGVjX3F1ZXVlX2Rlc3Ryb3llZChxKSkgew0KPiA+ID4gPiAtwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgc3RydWN0IHhlX2d1YyAqZ3VjID0gZXhlY19xdWV1
ZV90b19ndWMocSk7DQo+ID4gPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgaW50
IHJldDsNCj4gPiA+ID4gDQo+ID4gPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
c2V0X2V4ZWNfcXVldWVfYmFubmVkKHEpOw0KPiA+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgLyogSWYgR3VDIGlzIG5vdCBydW5uaW5nLCBqdXN0IGRlc3Ryb3kgdGhlIGV4ZWMN
Cj4gPiA+ID4gcXVldWUgYXMgd2UNCj4gPiA+ID4gY2FuJ3QgY29tbXVuaWNhdGUgd2l0aCBpdCAq
Lw0KPiA+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgaWYgKCF4ZV91Y19md19p
c19ydW5uaW5nKCZndWMtPmZ3KSkgew0KPiA+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoF9fZ3VjX2V4ZWNfcXVldWVfZGVzdHJveShndWMsIHEpOw0K
PiA+IA0KPiA+IEhleSBTaHVpY2hlbmcsDQo+ID4gDQo+ID4gTWF0dCBCLiBoYWQgYWxzbyBwb2lu
dGVkIG1lIHRvIHlvdXIgc2VyaWVzIC0gSSBoYWQgbWlzc2VkIGl0DQo+ID4gc29tZWhvdy4NCj4g
PiBJJ20gc2VlaW5nIHNvbWV0aGluZyBzaW1pbGFyIGJ1dCBpbiB0aGUgd2VkZ2VkIHBhdGggYW5k
IGhhdmUgYW4NCj4gPiBpZGVhIGluIFsxXS4NCj4gPiBMZXQgbWUgdGVzdCB5b3VyIGxhdGVzdCBj
aGFuZ2VzIGhlcmUgYW5kIEknbGwgZ2V0IGJhY2sgaGVyZSAtIGhhcHB5DQo+ID4gdG8gZ28gd2l0
aA0KPiA+IHlvdXIgY2hhbmdlIGlmIGl0J3Mgd29ya2luZyAobm90IGEgZnVsbCByZXZpZXcgaGVy
ZQ0KPiA+IHlldC4uKQ0KPiA+IA0KPiA+IFRoYW5rcywNCj4gPiBTdHVhcnQNCj4gPiANCj4gPiBb
MV0gaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3Nlcmllcy8xNTUzNTIvDQo+IA0K
PiBIaSBTdHVhcnQsDQo+IFRoaXMgcGF0Y2ggaXMgc3BlY2lmaWNhbGx5IGZvciBMUiBleGVjIHF1
ZXVlLg0KPiBBbmQgdGhlcmUgaXMgYW5vdGhlciBwYXRjaCBmb3Igbm9ybWFsIGV4ZWMgcXVldWUg
dGhhdCBpcyBhbHJlYWR5DQo+IG1lcmdlZDoNCj4gaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0
b3Aub3JnL3Nlcmllcy8xNTU0MTcvDQoNCkFoIGdvdCBpdC4gWWVhaCBJIGhhdmUgdGVzdGVkIHdp
dGggdGhhdCBvdGhlciBwYXRjaCBhbmQgaXQgd2Fzbid0DQp3b3JraW5nIGZvciBteSBjYXNlIHNp
bmNlIHRoZSBHdUMgaXMgYWxpdmUgYXQgdGhlIHRpbWUgb2YgSDJHDQpjb21tdW5pY2F0aW9uLCBi
dXQgdGhlbiBkaWVkIGJlZm9yZSB3ZSByZWNlaXZlZCBhIHJlc3BvbnNlLiBNeSBwYXRjaA0KYXR0
ZW1wdHMgdG8gY292ZXIgdGhhdCBjYXNlLiBJJ2xsIHRha2UgYSBsb29rIGF0IGJvdGggb2YgdGhl
c2UgdGhvdWdoDQphbmQgZ2V0IGJhY2suDQoNClRoYW5rcywNClN0dWFydA0KDQo+IA0KPiBCZXN0
IFJlZ2FyZHMNCj4gU2h1aWNoZW5nDQo+IA0KPiA+IA0KPiA+ID4gPiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGdvdG8gc2tpcF9kZXJlZ2lzdGVyOw0KPiA+
ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgfQ0KPiA+ID4gPiArDQo+ID4gPiA+
IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgZGlzYWJsZV9zY2hlZHVsaW5nX2RlcmVn
aXN0ZXIoZ3VjLCBxKTsNCj4gPiA+ID4gDQo+ID4gPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgLyoNCj4gPiA+ID4gQEAgLTEwODgsNiArMTA5NSw3IEBAIHN0YXRpYyB2b2lkDQo+
ID4gPiA+IHhlX2d1Y19leGVjX3F1ZXVlX2xyX2NsZWFudXAoc3RydWN0DQo+ID4gPiA+IHdvcmtf
c3RydWN0ICp3KQ0KPiA+ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoH0NCj4g
PiA+ID4gwqDCoMKgwqDCoMKgwqDCoH0NCj4gPiA+ID4gDQo+ID4gPiA+ICtza2lwX2RlcmVnaXN0
ZXI6DQo+ID4gPiA+IMKgwqDCoMKgwqDCoMKgwqBpZiAoIWV4ZWNfcXVldWVfa2lsbGVkKHEpICYm
ICF4ZV9scmNfcmluZ19pc19pZGxlKHEtDQo+ID4gPiA+ID4gbHJjWzBdKSkNCj4gPiA+ID4gwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB4ZV9kZXZjb3JlZHVtcChxLCBOVUxMLCAiTFIg
am9iIGNsZWFudXAsDQo+ID4gPiA+IGd1Y19pZD0lZCIsDQo+ID4gPiA+IHEtDQo+ID4gPiA+ID4g
Z3VjLT5pZCk7DQo+ID4gPiA+IA0KPiA+ID4gPiAtLQ0KPiA+ID4gPiAyLjQ5LjANCj4gPiA+IA0K
PiANCg0K
