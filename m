Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C99E2C71130
	for <intel-xe@archiver.kernel.org>; Tue,  8 Jul 2025 02:56:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BFA210E57D;
	Tue,  8 Jul 2025 02:56:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X8+s0tgH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F023310E57D
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Jul 2025 02:56:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751943369; x=1783479369;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=5oGoQah8xAdthiZjUjmNoJQwJ0NzbK6NxBMFncfrX9I=;
 b=X8+s0tgHgUPEQiQYCwXJ8VtsT/gBPMob7eZ0AS+bucjbZlY0GBAc2+nm
 tyzAo34h1W+sshK1CghS8NODMZiCUP1SsNSXw789a1L6M1ALFSug5VHh4
 Il/LVvVkBYQ4f1WwVWdJmiFR6s5KOSPp94QAWPmHCdSWcZMPKdf92VcIY
 2J/uOeJePUOfCRucEMLtYXvARSSDe0yIdUhlF2fl+8+HmXe4pZHkEh325
 llHH0O/xSiINWWc2WAFvj/TPIqrTXRoGRZ5bzTlOSSd8zi9xeVaANF9K5
 1oaGaVwoQIXvFy9A3tbhbqobK/MA38uGOHfWjXi8yU5dler8kPCt666aE Q==;
X-CSE-ConnectionGUID: M4NdOd+fRruW1x6dQDb/2A==
X-CSE-MsgGUID: adSA8rAeSkGsNtQ5uPvEpQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="54099277"
X-IronPort-AV: E=Sophos;i="6.16,296,1744095600"; d="scan'208";a="54099277"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2025 19:56:08 -0700
X-CSE-ConnectionGUID: kBHMW9YbRAuT3hvll8h0Sg==
X-CSE-MsgGUID: AdBCXiSsTCCESENnCPoJXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,296,1744095600"; d="scan'208";a="160921187"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2025 19:56:09 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 7 Jul 2025 19:56:07 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 7 Jul 2025 19:56:07 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (40.107.95.51) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 7 Jul 2025 19:56:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i2fSWVj7UJ1Jm8IaDTyqfG9k+/GZ9nvPWonj9zv7KTP1Hbwb+Jb2GQHuzRwi+hs1aY4G/y6uu41Pu8FCpdqpN3AoFZN/U6bMPWSn0GZKHSYJAD5ZeBPScWUpn4EuAyoL3njvZMM2oxygxkySsVCzSGvSjpLHN6b5XduHaD+mL9MGBru0+WqMgWhf7WEzzTzJsFPENuIlH3iZeSW7pFn24ScOoOsAGeDvjMeOZ59d+s70vUtoMj0sILzYBzC6UBxKceEkzGIDq+zHcpFQfMWK3yaBhTRm6yZuLJLh+Gaa1whVQj7g0DXEx4Sfv77fnIiss02iGmzIlhFiHUqRxOJrtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M8k+gQs+GKUSRAottq0WP0CY5VLXGPMAksD5fuCpI1s=;
 b=xMh4fBn9tPHzLEJGY3aL4ipIn+pERnn9PF3ZootpCOM0JoXi50n6byfAjAeMv5XV/DUubp2L/UPR+b1YdlajxNUii583Nmgt65hT0M35G50stCfjcEAyAp/NVV3bQAOC0LlxY0e8hTB6yr2dps5BfOAZsHyat/5q/K9Hbvd8tyeHRZTVpjiTd3p9NMPxLhMsDX0Bsv551wRjSmMBMm1PWuSjoYxLdPM6cx5eYDM+rXPUw1CH2yQYq75ykZ5wl8u5YNx6Z6zYqFmHOZeCiJCX4Syfz99dKJ+IK2O1gFo0irkW13SvC0cmhVVas2sfAiQ39l3AEIDqzkzhGbmIGwAlMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH7PR11MB6929.namprd11.prod.outlook.com (2603:10b6:510:204::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.34; Tue, 8 Jul
 2025 02:56:00 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%5]) with mapi id 15.20.8857.022; Tue, 8 Jul 2025
 02:56:00 +0000
