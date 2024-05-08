Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9D66C04FFE
	for <intel-xe@archiver.kernel.org>; Wed,  8 May 2024 17:20:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99FCD113128;
	Wed,  8 May 2024 17:20:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aIt84bwC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06EB0113128
 for <intel-xe@lists.freedesktop.org>; Wed,  8 May 2024 17:20:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715188858; x=1746724858;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=uinpUOSHHioFbGx5B9PFHM3pih8ldZVhKqEBtabP+Qs=;
 b=aIt84bwCYufqKsSrt8y7bXGo9XDVbvTV3VtT6+lmJSpzrImZbW/eJnlB
 eSAzzlsWZeJjA8rMi2yAYypiCE/BkIDdmtNlAY7svjYKChEKYPgYrEPuZ
 bwz8YqIwwafXxEZeN/a1gJnXpSXVhAji3Q+4owirznTwYRVS9epamB9jj
 /BUR2eYVv5sbXzHe9N8E7jDw+PozB9nLRQNHOBF5tmFPSFwiyMYMY06B/
 97KVNT4cTnxq9UbxDhjLtmt+8t6W0ysOpvppr16p3KshxsQ96ZnX7dyeW
 aUT1Le8o7Us0rRDRC+Susj+i1bB3S8Y1FzLrCCndoNEcn0XLzCPo+fTT2 w==;
X-CSE-ConnectionGUID: yZvtLdoRR1CEGv53C3JZzw==
X-CSE-MsgGUID: QNourtp4TdKrNgnuNJj1YA==
X-IronPort-AV: E=McAfee;i="6600,9927,11067"; a="11430814"
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; d="scan'208";a="11430814"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2024 10:20:56 -0700
X-CSE-ConnectionGUID: rnVWKymySX+2QB1GFXYBig==
X-CSE-MsgGUID: Vaod1+9RQJmlIrEEfuMObg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; d="scan'208";a="29532248"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 May 2024 10:20:56 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 8 May 2024 10:20:56 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 8 May 2024 10:20:55 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 8 May 2024 10:20:55 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 8 May 2024 10:20:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WG8QLopzKizgBAUg2thyymusg9dZycCY0JoegHglNbnJNrE94VFRwv/M4FGR+Jpq+bNd92X7UIB0gVOALVg+Cbd0HJF8ihbVt1TM5i19BncT6LCP2fiK287fkkool20ATcnulQ5Lvh0ZMA7ndhxUpWMvpwlYBM8u6VlDZPXI85hB5fA4lvcaPIq5C449dik6N1gy6MJyku9t1tyuW1u1KUaJEvGDcbploiFytGW0o2EwN2QooAjmy9bQ/Vzmbt2/Q6RPZKtZVVrTjHVIsn7uhsBWWmZTwV4DyW8ZXuNDIvseqRVtmbbzIWVgrAWydb6Qm2RxTgHNN5dp4b5MfYkuiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hHtcu2pgkhVgfzeQxC44NRQrq0I1j7TdrHcSfepB+Xk=;
 b=lC31lKkRqCrYM+lDOGkYJ1goK0pnU44IfB43OHL5kCagsXrOH17SVgDk9z53JtCzr+idBwpEe2eZavNtTDZOvt//Jzr0I6bCfE7C3BJGHuqh4q5Gl6EDLHh/IU3y7v0T0PiHPJjPqUsq5LIAPXSVgeWidXNFsVVdsy+de7Sj9sRAlYcMl0NE9kYxsVV+ab5UGdll0oHZwYEA4RLyTJt0/jtbXQy9sbTZfy29l+qkyFf9x2lPsWCM0Svp2tS1d91rv1j0J0gzljbNPg5cFqPvVtJq23N05bQWRRW4pzaAGeQ2NXfidY28d3TrmySw+MZtF/2193J06Q3gENrNSXhEWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DM6PR11MB4707.namprd11.prod.outlook.com (2603:10b6:5:2a6::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.46; Wed, 8 May
 2024 17:20:53 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%5]) with mapi id 15.20.7544.041; Wed, 8 May 2024
 17:20:53 +0000
Date: Wed, 8 May 2024 12:20:50 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH 1/2] drm/xe: Change pcode timeout to 50msec while polling
 again
Message-ID: <2c5neatqsn76wml622rghitoeayqrbpd43ida5mogck7gvitqe@xitn565xsbqj>
References: <20240508152216.3263109-1-himal.prasad.ghimiray@intel.com>
 <20240508152216.3263109-2-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240508152216.3263109-2-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: MW3PR06CA0011.namprd06.prod.outlook.com
 (2603:10b6:303:2a::16) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DM6PR11MB4707:EE_
