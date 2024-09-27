Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85065CF6482
	for <intel-xe@archiver.kernel.org>; Fri, 27 Sep 2024 21:37:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52DF710ED33;
	Fri, 27 Sep 2024 21:37:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KY736R8N";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DEB210ED33
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Sep 2024 21:37:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727473030; x=1759009030;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=CZygnEdHYB/tLkW7i/5w17F/qPXnLULrqjfSL3GZTzo=;
 b=KY736R8NSvl2PAA3EGG4e4aiuaZP+y+da/YHLt+v3BdHOeYxpSAH8PkY
 EkQ8He81KAnFsRwa1F0MiAjgI5FBnHF8gTp3U8L2z+gHppHBs9Aqr+sYJ
 nLxq0S6hQd/bjn02Wl7YipEEW6Wn5qdwLxnWd+KNabJ9B4HzD1TJptdCw
 +/x8KZlZAcqnX14WQLigxz2KZUisHlFGlW6k0mV21IqQS8qMeB49YoKmI
 IoKbn1kW69DljFMzT6aIMmp7vIt4T5wmdVpOK1s8KBUtda2cU9+MRy4MS
 C0EuMAhTRtuZqwRO/dL4bglkRTES1bSHkOkaA36JPLqIJQKGi3fceehe7 w==;
