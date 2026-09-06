Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59BDCC79F9F
	for <intel-xe@archiver.kernel.org>; Sun,  6 Sep 2026 14:15:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8E5710E3C6;
	Sun,  6 Sep 2026 14:15:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OTsVe5eR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 537DA10E3C6
 for <intel-xe@lists.freedesktop.org>; Sun,  6 Sep 2026 14:15:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788704117; x=1820240117;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=AqFJro1dXwRItRkE1VD4HHdFDJyMr37u0lKhKXmOiPA=;
 b=OTsVe5eRocDIyWj1ZzSmxg4W3J9BJclx9ab3RI8KhVmnFRbWytgKypJy
 oKDVyA2tWBG4qr6KofQLElJAVRVLzs9FsxugLVxt7ldEk5rXkxMX7J+xL
 DxIL1XrhRLXw9VvDfDtewWMwF+dDti95jm0yg4F6vsnzLQ++q6zP7/V56
 fhOPuzasp3D/QH14u/R8n5M/Fpxb8Hh6cQthfDlh6LZvmF+csgl0mtHBT
 0c9jIBB4pVaebXeJy7U8TVFm1sRyFao/81zrbwnatMHOyfjCjwXeMfT7l
 nvU1pkCq+SN10UmzN40rkaa5dwouuTiP3Xp7nkZeI4ZuE77jhyZUxZIHU w==;
X-CSE-ConnectionGUID: PtOGGuq7Tx2TZ1/E2XrW9g==
X-CSE-MsgGUID: OekLP9m2QQak0H+CxFy+vA==
X-IronPort-AV: E=McAfee;i="6800,10657,11898"; a="88065453"
X-IronPort-AV: E=Sophos;i="6.25,265,1779174000"; d="scan'208,217";a="88065453"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2026 07:15:16 -0700
X-CSE-ConnectionGUID: U8pJ1mS6TNuHPuL2EfL/Cg==
X-CSE-MsgGUID: jHnO8RCMS4WzSQ9L32Ixig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,265,1779174000"; 
 d="scan'208,217";a="267250744"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2026 07:15:15 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Sun, 6 Sep 2026 07:15:15 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Sun, 6 Sep 2026 07:15:15 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.12) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Sun, 6 Sep 2026 07:15:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KvGhQ9mOzWzIrdxyGRYF+mhpVdCB3cGxpY4k9Ad6Qv0UXB/pI/aZ3up9ZSrElRmOGoo6nS2GsG9LrIKAl4FseS9Vw7kl9Hcdrh02F+vVExSM+/qy28mtFgzvn3IPChm/Z2UCCrUOr2d0KF245ntyHj5h0Bw8rwuPvRV905ApbYw7eh66az6CPr6Vr150P1DYBvmzyp30CJHvzNSponECdvvsFUX9qyalOj23T7U8IKFxn+V6+yPLi7R8LqQaXEWixAMCFAWzwVWTQfD5XrznYIoCFCpW8qsg+715Me8M66Newmgm7dkmlGWDwSeHZZifx6qmDukTJI5WA2eT3+MsXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AYwRf6RCWcTYqKKNlW6FRuq/4lfAJzkkLaVjJOla2mA=;
 b=uFzxWciW7k1N95cHZW/WkQjsE5cVZF7V1IuGlxq1F3pRa6aJodnj1tB0AkpkZQTp+Vi0O3Rw4UcP9LH+UaMa2G3KA+4Yhi3KxX8N9nxsfE8QgWBTZb57bqHfVRyb97DP9o8GmG0VaJvbdHCHw9X0M5CXAbTi4V+YDClL8PJEBx/EQbJHszPtChh2Vzos7HH6qhTw4D2tcAOebRyUwhvjJA9UIO5y807SkrU/VZAJddk91ZvwM62AZdihnIOkrLcgQUxYyoqoAfzmq8wUYmBgj3ZyfJIFwrUptfxiH9ujdDaxbOciERwbGDop6HBrnZQhfc9MrDymBwf8Gz+87oHJcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV0PR11MB9792.namprd11.prod.outlook.com (2603:10b6:408:385::5)
 by SJ0PR11MB5069.namprd11.prod.outlook.com (2603:10b6:a03:2ad::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Sun, 6 Sep
 2026 14:15:12 +0000
Received: from LV0PR11MB9792.namprd11.prod.outlook.com
 ([fe80::1b1f:d9a8:ce76:e9d8]) by LV0PR11MB9792.namprd11.prod.outlook.com
 ([fe80::1b1f:d9a8:ce76:e9d8%5]) with mapi id 15.21.0382.014; Sun, 6 Sep 2026
 14:15:12 +0000
Content-Type: multipart/alternative;
 boundary="------------f56L0uGpdGbtR1P1CbY03XFs"
Message-ID: <07f8d6de-041d-4cb3-9784-e5ef381ec6b7@intel.com>
Date: Sun, 6 Sep 2026 19:45:06 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/11] drm/xe/cper: Prepare Intel CPER error info from
 info queue