X-MS-Office365-Filtering-Correlation-Id: 640e749a-b830-4bc4-29d4-08dc6f8336a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|366007|376005;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?pBDfpE40Z78TGqp37Nm8c//9GcZR1Bs788qwAmtv7+ylc4G1nUh6KTEzoeEG?=
 =?us-ascii?Q?NY/DOLCen9OIV1H/oHnHamJeQNKU3f1RmguyvxYOGYZZosmD9plHGJs5BS2R?=
 =?us-ascii?Q?hZMOiTD4G+O793y2zxJG1h6Gzh+OItvrUO39fvMreQ57NaLOwqwEimdQxePh?=
 =?us-ascii?Q?3UkilyfEXonpeKCvio3/H8jXFYrOTVXn3jaA9lyzIZBlqMMv3jYVzVJO9ouZ?=
 =?us-ascii?Q?3BAYgXv+e5Dtg9c0guLBoj+tzMVA9Wr1BK6eccpNAEPtSHuDBglX7Gf5YcoT?=
 =?us-ascii?Q?r1iXB9fzT16PTCJCnOHFOBnwgqbt8YIKti/Xu0XhNSq2KRa8+6t/skU70W77?=
 =?us-ascii?Q?/sAT+oxq1CBlhFuucM0Bo0cq2QdGbVV3c4VafI7M7GqNDvoGABEtRywH+czv?=
 =?us-ascii?Q?Hct5BzHFOKNcIakFmRIDdGnKoqapD6qng3SdM+z809hbC4upjcESIM90053X?=
 =?us-ascii?Q?ayLCfu5gSVc72Oif8VOVVOSAzIt6HynodDT20izoSBs1k4BsMzKvzL0ZIk1e?=
 =?us-ascii?Q?boFjdH3/ZsfK7Wa3u4dU12PkD5NEMZqdMMlNeabp6mhne7kl0dgw6oVgSYtN?=
 =?us-ascii?Q?ZGOOjxetqEkDCzoiiHpZigAH/z9l/lbw+fQMXnhTf6zl9nX/bm6TucquAHqL?=
 =?us-ascii?Q?a5shZAEPNtJhIeEIyEqIbTt0ET5P/xZ2ed8Q0IxT9MrYtB4vniwJC3Sdt0jC?=
 =?us-ascii?Q?TfUJVYFyrddS/B2p/EYqrE9ustWCIkgy3dIfJMIBoektewEu7HyX22xoaunf?=
 =?us-ascii?Q?CksDJrgTqcJ7F5U5j2dOAZN/CU9s+yzi6W9rob+sTC3YrU1nyC0uWax07SiZ?=
 =?us-ascii?Q?una7agfg585qDs5uUfhJf3qFKwP88syBfUhSRBlmqZoJh2tHzVWhJ0aaFecA?=
 =?us-ascii?Q?n7WnNA0qvX2umawzksWd/zJGApklH/6VzLfSrXk/KkTOE8XEvJ4UE7/iUgPQ?=
 =?us-ascii?Q?K81bwMsBIgJEDD2skogxVr0dsapc9MIkwh7HHMB/hqxFGJk0tBerYIo5Tnak?=
 =?us-ascii?Q?0Y9DnIdK2G3y6697qrq0WMVduPv4zZbxMvNUrfmoz3deqhK8HMqUE5zwacf+?=
 =?us-ascii?Q?HoUvHbtZUmE6eYW7NFUHvKfRiRsPPDRO/aLNytOgMz01jAqgHGXTx6DQezb/?=
 =?us-ascii?Q?hrAVfqZuvR9c8zVf8HDaTqfREWr6vAxtz+cAnQSxUTssmyRjugITqT4mRDA+?=
 =?us-ascii?Q?3XMjW/yTxnm3fMGZoOZjj3aKLoLqmpRutcpdBkT5iMLl36wMbWABD2hAd7My?=
 =?us-ascii?Q?MBiZ+chVyYZm8LA4w9CNCLN6poHJoI4xWHLKIBd/IQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KNLj8dSs6LVXCUfNTkkTmSKtSVAL2X9P3dougncqm6VzUFYMFnVI0BIAHFvo?=
 =?us-ascii?Q?6PTyoIS4h+X0+fEEmALKJ6mAtNeFvHuwoVQLMTg1yKw/vcu/6zDf8IfokYEM?=
 =?us-ascii?Q?llNhId5Awdlob5Ck2JoCFgV5KY4P8EqIAIrQ1JkWJX3PQctHO3+HCDW5MLOp?=
 =?us-ascii?Q?2/mmPJ6gzj9Ezb/KufumGTv3NDalLYWd0gVaoI3/NexcxtKKVDwNjwNKharg?=
 =?us-ascii?Q?fHi9CIRjtJIx2t5NM7LrAeWBjqzJOl69zRBmI5MYrrxIqi+MiHIR0QiGVVU8?=
 =?us-ascii?Q?5hp3idy+rCbOoDpw+14Wb6j2zd3jAIov1VWblJqqXw6c92OwDbJiVHJWeoUN?=
 =?us-ascii?Q?AuwLqTtGhsJ9Zlf72xXNNa6JrBgRblk+l9WxGYrZTgAh8c3R+DKSGzutaScj?=
 =?us-ascii?Q?oq9fwPwLVsMNrUnD2MDZWmAc60ePs0RKdT+420GYOKgBVSHRVKVcts//19QA?=
 =?us-ascii?Q?tepCoIq3WM7zNRNKBjqY4OkM7xWNpC7lYVRjek9dyXf3zzNiEaf9SciXn8F+?=
 =?us-ascii?Q?F7FrpMi+Z23WhfE9y0O5K297u3cvD8YUDOMnql5IIqZCa103nV0IoIAJvF+V?=
 =?us-ascii?Q?FY55UbVpbfKY3jKz2j+7HWDt/ppNs+p9rCR1/iBURT5b2zpPjxjGqhxVXd+6?=
 =?us-ascii?Q?XlfwUAYdL7UEj2iAzDhgCJ96PH+MO59c4RqKP6rJRRw5mvuGwV5f2iV52MmY?=
 =?us-ascii?Q?/arKChFR59RKRdWPXVgvFdyC5Dwb4ZkeKmJ3VbIkEmxlQQc2HtFgKqAOFWD9?=
 =?us-ascii?Q?q4QJ8nZfndzz0t8OHeldwCuTInckjIyX84Ty2KX79tMIqLfF+JNqiYZ5xDAf?=
 =?us-ascii?Q?crRP3JZegpMaIhHRNAELZP7SRAgcw19BsIeOoidnDlij2x8FEX/3YMv1ejFx?=
 =?us-ascii?Q?MKFru9ffK4UBCDgfldqC5QzHoHhH50VK4hBx4xOOWMs066XEIqwHjs8y/zlk?=
 =?us-ascii?Q?dfg8Ypt2rjedpe0nUsUziuG+dzoS0aBm5MuQe287iDw/2UJ0WAlvqU6+iGON?=
 =?us-ascii?Q?i+6EV/PosODufm2KtWeeZc7wCdlRWDIsI16ya7jwo9s2hK3Bf+XqS7fXY4NN?=
 =?us-ascii?Q?Fw2T3NhtoZBiZslnRCpShB2gl4Vy6os9OWU+NzLoj2dneVY5k7BTsrsa30sz?=
 =?us-ascii?Q?0xSzD1fl8LUgPe5tnT8H2/pO+n/ZNE6FJOhT0yIoLUJd6w8TTjzlHbSzXogq?=
 =?us-ascii?Q?CSu8Jq3swJThAH1Can1MKoLgSA4Pl1tcBy+lSYCXdwzDZ67HDBA5LMRRRdq8?=
 =?us-ascii?Q?7ecSQAvLVaeEZc7jR4U2hgxckinT0my1SxxCZ1hVhATLsPFV5cJp9ZgNivMp?=
 =?us-ascii?Q?4GVZAfBPaWB/M9F+1FV3VfpUtcepdYyS4W3qsfhX9Ru+poGCI0PInpUb1bTM?=
 =?us-ascii?Q?VyoFkfKwpVD33Kbew4SthrJas9z1bCJ9mHr6xpVj2SQFUVvE13D3Ct2ipUHc?=
 =?us-ascii?Q?jedO+VX1jakZAKIY1Pl76V/R8pV8SUeVm+VTVWMHkpBf3+PeAFjC7ro+E4uD?=
 =?us-ascii?Q?Mn6KVPbNcj2+r2D/qm7AZ8bUS5UO8oGsceXDQVfn1I7CqvpytssRrp8jp6/d?=
 =?us-ascii?Q?56C5wv7vPg+NqunYAkjnk41S6tHZdRHJTLw/2gfHRKCCrp07A/P/Q0EZ7GBn?=
 =?us-ascii?Q?9w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 640e749a-b830-4bc4-29d4-08dc6f8336a5
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2024 17:20:52.9982 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6gxp9Nr4d5PfUQwS6bVf6x6sf6KsHFFXJAjjMCr3rrEROPuxpmdpAuFmKZlIY/z/mWLluhqdb/8HRpIPzuYvPJkLC3M/EeOlGF/Cw0mp0m0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4707
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