X-CSE-ConnectionGUID: /W7k9GoRSSK7mB38Uqd+Tw==
X-CSE-MsgGUID: oNYWKuSZQuyNMMRB7Sp0Rg==
X-IronPort-AV: E=McAfee;i="6700,10204,11208"; a="30424901"
X-IronPort-AV: E=Sophos;i="6.11,159,1725346800"; d="scan'208";a="30424901"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2024 14:30:54 -0700
X-CSE-ConnectionGUID: sj92E8KITnCsqxzgGwX00g==
X-CSE-MsgGUID: 3zH2E1ySQj+j/LO5uTd7ow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,159,1725346800"; d="scan'208";a="72724888"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Sep 2024 14:30:33 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 27 Sep 2024 14:30:32 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 27 Sep 2024 14:30:31 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 27 Sep 2024 14:30:31 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.47) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 27 Sep 2024 14:30:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hDEdGTp8bdkol4hDZKhaD0fNjMyID3v6q5g+j3QTgADeLK9Yzw+ZLahkqqoZtG6lpD2VlN5Yb1d66f7J43GcpNt11S8zejBGNkiRZVbOFvXRq7+oCz1aoWntxTOZYbNnGvJj1VWNEI88fCqvTHESZDq5M+ad3sMddmi/ZnxxYHQNckrSEuon1d9nlA5eHSVfmpPbIHRsJABBU5kVZWUP77TeXJCtfVgW7+XmclR63NJJJdgW0IfQw1OU3JArEE7oalNky1krlQlW/bKYWqKnqG1Qo+jyFiGGiRYjFS8KU3vNEt62VW7PVPov2bE6z5A6inIS2Jlu2/4yMMsHfCaivw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PKlWNEBohicpJnZRBbQCQJyrQCPPU7yr1AjsZKqu88o=;
 b=tZLDLogsRYjipP2r8lW3J0zWaxkMl2n8pmfjtY+YgXlo5f5WmeTEv7qEAhwZcfWIm0Ve/zC1gTjMI2HDcf+k78froPAFGyNqEOnienot2DIIK9pdb+I4d6KutJmKn2n2Iupj1se6VXdcndKpFuGYRMnkGn1QerFwrV9pS4AFPXmWn+BS/Br/qq/wJvOV7y92seDm/LrpAoGDMgDx95fiR5FS3a18DUidAkC40wFiEJKQOvNazE4A4/jzLepElCFPoSdD0oZpTRnanS4i1wmN2aOO/OC97CVdcou6cgE/nnxLDtrKjfBufANpUh8JYvOlfBOWB17l3B3iyIxr7EciYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ2PR11MB8568.namprd11.prod.outlook.com (2603:10b6:a03:56c::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.28; Fri, 27 Sep
 2024 21:30:29 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.8005.024; Fri, 27 Sep 2024
 21:30:29 +0000
Date: Fri, 27 Sep 2024 21:30:26 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Nirmoy Das <nirmoy.das@intel.com>
Subject: Re: [PATCH] drm/xe/guc_submit: improve schedule disable error logging
Message-ID: <Zvcj8u0XkMcHT64q@DUT025-TGLU.fm.intel.com>
References: <20240927133535.548793-2-matthew.auld@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240927133535.548793-2-matthew.auld@intel.com>
X-ClientProxiedBy: SJ0PR13CA0144.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::29) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ2PR11MB8568:EE_
X-MS-Office365-Filtering-Correlation-Id: 52921ad0-4671-4ec5-849a-08dcdf3b9be6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?xYUFRu/VoghXxy0gYtzbWUJH+iPYEPIoYD25unMUYcx59bnkFuhImG4EnS+N?=
 =?us-ascii?Q?AjTPywRXMoAZ/hSC+a1WTSCBthQsvN8LDUgz376kPk+y1zYkENeBswU5V9YC?=
 =?us-ascii?Q?L2Lsqgx0rNMxetY35HjstdBA1utlZuyxuMeE1ZXOXmD2gDHJTYSI0/Sm3fnQ?=
 =?us-ascii?Q?Kwq83uRsVy9WfuJpegm7gf9xm0Rvqzqde+y1haCDLBRkrmSkKo0/V9290HMT?=
 =?us-ascii?Q?cLT348sqOF2LWiu67gDV/RzEMJc/Fu5hDHfPduZs2Jgn8Jm8aO+pacjDNy33?=
 =?us-ascii?Q?AP0JjExwy91j6DZFMvYNvpOWNVogLdEYPR+LMDYUaE5o630qm/yHDwGHRYkD?=
 =?us-ascii?Q?nTHMdx2fp/oWFUDr7v/VrRaav/9i1l7kHCUt2md5sG/4AfNhH/r5QrKV9jpP?=
 =?us-ascii?Q?Ts3es4v69CCkgPzQv3Mk6D1VTUENU07n+r5u7NryNcr8foOH+3UE1IyFit6K?=
 =?us-ascii?Q?wARPgvmqlbVSAY9gELjNIb+Wgl6pnen3oadci7V2X5ItBXe+8m4vbVNm2kyp?=
 =?us-ascii?Q?c+z/+0FQ0g33FrfwAutfosyT6GDLX94vbfnoIGBLhCLCEjbiofMZ1AbyAf99?=
 =?us-ascii?Q?OJT+ZmFxy4FOrr7YeAAa0xMrLbVluRXVFo1b049EQ1UeNydi8zv5/popaZ7y?=
 =?us-ascii?Q?7t/JZqqg8ydYpP/8H59KJYg/lo+jd4BeRWo5FTRrKng0GDuA37L/vBW+lnZg?=
 =?us-ascii?Q?+gYvbuWEqvO5XYS0E/S7qKRd+3xm513NXOxeACaY4JpqMH3op8Jzn7ctDMfb?=
 =?us-ascii?Q?3wHF99OkyhJf1ajVYyLfsK6J4UyoZ8z/QMec03C0sAkOFCO+coF49lFm+owF?=
 =?us-ascii?Q?sGUkx9GQFIJA3faaMbIvPkxkqKY5DFPF7d2Z3mLG9JKi94tQeeYUQJXSaiiD?=
 =?us-ascii?Q?Khy1rlk6zfe7XhuKOYtNSSYJe5K3V/62RCUAO/TQFq8PnVqk6AdUmh0l0dLq?=
 =?us-ascii?Q?0xei/RwEp5qAOIoNDJhLtI3ngNG5cn/XXB5sqHghEQXgJkJ6VbIfENoiiosu?=
 =?us-ascii?Q?dj/5YdBjLLYvgkfsMrkYAc93IBXHIOEDoAj4VyRkeX5J7KSPTyzcnr+6xxoY?=
 =?us-ascii?Q?EE4O69vIoBS1C4+VuhxhTkxGbA47S1/sSEDokNPAe42c5LD0E7WmPkTAUD3Z?=
 =?us-ascii?Q?HEOvkzigm3u5VzEGc85zOYI2B9dvfOG4vXQBo8GxjYt/HFNfiPy3vOO3dIGy?=
 =?us-ascii?Q?EtmE6BhqN555mCOpDpRZQZlu08FaMx0Ei7rZRUA7fIbgH4Fi+ejeEXo6zm8?=
 =?us-ascii?Q?=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5Jq+t8Miq+DQLeyis/vU+B4jdNmPWsqyRNEO/18cixIxFOrus9aC1zlJU00Y?=
 =?us-ascii?Q?3FR/tpBhxTwZO8Ffw6+e6Lzw895jIxVkC+lm6N66fLMapcfhIZI6WHlGArFL?=
 =?us-ascii?Q?FQVy141mBGx0dyEeLfqreS8xulK4vkQCmLtYpHtkAQaiP3d6dpzPLC7/iifr?=
 =?us-ascii?Q?7Kf625sUNMXTURwjU5ftu6k3yxlGngn+Frf89XnPMI9wsSbDE8TN7ANhq9Zm?=
 =?us-ascii?Q?DPQ0DM7foIHbbopCnMoFmTJt6TpbnkGubqP7rpOB3HN97sRY8x23eRKhooGX?=
 =?us-ascii?Q?CV9FGMPVC7pvPy9QxMYPeC6si/tyjOREav+xJBfHxzVnq+kChThpwg895Bbp?=
 =?us-ascii?Q?U6smjwV7taU0L04AOxuM9cme2dsFIarUbMTRlMQndPcQuTi8hxm83x+KR891?=
 =?us-ascii?Q?bkVZvfcZL6chwnLxqsGZ++hN2LnQnOyhgAkh0GxKR1fn20jY9GAnd9/xT0O+?=
 =?us-ascii?Q?P+g9LV4OYWO+9+XsCyou1Jnz5JciNNK/PibQiAOjxvd9vQ8SPVsJnhA126mI?=
 =?us-ascii?Q?89t7moBZmtGOi7kotvMqsXOvVJk9LQp3YjglCbHkiKrh9LwYBSfxk+eRjfgI?=
 =?us-ascii?Q?RWXrFgxBtRId5yQUxR7QgSU3mGK6SenXVxDEYNQlPf0hbBH7geV7Ayc0Zi/z?=
 =?us-ascii?Q?l6/2rnU9BEiBuiu8TfXCmcphGr4BV4SD2YZuLcoeTIPpBHHLS08gYsURjlya?=
 =?us-ascii?Q?Ce1DmiCSa90qd+9fVk+WD8E/ekU0kI/7yJkaAzp6A+t/fsZeZtHL0CLh/rr+?=
 =?us-ascii?Q?xJ5O9HEUNkrdgzwCdMA2rfu0ZYpLzY31E20OW8PhzqPLyw4shDQltAyVFm9U?=
 =?us-ascii?Q?PdD8+YBvI4OAiL/KnkGmYaMwQ++lhcu659xSFlr8xhHPyxB42oZcLMaNDGPE?=
 =?us-ascii?Q?zEApSbBiufJrcwkQ7rCuhvpQwHCKFtJB+heTlywvyWZMlQAI/G9Ub4c6J1ln?=
 =?us-ascii?Q?dPKtJ/t1iaiiSwiH4gjbCsqx8KC4pKxVrrVXVfb1I2WbgwpwBCwoXLvVlinD?=
 =?us-ascii?Q?n2EWDzLnuS013Bw4cjDdrWTzmsE7cdNbyr8REzPFXqDEVREiu8VBm4Hcf9sZ?=
 =?us-ascii?Q?fxTFBQiEGzj553Af52vbWUyajftq3HveRWZHP7FTBf4rD2cH9GtSja2rrSnl?=
 =?us-ascii?Q?kxZ7T6n+O5S2RT9Nrgryfo67M7HSdavt7cpohq2gcLUgmY5LZF6HW7vd48/n?=
 =?us-ascii?Q?aVYwOOSL0Lb1Ucg1hnWARJLX7Mutux7rmdFxUbUfM59KatH5J/s5kunYQ5cw?=
 =?us-ascii?Q?ZtDhJhkfy6azb2iRE41TuUfv7VcbRQRLRuX33MzQt2gjGB20NlOodgyU/Lfo?=
 =?us-ascii?Q?nTY8kmXVw/9rQqUPdO9A4bDMXlgekhc/wt6OnYqHlOkP/1/ysCezEkEqUe8S?=
 =?us-ascii?Q?mRiTB5CmVwC1jVthhZRpSm7DTyUQ6PG35yYv6Ygi4zALX4TGTAkpdQIMV+20?=
 =?us-ascii?Q?lqRkDshqUoBzY9LyDgGTG1A45xPg4uDpVCCBsoPNOv4UGHB3OpKFjyXQaiho?=
 =?us-ascii?Q?wHIS11XG/YW+5bKu0wsPxXJJGq65Nhw5ahAZiAoGWtLCk146YJZV39EEaVNT?=
 =?us-ascii?Q?nYfSFQoH29v9GmN/gJXNNacxBdmFWoPD/nLAkly6unQgw5UJzU+w3qxDeOqE?=
 =?us-ascii?Q?kg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 52921ad0-4671-4ec5-849a-08dcdf3b9be6
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2024 21:30:29.2336 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Md+exhnsiLlN7FFbVXTK25raocQTUpPljKgomkEYnWc2a5b1diqtRS83GxERAFSGQ7XABwIUJXI01+vACLZq5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8568
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

