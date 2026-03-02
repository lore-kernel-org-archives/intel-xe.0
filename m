Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63F77EB3632
	for <intel-xe@archiver.kernel.org>; Mon,  2 Mar 2026 21:02:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28DB110E5C5;
	Mon,  2 Mar 2026 21:02:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IVNiq4eD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2F9A10E5C5
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Mar 2026 21:02:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772485356; x=1804021356;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=gdTT0sqq5BDARxoa2sxyi4wwDbTKE4xELVI7W2SkolI=;
 b=IVNiq4eDzzWWIxk+QwPPBEpLJWwzXOA/ohtsD6PP4ZITqxkHDrvaiCiT
 EC7oKzcQsp1OwcG/bkFd2dYfjN/1abNCHP1M8SASssavJ8Z/l+WyT31ea
 D+InymC0O+aoytQjVoD/dTJqHxK16AYa72EYSoVejHVggWhZ787KY9kHu
 zk1/d5HPmlqqXdATER5dW1SKaxDyhl3wRX5/PdWXNBz6NXwHTnDPenwtn
 x2ApdaDmMuSlxLuEd9X08qTE3Cr1Jku87iU25b/nBdTv57adrm1bqHlJk
 VafPTd7ZCbTUCeNfLjBIRrEzK8l5OWPYKXzE1bFqujlIbpo8yf6dCAlJi g==;
X-CSE-ConnectionGUID: B9ACAlUiT5S9HWFuEIkxjw==
X-CSE-MsgGUID: s/w5fyd1S8OUar6WzAt5rg==
X-IronPort-AV: E=McAfee;i="6800,10657,11717"; a="73620898"
X-IronPort-AV: E=Sophos;i="6.21,320,1763452800"; d="scan'208";a="73620898"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2026 13:02:36 -0800
X-CSE-ConnectionGUID: xqI2F9S8SM6LiaA3S0dlmQ==
X-CSE-MsgGUID: 3rfI7HyRSdysY++1LMgc7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,320,1763452800"; d="scan'208";a="215736453"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2026 13:02:35 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 2 Mar 2026 13:02:35 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 2 Mar 2026 13:02:35 -0800
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.15) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 2 Mar 2026 13:02:34 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BmdEsqF/4iBrOhTwIgjIOfLxrOP05LQjfYWKhwO3UNAWjpHTx2+0cyB9JzY1qXtKjLStQTbQGa54SCD0/GNFcXVP6gEOORaQSlaYylaWv4MA9rVhLN83x5NU1uRGlQcLh5tMob7iEZDsA2uRpapjPqk1Jh6ugKY0wrX/IdGi9INGBQUcHEA6Z8HLiMcTYxf7em/upnjeVCFuGWd358LSO0CvZOhNa7lIZZUdatImWV+9y59mGyjjtxwcxiZWCbH29FVscE7y9+oOLvTCrBc2uu6bwu7IN+8p0bNxQ2zaRSQMCFjU2UJSvX5b3TsA/i/c0Q8s8NRHNLShVoDICMYShw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tBr1ML6ZDhcowLMhQlCYEEquO2Xv4BAYaOAZ2YFTeA4=;
 b=niuiKZtC0g4XbWivsGxBa3otxYQhdYcF+fWPGxK7g4UGGEeviatkbjulKgDrhsIYtnOu7MYPIEy1awUz6jjpf1diYokw2glrxONoT9nkzabXASvts7pCEKxeClBsfHLlbSiNSYIboZ48XaAhZn/GBdxlcYKcjBEtnClLA6X+ee4VoQ+wF+9n9hEErniFz7DxLhnxGXQJhX0IR0aj0MbKSlFrX5Rufz2FhXuK6/OB0Dr/uA/LBua4NTJZrbjsmQIHdqIY1riBXPnLZRAym4gbay9ozBiH5Yuw+QxBz3vLFJzGeegLwewjclS6S2036lyru2mr20wgdME14I+In/smxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM3PPFAB6A6CF3C.namprd11.prod.outlook.com (2603:10b6:f:fc00::f44)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.20; Mon, 2 Mar
 2026 21:02:33 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%4]) with mapi id 15.20.9654.020; Mon, 2 Mar 2026
 21:02:33 +0000
Date: Mon, 2 Mar 2026 13:02:30 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: "Summers, Stuart" <stuart.summers@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>, "Yadav, Arvind"
 <arvind.yadav@intel.com>, "thomas.hellstrom@linux.intel.com"
 <thomas.hellstrom@linux.intel.com>, "Dugast, Francois"
 <francois.dugast@intel.com>