Date: Mon, 7 Jul 2025 21:55:58 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
CC: <intel-xe@lists.freedesktop.org>, Matthew Brost <matthew.brost@intel.com>, 
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: Re: [PATCH 6/7] drm/xe/gt: Drop third submission for default context
Message-ID: <nxvygecgyeh43k4pru36f4v3g2qcgweh7wsz5mhphiky435dwn@hc2hw4emmzav>
References: <20250703-lrc-refactors-v1-0-6aa22f174041@intel.com>
 <20250703-lrc-refactors-v1-6-6aa22f174041@intel.com>
 <32e154a8-4c01-47eb-8ac9-bbdb42a3eeb5@igalia.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <32e154a8-4c01-47eb-8ac9-bbdb42a3eeb5@igalia.com>
X-ClientProxiedBy: BYAPR07CA0027.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::40) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH7PR11MB6929:EE_
X-MS-Office365-Filtering-Correlation-Id: 108d8c06-2d65-44fd-7a1f-08ddbdcaf86c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Obs2u4KSg3rFvIS8atMfuA4buC7Kow3HfSsHdrxXrVA93DIHUH4Hfh8RcxWr?=
 =?us-ascii?Q?FgO0t70PpV72JSDdqC2zWpAqpQxGriILkrNUNtBke+vegirHPNG5zmptO+2g?=
 =?us-ascii?Q?7ruLcv2tZcE1R8JZJEUdNHfjanxlpHaKdyaWulnHoSW5jYEtPo9tmWO5k+qN?=
 =?us-ascii?Q?oKl/EmzDRXUiXnY4mI5/OY0sK275w/KNAgEZFF7VVwV90B8PysGgIoVqeASk?=
 =?us-ascii?Q?1LgxxujKsg4lLwgRsmuOMf6Dm28eCfvEE6hJl4Xytzgt+ulel9IWNeX7buJF?=
 =?us-ascii?Q?QVrfWeXA9ptL5vG3wxSRFEBXgs0Upk4HgfVCEexBxTH/PaEHuUhplVTD7fsj?=
 =?us-ascii?Q?ze3GL3cKQvltVVlEL+a6+Jvl9o4eoFCCgQOboMyQVXcodK8eGF/DxaqmqohE?=
 =?us-ascii?Q?yXDQBzJgRGjuB+Z5yhbbcY1Ldrjcu9ztT0Xe3u2uVcBh6LJJDNrFU15lVzDj?=
 =?us-ascii?Q?C+CLkKfnIyaF+MijEXWJ2rRbvD2PBFZr3gsDCPITESXNueDxEfc4F4ovB2/d?=
 =?us-ascii?Q?9PzKnJDG7U5TTd9ot8bq4RZgzlew9nGqEtvtQ96gsEm6hdhNfPfI2BlnO4GS?=
 =?us-ascii?Q?R/zQLPl29IPd1O9zIqP/PE8Rg7okDPgE6HZmPjhtGwgZdf1dWxMTXYXTK5WZ?=
 =?us-ascii?Q?TSdxbK5bxnDRHDWvneQ6t8GVWbGMlnFwzw9fYoAkE/xxWhiUeSpIzlth01GP?=
 =?us-ascii?Q?j5AZPckSxTB4gwoYV9oCB6qaBR+/0V+ldavlQYZ6TsMcNNoaLD9X3yi3nrWF?=
 =?us-ascii?Q?muvimatL7K94UEFbDOfWWQXLdotsS0U+nwd7xhtkQJvCdSwSOwhbeXDWV+za?=
 =?us-ascii?Q?poYDDTrWbJP5hr+G+apaV5KVhoXLnzuA4o8nNlG/73MNUupPxJwesUaCzDEz?=
 =?us-ascii?Q?6EMR+/wI3zSjZBKWCg3lzHsDyWzM9dnjR8cTn9B0fr8UCXgPSBQc3o5JPzzZ?=
 =?us-ascii?Q?zGxjQwV9pxi6tLLmpFgiNKElLt1Q9vTWwa1I5dLQycR/QDhJALLp3Q3ko5wX?=
 =?us-ascii?Q?lSkOCa0FwnUFEBalyI9AU8ssquK7QCc56D6UilPDOHpl5yeX4XCFU7RpP6O2?=
 =?us-ascii?Q?SZDgrzRfjZJSCzHXlSsKYormWGJ+j9K/NH41Xkqeqkv49U5fkra96K8wR5g6?=
 =?us-ascii?Q?ntcGdoXKneEk2XsQsU035UvOBTue/DBUzJQoYxzSmVD30yP1iJ275+7mHqnP?=
 =?us-ascii?Q?TYtqvqht3i6vO8p2osymEk+lf9ZZ8GdF8MO244RNLEyJTYXhtWj+CQVw6xUe?=
 =?us-ascii?Q?x5DD3IF8htr6cfGJm6Nfoeymq2yAVydFlIj61uE1zqmdjJstxkFCWKdb7aCU?=
 =?us-ascii?Q?0gicJAfEZW4TSbgKaCQ8sm8VE7Gr0rvSaFclXp/PI4Rb7AydQ6+0OHGQBYWq?=
 =?us-ascii?Q?7HWtWaYAqayOzAqJqtwsA+NWXQe2SD5Hkn1q+dj/04LtUsoHvanBLVgg99Pr?=
 =?us-ascii?Q?PyQA7WulZbk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?naAO/4ut4nrOnuFrXRVt5ISlT+TaypXZ1rTCn46c6c4sZu+Ug3ProPf/RJ3q?=
 =?us-ascii?Q?rVTROgd9IljpU50IheXuyvCicpPg3/neAzZ0Z7TFAojj/Q7gnxK337Di8CUB?=
 =?us-ascii?Q?t19yKN2Qzte8YbYKp4Gprkn/qKUPn7l7mT2lfjUcCMISLJNV7i023hHyyrqs?=
 =?us-ascii?Q?7aFXLlN3xW6LhCu3AL3Cc/0ij7vucbaEacMfVRsmcVvJFA8tz28kMw1aaKjG?=
 =?us-ascii?Q?TLAabkc3uI/4cXzyRDfUEVCOzrbt3bFOFcxJduC5Oa+6zUH3TDKen6Co/wYT?=
 =?us-ascii?Q?I8O5NTx3JOoVUixhjS8DrNYmMlgC1ozVQwp4mQ67yLh0urStFDVhzOU+9JFY?=
 =?us-ascii?Q?y3kzOH5K/xTLCFjLe65/2svNG3Ch+j2B6/53F9+Ox2aef7vrTWOLAU1gTf67?=
 =?us-ascii?Q?+C63g3sdFv5uAE6NaGFKZmTTnEg3LkP9ICQMu3LZ95kBLvsVkO9nb/Tp7pPL?=
 =?us-ascii?Q?vvvrPqOPERL4ZpJeqnfGaMJVHSe0IuCa/4SdVgjD8GSmsz48a86u+w0gZjXT?=
 =?us-ascii?Q?OJtwxW0L4jttu3MdfyxPbu29mUSIz5IXcBy+UASgixnjeDKuGf2f20QI1U7f?=
 =?us-ascii?Q?3E5+III2rpZhsLuAtL2iLfxH3H62tgBRYaPZOf0CwS32LG2oTM0Ez3W3/LwG?=
 =?us-ascii?Q?KVTYtVr2Uo0Q94iISTTZclQ2hlip1uKY0xn3U/xWgyHMDEthxiYUeax/Joqi?=
 =?us-ascii?Q?4nhbiBpfGqBrcNZFalCNO8fD2NFpTeKIplfdRPcCYR/sR0IFQ4eEKuvpAu0A?=
 =?us-ascii?Q?iCvMya0EGdf4CjCJzI4M0uu1ecl5SQ83b1dnjTC6+/MjuZ0V+pmIqq162pty?=
 =?us-ascii?Q?+/pxYSHLMKA+NNb5hta/TX2Av6R80TvBS/xcqkPuWwRrAPqKpuj1R6RGu/E5?=
 =?us-ascii?Q?yEg3W/32S/5P+vUpojlP91G2fn1KNKPh1LCjeUUs9LlEmZs+wU0/TmtXm0o1?=
 =?us-ascii?Q?BY2pjHO03sXaNFGkTVjFMJT+/ZiRTfA/cD/NBBapr4aD0pgVmJeyCM/WlwkT?=
 =?us-ascii?Q?6lxNEaQ17g0MzIO31ZHyg0nBDwqBYbdWT5nckH311Tum+eQXyjQxLO/Cpu3g?=
 =?us-ascii?Q?TzPWuxTUkH4ZkIcG+tcPkOZN7aHbxWyjY1HOQIMnnElM+36py93BgUkf1DbF?=
 =?us-ascii?Q?MLpwJBKjoYukGgdzk9PX2YxTWrysj0E6EXvXqDtJH9/p1yEYSlt2aqfCxjvc?=
 =?us-ascii?Q?/uj4SzKTgP3gmsHrl7deyhiFWDyksb3+bl1jJC2hL4hLkjOt21Z409E/8B1v?=
 =?us-ascii?Q?k4LOpLpcdydYoKvPV2Lt7UxpsYaxxRV1/7z3szz7ducbn4JzNGE2ETf9RbP3?=
 =?us-ascii?Q?LI9LA0FwPo+zl4TY/du+KEEfOyxynl+erUsEVe1nd5BR+QZCAdQa1pNIFhXR?=
 =?us-ascii?Q?7jvXE/ZY6Wj2XOr6feYIg/FXgAcUelerPMQIP3hffyfjRDQ6vxcK8kLvATUc?=
 =?us-ascii?Q?HiYW/BEcpw9g+CmjBn5Tw9Cbccur6R2AEvlxqQYuXs8jywDIq8uceHUy9RjB?=
 =?us-ascii?Q?na3p2PgpvZRpesPtVbkmm3VLWAZKlWziaBZplKloUXStvWWNYoGu9LZnUilS?=
 =?us-ascii?Q?++n5rev9fchpfwrfsmBe2mIU42jAm5UTM5mKINzZXBh2up9nB9qd2Bgl4SR8?=
 =?us-ascii?Q?QA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 108d8c06-2d65-44fd-7a1f-08ddbdcaf86c
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2025 02:56:00.7342 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SCEHeZ7mr1wczJKCVVfRjtCKOykofz/BWXwSa5xWhgDN6UaUwwUSniEzPW7hC5SYOK0tOv/L9SngB/y7Fxw45Wna1pUKPrSg/CuKXfZmJRk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6929
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