On Wed, May 08, 2024 at 08:52:15PM GMT, Himal Prasad Ghimiray wrote:
>Polling is initially attempted with timeout_base_ms enabled for
>preemption, and if it exceeds this timeframe, another attempt is made
>without preemption, allowing an additional 50 ms before timing out.
>
>v2
>- Rebase
>
>v3
>- Move warnings to separate patch (Lucas)
>

Fixes: 7dc9b92dcfef ("drm/xe: Remove i915_utils dependency from xe_pcode.") 
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

thanks
Lucas De Marchi

>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>---
> drivers/gpu/drm/xe/xe_pcode.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_pcode.c b/drivers/gpu/drm/xe/xe_pcode.c
>index c010ef16fbf5..a5e7da8cf944 100644
>--- a/drivers/gpu/drm/xe/xe_pcode.c
>+++ b/drivers/gpu/drm/xe/xe_pcode.c
>@@ -191,7 +191,7 @@ int xe_pcode_request(struct xe_gt *gt, u32 mbox, u32 request,
> 	drm_WARN_ON_ONCE(&gt_to_xe(gt)->drm, timeout_base_ms > 1);
> 	preempt_disable();
> 	ret = pcode_try_request(gt, mbox, request, reply_mask, reply, &status,
>-				true, timeout_base_ms * 1000, true);
>+				true, 50 * 1000, true);
> 	preempt_enable();
>
> out:
>-- 
>2.25.1
>