Subject: Re: [PATCH v3 03/25] drm/xe: Decouple exec queue idle check from LRC
Message-ID: <aaX65nBqdWvXGmZF@lstrano-desk.jf.intel.com>
References: <20260228013501.106680-1-matthew.brost@intel.com>
 <20260228013501.106680-4-matthew.brost@intel.com>
 <a88781b47e972b47ee6e46a3347f6293d36d9e39.camel@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a88781b47e972b47ee6e46a3347f6293d36d9e39.camel@intel.com>
X-ClientProxiedBy: MW4PR03CA0314.namprd03.prod.outlook.com
 (2603:10b6:303:dd::19) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM3PPFAB6A6CF3C:EE_
X-MS-Office365-Filtering-Correlation-Id: 86442196-96ff-44a0-a7f9-08de789f05ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: ke9CjAJmS4Tulxqr0eAM4XxA24oAVF/+7WI6kUNqVNkC6yUMUuLEH0zUOR1LxuyouLN7W0VPGYy1MX6k1Yy9grrdSz8ykcMFZ0wdFzv5nwpOs8mUWGD5Nd1vHML0I6eawEtznMyGwUeCtZPQah4sX3/w1MJiH4KFQFd8fHw0QfAHywBM8RgtfC1AL9XOTo6ILivZFpGbcRgfprcFUqUEv31NA8xQRC8xWT1yPT4WYk8inU8m4E8RWHDuJnqavSX0ZZhd580/BSS1+s9iyFQF0+7pIUU7a5X3ucYJHjp+/rcLJmtJxP2O3DT3yMuxlfDzCv8GRrVd1I36z8+TgpLjThCoTwcq0Itp/Xzu4IzmYLf31Rg4bPYlsKW6Gis8LS+a4tGVsFiiPHgLgEgWcL1/FV8VRw+HIYHt+Ej6eLR6kWt501FS6isDxdTqEXyPRZqapQkLCcUkBiucHIfgqiBZLBSZjqYXH/W23DjpMZ6hk9UWmDd/nc+LZdxRsFb5smgYHAh/n7s2hfJL7nbPV0VOxFm3+1+7H7emRUahlS7J8wx+TG2Gkt/w+mRQjoHf93/ZQH4UG2cJX4sWo9b98p+eAU+JzuMS23CuJzBJvlEY9t4hqgyf/dKrGTE9Z3rE/ni5C1tKZf89AUFRrr2e552fUeG31eRkvlSXwJAtCiHmVVHuR2+yDFUoVD6IONYlqo6zO1DNFTDa457BAqCcPPkB6m3uDB3Bwr3qihzua9AHAcQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZHhveGhqN0YxdUhpR2wxOHhxcVllSi9CdnFxc0JyMFFiUS9NVVJ6dDMvdkFz?=
 =?utf-8?B?K2lZMU9nRG9zN2lXOGhGTkUzMW9GRHE4MitNall5RTlWZ2FIcXNud2wvSXZF?=
 =?utf-8?B?M3FEa2x0bm5oZ2NITTlzcnZxUjNRSGhBVWx6aFZXbFFkdGp6eEd4SXh6RmVY?=
 =?utf-8?B?bkh3d2xpYUZPRHFxclBJYXFZbk1jSjI3U3RjZndBaTdwZVUvYlZNcU9WdVEr?=
 =?utf-8?B?YndjSWppKzVPNm5TeU4vbDVWZ2RBMGNRbGVaK0RUVE9vYS9xU3cwcnZDSkJV?=
 =?utf-8?B?REVBTWl0cXZSUTBUYzVhNEtoTFp1bWpBNklpeHQ3R1cwanlvUmRSekVweWFO?=
 =?utf-8?B?MmRtV3JDa2dFbzlyRW5KWm9UaHFpVDhZUHM2WXRTK1lpb3pvMHpwN1JpOXIz?=
 =?utf-8?B?bzN4Ni81YmpRM1RhQlVYYW0xcXhlTitJZlhnSHRwcm9qWkxXa2NNZ0hoOGNB?=
 =?utf-8?B?Z1JEdHE2WTdSbEFwYUFqWDk0dVJpQVY5MW9sN2lENDJnUzEvREVzUHFyZjFp?=
 =?utf-8?B?U003SjdiRFh2SnhvbXBJMEs0NWUrV1VCQ0ZjeFVrS3JmOVpObkRmUThLOFhO?=
 =?utf-8?B?bm44OU1BY3dJNWVZOU9hTVBCclEvU1NXaXJkWHZnYW1CdHQ2RXIrMkllM0RM?=
 =?utf-8?B?ODJyWmlZR2ZkZS9wRUJ5dHpQcnJUeXhPbzZRSWRORTdmb0o5ZHpUQjg1WWFR?=
 =?utf-8?B?TnUyeUJBVzUwWmUzWmo5cEZZYUkrOWc0ci9LaGp1WUkrSGl3aGE2RlMyeFIr?=
 =?utf-8?B?OTRHV2V5N0JUbjhLeG9qR1FIbUhab1FkS20zL1JOb0d1ZU1TSGV4aWRjcUpw?=
 =?utf-8?B?dDFRMXk3Q0dDQW4reTFoSmxCZ0wwOWFVUjAyS1hsZWpSUGZwU09EOGNpb0dw?=
 =?utf-8?B?SHRtTGtlVFFJbWl6QU1Cb1k2N29RQW1MTUU1TmIrNXorUnVLbHR0bjV6Zyth?=
 =?utf-8?B?NEZ0cUtMeTlzV2h2UVpYbzdENWQ5bzh5QlQ4SXUyMjJpN0FtWmw4bm1FUnN0?=
 =?utf-8?B?bzFxUFhQNm9jVU9jazZnUm0xQ3lGejFMVm5yc3hQWG9tYU9PeThjdVJ6cVdn?=
 =?utf-8?B?OGxFdUtiejFhaWdVanRqSDB0RDdJYm5qN2RpUEt5MjBUZHBmNkRYZzJIM1NB?=
 =?utf-8?B?d05hQUU2VFNCbzRNWDBKU3M1eHY1WEl4UmlURGNtT0psUk1kczRZVk9FcHVz?=
 =?utf-8?B?OUY4UnVTNTFqN0NtdDVnWCtlbnpwUGZlbXRWRjFHUXN3TEVaVUxoUlFwSVFs?=
 =?utf-8?B?THhFV2hxOEdtZVJyS0ZqL0I2K2kxOXd1b3hBZDd1MnNsUnc0TS83YmxBamQ3?=
 =?utf-8?B?V2tPL29YbU5FZ1FWWG1TSzZGSjlqUUhqY1daaTNVcXJpSUsyN0x2MWdkU1ov?=
 =?utf-8?B?cjFrbGljSGQxQ0ZXY2x0dXA5YmoyUnZwQ1EwRUNaODRGNjRRVkVyM1IzRWln?=
 =?utf-8?B?Z2pXTWdwd3VUNDlQVmV3VzFWOFhCQmt5eEVGM09aVEVvdzlSb05GYWl1SGVO?=
 =?utf-8?B?cnNrSEtBakptMERlL0JQa01UMnRjZU9hbEVpOTlrTkF3RDU0cGdKM0xxU2U3?=
 =?utf-8?B?OXNpUTlmY2UrNGpQYlhNb1Z3YWRmRWRtWXVKTUgrZE1xcFRtOXdMRE5kbm5m?=
 =?utf-8?B?eUhnek5tWHVIY00yKzJCUi9rbnU1TjR5dkpVSjF3L1RPMzA5eXJKeGlmNktH?=
 =?utf-8?B?WlQ5WTROZUxEVVpYNXBVUURwdnRtaEFSTmw2dFByd3dSVG5yL25nSitPVDdO?=
 =?utf-8?B?R2NXWml3ZVkrb2Z1allVZUtnNVZ6UEx1aVRFZ2lqejJxZURiSjNpbU5sUkVx?=
 =?utf-8?B?eDRGK1ZlWW1UcXAyQUhwV2xVQXNCc2RxVldpYW8vekpENk8xbUd2aTNMNzlJ?=
 =?utf-8?B?MDN0clIyUytOY2R6YldUODJSTXU1QWsvMmRlYlB3clVOTXErYzlCN1pIeFdk?=
 =?utf-8?B?MDM1a1BhenZhQjQvZzR2MnQxVVFkNVhWUkNKQkVCSVJ0aHBLZiswWkd1UEZk?=
 =?utf-8?B?QkhFNnNYWHdqRWVydTMzMG4rbldVNm05RGsyYisybDJlcHJLWTBvekdOWFFG?=
 =?utf-8?B?U2dGSzlNSWRSN1RQcS9kdE43TWduY09tbXNDZzBmVEIrcVBxK1dkSUhhcGdk?=
 =?utf-8?B?R1dXd2pWK3hIeE9MTTVuV1J3UVNhbW1OMTRPMzRNMEVLMlNSZ0U5T2hhK3Rl?=
 =?utf-8?B?ZGtjamhGL0sxOEhZM3k4ajJrMVJQL2tiaUJLdTRkRTZDZnVxV2JoYllzS2U5?=
 =?utf-8?B?cUxkRFdXRlZuMnlkVUI1TzNpczArVVRDUXZ1RUxFZk9ZVGlqNmVySWEwcmFo?=
 =?utf-8?B?RSsrb0FGNG5sQU0rbU45ZTRNK3hXUEpmWEpLYllBK3ZvamltWk8xdXR3WDFI?=
 =?utf-8?Q?2Gqw460sjDQUUduo=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 86442196-96ff-44a0-a7f9-08de789f05ec
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 21:02:32.9346 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VlUhTTI1q7o+LOBtznMOW/odpIfgfOeZRg6LphLpeOSXu5oTVgGe8ib4ZdBUxjcXxOjwIz/a7h50WpOTJjKIzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPFAB6A6CF3C
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