On Fri, Sep 27, 2024 at 02:35:36PM +0100, Matthew Auld wrote:
> A few things here. Make the two prints consistent (and distinct), print
> the guc_id, and finally dump the CT queues. It should be possible to
> spot the guc_id in the CT queue dump, and for example see that host side
> has yet to process the response for the schedule disable, or see that
> GuC is yet to send it, to help narrow things down if we trigger the
> timeout.
> 
> References: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1638
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>

Good change, looks helpful.

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Cc: Nirmoy Das <nirmoy.das@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_submit.c | 17 ++++++++++++++---
>  1 file changed, 14 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 80062e1d3f66..52ed7c0043f9 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -977,7 +977,12 @@ static void xe_guc_exec_queue_lr_cleanup(struct work_struct *w)
>  					 !exec_queue_pending_disable(q) ||
>  					 guc_read_stopped(guc), HZ * 5);
>  		if (!ret) {
> -			drm_warn(&xe->drm, "Schedule disable failed to respond");
> +			struct xe_gt *gt = guc_to_gt(guc);
> +			struct drm_printer p = xe_gt_err_printer(gt);
> +
> +			xe_gt_warn(gt, "%s schedule disable failed to respond guc_id=%d",
> +				   __func__, ge->id);
> +			xe_guc_ct_print(&guc->ct, &p, false);
>  			xe_sched_submission_start(sched);
>  			xe_gt_reset_async(q->gt);
>  			return;
> @@ -1177,8 +1182,14 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>  					 guc_read_stopped(guc), HZ * 5);
>  		if (!ret || guc_read_stopped(guc)) {
>  trigger_reset:
> -			if (!ret)
> -				xe_gt_warn(guc_to_gt(guc), "Schedule disable failed to respond");
> +			if (!ret) {
> +				struct xe_gt *gt = guc_to_gt(guc);
> +				struct drm_printer p = xe_gt_err_printer(gt);
> +
> +				xe_gt_warn(gt, "%s schedule disable failed to respond guc_id=%d",
> +					   __func__, q->guc->id);
> +				xe_guc_ct_print(&guc->ct, &p, true);
> +			}
>  			set_exec_queue_extra_ref(q);
>  			xe_exec_queue_get(q);	/* GT reset owns this */
>  			set_exec_queue_banned(q);
> -- 
> 2.46.1
> 