On Fri, Jul 04, 2025 at 12:21:50PM +0100, Tvrtko Ursulin wrote:
>
>On 03/07/2025 23:41, Lucas De Marchi wrote:
>>There's no need to submit the nop job again on the first queue. Any
>>state needed is already saved when the first LRC is switched out. The
>>comment is a little misleading regarding indirect W/A: first of all
>>there's still no indirect W/A enabled and secondly, even after they are,
>>there's no need to submit this job again for having their state
>>propagated: the indirect W/A will actually run on every LRC switch.
>>
>>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>>---
>>  drivers/gpu/drm/xe/xe_gt.c | 8 --------
>>  1 file changed, 8 deletions(-)
>>
>>diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>>index 67425e37c2187..439e7c703ed84 100644
>>--- a/drivers/gpu/drm/xe/xe_gt.c
>>+++ b/drivers/gpu/drm/xe/xe_gt.c
>>@@ -361,14 +361,6 @@ int xe_gt_record_default_lrcs(struct xe_gt *gt)
>>  			goto put_nop_q;
>>  		}
>>-		/* Reload golden LRC to record the effect of any indirect W/A */
>>-		err = emit_nop_job(gt, q);
>>-		if (err) {
>>-			xe_gt_err(gt, "hwe %s: emit_nop_job failed (%pe) guc_id=%u\n",
>>-				  hwe->name, ERR_PTR(err), q->guc->id);
>>-			goto put_nop_q;
>>-		}
>>-
>>  		xe_map_memcpy_from(xe, default_lrc,
>>  				   &q->lrc[0]->bo->vmap,
>>  				   xe_lrc_pphwsp_offset(q->lrc[0]),
>>
>
>Wasn't it also racy to memcpy from q's LRC without guaranteeing 
>context save had completed? I don't think dma_fence_wait in 
>emit_nop_job guarantees it. If that is so this patch should actually 
>have Fixes: added and commit message adjusted accordingly.

I don't think it really fixes anything, it's just pointless to do it.
It would just save the same information from the first time it executed
even if there was a race.

Lucas De Marchi

>
>Regards,
>
>Tvrtko
>