On Mon, Mar 02, 2026 at 01:50:11PM -0700, Summers, Stuart wrote:
> On Fri, 2026-02-27 at 17:34 -0800, Matthew Brost wrote:
> > We already maintain a job count for each exec queue, so simplify the
> > idle
> > check to rely on the job count rather than the LRC state. This
> > decouples
> > exec queues from LRC-based backends and avoids unnecessarily coupling
> > idle
> > detection to backend-specific implementation details.
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_exec_queue.c | 15 +--------------
> >  1 file changed, 1 insertion(+), 14 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c
> > b/drivers/gpu/drm/xe/xe_exec_queue.c
> > index 2d0e73a6a6ee..b3f700a9d425 100644
> > --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> > +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> > @@ -1382,20 +1382,7 @@ bool xe_exec_queue_is_lr(struct xe_exec_queue
> > *q)
> >   */
> >  bool xe_exec_queue_is_idle(struct xe_exec_queue *q)
> >  {
> > -       if (xe_exec_queue_is_parallel(q)) {
> > -               int i;
> > -
> > -               for (i = 0; i < q->width; ++i) {
> > -                       if (xe_lrc_seqno(q->lrc[i]) !=
> > -                           q->lrc[i]->fence_ctx.next_seqno - 1)
> > -                               return false;
> > -               }
> > -
> > -               return true;
> > -       }
> > -
> > -       return xe_lrc_seqno(q->lrc[0]) ==
> > -               q->lrc[0]->fence_ctx.next_seqno - 1;
> > +       return !atomic_read(&q->job_cnt);
> 
> Still looking through the series, so might be handled elsewhere, but
> just looking at this patch alone, I'm a little worried this will cause
> unexpected issues in the exec queue cleanup. This function currently
> ensures that the job is idle from the hardware level. The change you

The current check is actually incorrect if, for example, a queue is
reset and the LRC head != tail. However, I believe the only places we
use xe_exec_queue_is_idle are cases where a queue hasn’t been reset, so
it happens to work in practice. It’s also just an advisory check, so
nothing bad happens if it incorrectly reports “not idle".

> make here moves that to a software level check. And this is getting
> decremented and checked before we tear down the exec queue. So
> presumably, GuC and the command streamer could still be doing something
> here and we're falsely telling other parts of the driver that rely on
> the engine to really be idle to trust us here.
> 

See above for part of the explanation, but the other part involves
reference counting and fence signaling. A job can only have its last
reference dropped when its fence is signaled.

A fence can only signal under the following conditions:

- Its seqno is incremented via ring instructions (which corresponds to
  the LRC head == tail if it’s the last job on the queue).
- We time out jobs on the queue and signal their fences in software. We
  only signal fences in software once the queue has been kicked off the
  hardware (i.e., scheduling-disable H2G triggers a G2H response).

> For reference, I'm looking at xe_sched_job_destroy() where we do the
> decrement and then the exec queue put.
> 
> So my question is, how are we guaranteeing that hardware is indeed idle
> after this change? Are we moving the sequence number check somewhere
> else?
> 

I think above explains this.

Matt

> Thanks,
> Stuart
> 
> >  }
> >  
> >  /**
> 