To: <sashiko-reviews@lists.linux.dev>
CC: <intel-xe@lists.freedesktop.org>
References: <20260825175916.1103841-13-badal.nilawar@intel.com>
 <20260825175916.1103841-18-badal.nilawar@intel.com>
 <20260825175418.237511F000E9@smtp.kernel.org>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20260825175418.237511F000E9@smtp.kernel.org>
X-ClientProxiedBy: MA5P287CA0326.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:222::7) To LV0PR11MB9792.namprd11.prod.outlook.com
 (2603:10b6:408:385::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV0PR11MB9792:EE_|SJ0PR11MB5069:EE_
X-MS-Office365-Filtering-Correlation-Id: 77ae3390-7d38-423d-190e-08df0c2143c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|1800799024|376014|10067099003|22082099003|18002099003|56012099006|11063799006|8096899003|4143699003;
X-Microsoft-Antispam-Message-Info: Gg2mxTKzRhEQO2FpCezBOTJuOPsWuBrU/fbHPQH41Kn1Im4B3Vhsjra+41wd5/vt01GTdn1MjuAQg0AjVHsiESgP1OPNqcEO3jnLHmvhYjOa3hhhr4KBG9wRwsNh7+hwem93H2KtxVH0LkOJEnbKYrNOQr99E2mWxYRwpecKXGmcFa1uXYc3eySrjQu2D1arZHyFKZR9T/6In/89tSko/+kJZAh57aRreC7S3wd5zGrae8v8mno7mColeqgco40UNG6NhxVs6dLdFQC2O68zN72K5gq5Xat+yi/cRn6TACeeb11WxBm5qj/vOESh6hksPfDgclu0+8Sj4yr+NyJUd6iU7KUgktfTP9ZWRomVG6pesv8EEnbeoeGlFUF2llZWIO11iLuuPBCHeHPrhpetwhAmCh+OK/ObpmrafauaUfLYKnFmeMMo32Wx1TMO/olV51RObb3d2N9a9OIY8L2VlcpuwFvbNpacNYwINlmcUpvPWL0ReWlV+6tUGYxnAGVp8uhdEVlvN7Raq7ayQapo62NmcdZCiWXligLykZj6w+6TxyKadZdIByzGfxTi5rWltE287UaPr2tnRMZYk37pjmEWcdsdNDm0bIWYmR/TDSCs8sFqFAijcf3V0omW3ijwQFE/LyoGP8yD4zmjAXFXmw8+SnExUlBTkiDCC30tBVE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV0PR11MB9792.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(10067099003)(22082099003)(18002099003)(56012099006)(11063799006)(8096899003)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UGVyekZCMWxvUnVNTnd6K3Q0T1BlTnRqZGx3QS9rNjV4WmE2cWFCMUhaUlpV?=
 =?utf-8?B?R0RrUnhlOERHR2QvZmpUTWZ3WVJWWDJMTyt2dHhxa1F2S09vbjZzTzdSOExo?=
 =?utf-8?B?THFJSU1UYzh2THRLNms4TVlvUG1zMzd4eXR1c1JvdGRvSVExRE92NE1maFI0?=
 =?utf-8?B?elpuazRPYUhpTFZXQ0FFTlQ0aFZJc1RnTmxmT2FLQkpJeXNHbVFLNTN4dkQ1?=
 =?utf-8?B?ZDhhbnRvcEx5UE4ySzNoamtSZVNSbVIwa2tEKzd2UFJaSDVUTlFNVEVmKzNG?=
 =?utf-8?B?MVZrQmtESHh5KzgydUlpQk04ZU1HNXdFM1IrZHZZclc3WC9IUlJhTEthLzBY?=
 =?utf-8?B?bGp3TGJnVmhqaW5ISStDRUxwOWp4R3I0YnJsSDF5UHUvaE5vZDkzam1NbkRm?=
 =?utf-8?B?M0tvVEx3SEhLQ2tZUnh4ZUhVUzdTdmVZdC9jNkQ1UHRrZTVBTVNXWE1QdjQv?=
 =?utf-8?B?ajF0clRSVUlubW5yRk9weUszWS9OMUF1c1p3UC85OGh2R05YdDgrakhvZ0Vt?=
 =?utf-8?B?Tno5ZDFiZGFQVTNNR1lyL01RY1FMenZobC9YT0pmQXllblppbTF6VHUzMmJJ?=
 =?utf-8?B?eVprTy9YK1VZdkU2SW5nRzc2alUvT2FSNGtQd2xTVy9wc0dnbEJjU050S3FB?=
 =?utf-8?B?QTRQdksvUzZZSlJWQUVOK2piUUE3d3RQa0JGVEtyd2NIS29saWZ0WXJOc0dh?=
 =?utf-8?B?cjI3YzNkSWxzbzRoRkk4ZjhtVVlreGlQbGVmN1NWVWp1S0IzeEtwVmhCVTQx?=
 =?utf-8?B?a3hhZy9HUHMvdWFMOFVRdzFDS3BKejZMR0dxWlc4S1NLTjdTcE9IN0xIL0w0?=
 =?utf-8?B?NFFja21zdWF3NFRlRjhyM2lMY2dKNDl0disxUFZYQkRnZ0ZXYWNYb1FmWHZK?=
 =?utf-8?B?cTVrUDljeFl2aXNnUCttdnY0bTdPOU1wT2FiN09acGtLc0VFVzhRWnFSUVI2?=
 =?utf-8?B?Mi84T21mT0NXaHZPYXlNcEVLeTRRMmwrR0FTRTNERld5QnlnUHBRK3lsYW4r?=
 =?utf-8?B?aUZOa1hseENIZWhBWTBOamJta3pqVzIrVEVvTkNEd1FqOGovdkRGZWhvNzZm?=
 =?utf-8?B?VGJtUGZqUGF5eXV1QlNPSjh6cHl1dWp6aUxldUZaL0F5dkxNa2h3WExibHN2?=
 =?utf-8?B?YStMaVB6Wm51Vk8zSFZMcU13Q09TU2U3a1FVeDZtYXVpVENHdVJCWmN0SVJQ?=
 =?utf-8?B?d1hDUGxkYVlPWlVFUGhSblFySVNuVG5QbTNwd0Z6eURVTHlmUFdqT0J2cEJJ?=
 =?utf-8?B?UkpzSjZZbmZXOStBUEkvazE1N01oTWVwYXhEbGtuRDRUUHVxUENqb3QzNkM1?=
 =?utf-8?B?SGh2aTRkekFmeGpZQ29QK2U0YUdXZ0ptNDdGaDd6TTA3TGg1NlhNR28xZjFi?=
 =?utf-8?B?NjhJU1BHRHBFa2tMeGh1R1l5QlYxZ2VXZXpRSTJyTFFpZHVuY1dHVUJ1U0dv?=
 =?utf-8?B?Vm4yd3Z3Z3UxNzhnWlVsTnlwUzQ0OUZRWSs5YVZoeGtyU0R6eFRuTkQ5ZUtU?=
 =?utf-8?B?VXhvVTFGNFZ5SWNHUUtiUDcyWE1wVitOR2xIeE1JcWpYUWdRMjA1YVVCd1Jv?=
 =?utf-8?B?b2c1THpjKzJNdDNzcU51bTZPamNUWWJybGNoS3QrcHptc3NDSk5Xc3ZlWUcz?=
 =?utf-8?B?RDYrNks4ODRlRVB1dnJudmtOb0lyQ0l5V2VsWElYS0t1YnAyREp4WDBhYTJa?=
 =?utf-8?B?dUJ4Zy8wVXluQVFSOU1zRGxpdThSSEljZ1E0dGNvTVlDSDV6Tll5WUZLNVpK?=
 =?utf-8?B?NTNDODBmZVMvTjNHSm80VnZhWVVuMHlFa1NZVGhGK0lqN2pYa09IWDlCY29E?=
 =?utf-8?B?MlVWd0Njcy9ac1phZXRsNE15cmxDUEZaNzlGdzFmTmt4N2NpUnh1YjU3Tzdn?=
 =?utf-8?B?aUxjVDVKT0tRdDEyaWVLKytBQXlraUIzaDFhM3BHVythL2JUc1YvSXRvSVVu?=
 =?utf-8?B?SHg3M2RRVG5nNnYyQWF1aW9YOVhIcTRvckZLTjBjREJWcVBIMStoZ3RscGJq?=
 =?utf-8?B?YklWaElOK1l3Nm9rckgyNjhzemFXcjUyUmRwaUpJWnA2ZVNGQVZiSkMzMCtv?=
 =?utf-8?B?KzN0anNSdUZRZlZOSlZRa00vaUZMTkdnMDhRVENFbEdEbkJ1SEcwRHBJNnJX?=
 =?utf-8?B?bjVUMWNmREJYSklzdzQ1dlhoQ2JCWXNhcFkxdXVlbFZ4SUo5bTA4N0tmZ2FZ?=
 =?utf-8?B?R3I5Z1d1MXpJS0V1NEV3ZHVlSVR5VHFYVWNXV3h2T0Nhb1Z6YmFDM3hqSmxI?=
 =?utf-8?B?aUhnckJ0MUNFRUljVGhnSmpzZC9kWnVaOEF5ZlVURXNxVytLYkh0YW5oc1d6?=
 =?utf-8?B?bXZkdjJ6RXVaRXQzVFlOS2E2T01uSzd4TDEvTmhrcnozSXQvcWdYblk4UVRI?=
 =?utf-8?Q?DJ5b4JrG70xId01Y=3D?=
X-Exchange-RoutingPolicyChecked: USJuClkJedoecESjH2SUIiVA6kkZpRxsvMz2XpY2B7kI3WyMOnf7+5upuL/9wiq9xBakmQdzuMmX/DmPy53FoS3lqCfbIkux/iTEK3VcJ6Mjgxj0YHGS3a2tdneWf9e97h76/upI7X8VeIaEjVLsugHBEn2y26RxcIv2LS1zFfICCuLna6lCW1GfVnYHz2B+gdeEko/D8qaIAn8FShR/Hv66sGOZ2azdGRCvon/ZaHJYWeqVcHyXsEv1kPrALaTcIHYX8D5p3ztPPlGoP20r4fDGTEVRj45ZpdyjAV+WcmGPMYAvBkkY9WBxXmnnCBieEtXPHovkGmbwoBosuXs8lQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 77ae3390-7d38-423d-190e-08df0c2143c2
X-MS-Exchange-CrossTenant-AuthSource: LV0PR11MB9792.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2026 14:15:12.1096 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sOkCCbjtH3A1s8SbkAwej72QwmaRKlQD07R1tmQeGsZ7TJcK3DZOz1s82fr85j06Mscv/44cnz1PIHL9flVgQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5069
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

--------------f56L0uGpdGbtR1P1CbY03XFs
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 25-08-2026 23:24, sashiko-bot@kernel.org wrote:
>> +		for (i = 0; i < num_headers; i++) {
>> +			u32 num_logs = min_t(u32, hdrs[i].counter, XE_RAS_NUM_COUNTERS);
> [Severity: Medium]
> Does capping `num_logs` to `XE_RAS_NUM_COUNTERS` (16) cause desynchronization
> when parsing the raw log stream? If the hardware actually embedded more than
> 16 logs for a specific header, limiting `num_logs` to 16 means `log_offset`
> will only advance by 16. Won't the remaining logs then be incorrectly parsed
> as belonging to the next aggregate header in the stream?

hdrs[i].counter may exceed XE_RAS_NUM_COUNTERS, but the info queue 
contains at most XE_RAS_NUM_COUNTERS log entries.

The cap reflects the amount of log data actually present in the buffer, 
so log_offset remains synchronized with the parsed stream.

Thanks,
Badal

--------------f56L0uGpdGbtR1P1CbY03XFs
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 25-08-2026 23:24,
      <a class="moz-txt-link-abbreviated" href="mailto:sashiko-bot@kernel.org">sashiko-bot@kernel.org</a> wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20260825175418.237511F000E9@smtp.kernel.org">
      <pre class="moz-quote-pre" wrap=""><blockquote type="cite" style="color: #007cff;"><pre wrap="" class="moz-quote-pre">+		for (i = 0; i &lt; num_headers; i++) {
+			u32 num_logs = min_t(u32, hdrs[i].counter, XE_RAS_NUM_COUNTERS);
</pre></blockquote><pre wrap="" class="moz-quote-pre">[Severity: Medium]
Does capping `num_logs` to `XE_RAS_NUM_COUNTERS` (16) cause desynchronization
when parsing the raw log stream? If the hardware actually embedded more than
16 logs for a specific header, limiting `num_logs` to 16 means `log_offset`
will only advance by 16. Won't the remaining logs then be incorrectly parsed
as belonging to the next aggregate header in the stream?</pre></pre>
    </blockquote>
    <p>hdrs[i].counter may exceed XE_RAS_NUM_COUNTERS, but the info
      queue contains at most XE_RAS_NUM_COUNTERS log entries.&nbsp;</p>
    <p>The cap reflects the amount of log data actually present in the
      buffer, so log_offset remains synchronized with the parsed stream.</p>
    <p>Thanks,<br>
      Badal</p>
    <blockquote type="cite" cite="mid:20260825175418.237511F000E9@smtp.kernel.org">
      <pre class="moz-quote-pre" wrap=""><pre wrap="" class="moz-quote-pre">
</pre></pre>
    </blockquote>
  </body>
</html>

--------------f56L0uGpdGbtR1P1CbY03XFs--
