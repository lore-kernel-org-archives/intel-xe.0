Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 076C7C25B78
	for <intel-xe@archiver.kernel.org>; Tue, 28 May 2024 15:44:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB2F510E128;
	Tue, 28 May 2024 15:44:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jK8ZhGYC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C29710E128
 for <intel-xe@lists.freedesktop.org>; Tue, 28 May 2024 15:43:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716911037; x=1748447037;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=FXJ6C5IDgNSqn/M93Owdy/PXqzijtPWdzcwBIYM6/OU=;
 b=jK8ZhGYCp+OdVv23Qias60kxg54NCqHuo4ubLx6UPwikkkklwpqlmpXk
 0Yw2sJExiYhrOwVQ9HQLR+3WxnZYBi7PH7moo8t36zN5va4ZuRCsqcwA4
 dXKpH9pPqdvYLo8XBz4CTBAtXYP9JJN7gQChPB2gbcjWpNlNS8o3lQVvc
 7AijLO19S2UZYpZwA6vS3cHsvH0GDOml3OMf0eZWZQGIJ92VPJMlaw2f8
 aRGS7ave1tfqtSkfljpncMZpJA0rrPyMaAUuMIPr6HGwcgi2ZNJthZGKm
 B8eUvUre9wzPUSMdLR6lCyCBmrLpfr1ZgMWMWZIqXX/3WNxYD/9iijoG7 A==;
X-CSE-ConnectionGUID: qRX6bUYhRVmL1IMnNU/0AQ==
X-CSE-MsgGUID: WK00xNlqQgycCHiflj4Q8g==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="17098296"
X-IronPort-AV: E=Sophos;i="6.08,195,1712646000"; d="scan'208";a="17098296"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2024 08:43:56 -0700
X-CSE-ConnectionGUID: pWrQ14sFScad5xeutX4q/g==
X-CSE-MsgGUID: NaTzduFmRXu1X2OEF0BcKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,195,1712646000"; d="scan'208";a="35188168"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 May 2024 08:43:56 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 28 May 2024 08:43:55 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 28 May 2024 08:43:55 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 28 May 2024 08:43:55 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.175)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 28 May 2024 08:43:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O9110nEs2YAJpuOFPJp8ktTfV6Ndh3iY3Mw7SI8iLyJ9Ga2IqinGgKKu8UAO3RTtK78P6QWcce3YWenkSYzIxEQrpgy/buAMbb98q2rgNtW+1fyznu1RV/aCOprrHhHtjEGrYPIv9gJxpvUcPHqJFP3p4sNtEfnFJ02NGJzs2/m57lGYA1L5VJ25c3Mj9jKdQTQSaQLh0fHp0Pqv+fLqquEy40PH2xJPaSFPXPIW4dWD+qxeVq2gDLtPn49mQX2xkg95C14u2ey1LpOkNPeIOYNItdPtSi3g3fjUhMDwgKg+Y3Jwoc21xJLzDeyxqkXbKJKImemvZDOHXvUpfgz6DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pQrDqD4be8jWMs3aAz2rNWDqi00O3frTrJOl9bAMxFs=;
 b=XjSc7wqNAXhGpBysbiRfU7BawMKQc8kvj9/xfvO/M4ATnu0HlojniBUnCu50eaq1Hq6UxEpkIGyd7bSk6y0hc2U/TxwXnRKlGYIrkjIFR6/c7+uT34ibP1TZUkeBxTa9Jgvr2DBSDkwsFVwdt+/iKmQCBVi0UsfCs6yCbnvS1ex3CuW7Sr3sbbLaUBeOWRRev0+oqAKSvvXngrETBQRHvX7QB5r+9CW0MLFe+QyxEk9NtgVaSrZiInxs1ag4yLfFQ+VTbcYMczQt1SYK05xa+LW9N4maUYLJ9MHGuK9AlQ+QUDBZQ3mVM9l7e0YuqIREqWxUqFjd5N1cQkYXB2U28w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH0PR11MB7496.namprd11.prod.outlook.com (2603:10b6:510:280::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.30; Tue, 28 May
 2024 15:43:52 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.7611.030; Tue, 28 May 2024
 15:43:52 +0000
Date: Tue, 28 May 2024 10:43:48 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH 2/2] drm/xe: Do not access xe file when updating exec
 queue run_ticks
Message-ID: <3cv36b7mkgqk2us7hp7q4bwwexet7s74pp2cosqpdrfjfrvzhq@4rrighm6eyiy>
References: <20240524234744.1352543-1-umesh.nerlige.ramappa@intel.com>
 <20240524234744.1352543-2-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240524234744.1352543-2-umesh.nerlige.ramappa@intel.com>
X-ClientProxiedBy: MW4PR03CA0292.namprd03.prod.outlook.com
 (2603:10b6:303:b5::27) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH0PR11MB7496:EE_
X-MS-Office365-Filtering-Correlation-Id: de6f4a42-d305-4158-3367-08dc7f2cf982
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?BfgOv5tXpa6BM5+/dK6cwXPUSGAC8ITfVpZpvXCGI8mKkIYNKt43QDWCyzyY?=
 =?us-ascii?Q?763SrUfElToJR29PS93ekW/2vblTyFt2B9HLxFgcKdIBAFyKKDvarTLKwgYw?=
 =?us-ascii?Q?vhOO/4tByAgvs5fTLwqg4qJOdigDicVkFa9w1foarnPP3B7llSeISi6+Ufr5?=
 =?us-ascii?Q?dk4DUxyRgAGQ2jYvAGEh5eA7SkNC5NXB73PbG0AfSEoGQlL7Zq9NyTdvOIg9?=
 =?us-ascii?Q?RfD2AFdOT2vgxJFUvGZlUkbDit8Aej2XSPLq19M83wlb/dWkKp9YcFfqAUDZ?=
 =?us-ascii?Q?N/WC9uVQSA53Ru/jUanwC83bZNosu6X0aDsRhzm0E6iEb/nU4kXyX7W/Tpg8?=
 =?us-ascii?Q?sXpJn4cCSUZIqYXfnvXimBxbm4WovnrFjVeRbs1dT+rOPeRt+QAohvbCzI3C?=
 =?us-ascii?Q?h0k0woo97gQSR/G5LzN3KT9EFgm3Sr6xJAIDmPr4kEgy84eZ+d/jiwgtKuQm?=
 =?us-ascii?Q?668QyfHQ5yItL1qv6KeeEOxw+6cB8thEBVBIqh5HWV/zvASLj1hH2+oV98fE?=
 =?us-ascii?Q?ZZeBl4j8Nyouqd64xdxA5NJyC3X5R/KbOLJKzw8CkNuf3O2gPAhfeiWe1tYw?=
 =?us-ascii?Q?UW+N/+iiTmDdsIODsGjqa2oWbcHmOjLaebASQ4ADN7/Qs7FZr1Ba0TA+Aag1?=
 =?us-ascii?Q?PGsjGxFfIwMzke0xzYLxwGkl5LwmzP10SBt+2sbItNe98Mnme1ecgW3+lImZ?=
 =?us-ascii?Q?BuyRaiGU30oEwjj23i+I7eRTiBlsNEjlc86MjFce6/nEpcLYbj3pxUpyeThb?=
 =?us-ascii?Q?UZhCvkZdRaNkbV8r2924V+z+7bRfeDqE2ya/xqiVglwB6fb4hXNPHeGRyxVk?=
 =?us-ascii?Q?C+EmqH8fewxzOxB1Nh5vksgUwSgUxziaBu+8gTAdW8G6aewt30GDq3BG5JB4?=
 =?us-ascii?Q?ss88IgAVl7U+FyS5pynJrhQxzvWtw9FoLcBySP+eTXJYN7sTtwWkmOr+Gj3/?=
 =?us-ascii?Q?xZrHXRsadScPYYqo6rxlYIf+PBWixZgk6AYdc3a77k4seYQFsddTTwosGTVy?=
 =?us-ascii?Q?MEjIOXZkn7m+E7ZGKMctkwxyyO60zPltyjWfoTpp+dwe92EHRQRszTUdhDfy?=
 =?us-ascii?Q?lUlMLobVQrSe8lxpjCosOwefyTNDfr5Af5/afIM9FSsH00mgvxbuZRxIAu58?=
 =?us-ascii?Q?2Xus+N8BDUibcmTmAR/zhh4bPzbi5SR6Gv8P8l+QfxSUn7XrV1qSWfBpJdxP?=
 =?us-ascii?Q?+nY10tqUk3gjS63240UG7cIAxHI+oKUjPRSTr7Q14I5VBrP80gHGd3qE/qU?=
 =?us-ascii?Q?=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?v+rlUSHooPPL9RfRsau10hh/lB00NHza2bhek9a+E3xompLQ5iqF06N5OqnR?=
 =?us-ascii?Q?7AHX6n/tioE6Wk6mb7X+r6VRFCax42WG+M+wNoUTR9Sl521lcAuaox/0hQLu?=
 =?us-ascii?Q?BxZeZ+PJ3euEVAvxu1ET4FDlvCGNtpJo6LQdPD2Gh6yCrQ7ZUeZZswvA56V2?=
 =?us-ascii?Q?N+5YLMBUCG1R8nk2bDLXjZYPYSaIFl8TsKVi6IFZ8Y6A7xelPnKik2C8I9uQ?=
 =?us-ascii?Q?csqfW2cWwl0zYduE5gkbrgyKNez2gvv2VOPjj1wg9kljWKLpMewy1td1L0cR?=
 =?us-ascii?Q?tNbThYvSKXUmbNw98WdurTuQk4f2JrBlM0jkHrs4koxw9dtKmyf76g/SLbZs?=
 =?us-ascii?Q?4yKQJTNR+JpoOB9w/Efsw5cZmAXA8jyNMv9ohlbCe695edfxGRAynCuTZxaC?=
 =?us-ascii?Q?p+URUzGqvhZGlEquDRZr9nsRsKMLgr9ukfePr0Rl2Ydl+gLR8zKkNTkcD/kU?=
 =?us-ascii?Q?YnZbknbeOUT3RwYvfTqHwbJ8WdY/M1aAagOJsxU8LgbtwMfkvup4MbXEkTtv?=
 =?us-ascii?Q?pD1wErN1neoAGAVv34gmVIL/+xE9DS31lz9xFhb3IGl+Bb7QaRI+47OnrmnB?=
 =?us-ascii?Q?0uP8nvATKevbQTdQ07jGlTl1vKAIKr/+L2EN2Q/CUvvMFsoatExBBmwQvMDb?=
 =?us-ascii?Q?b/IgDaQ8/BR9NYwPOtq5jcvaQ0N4Zs8aDp+cQANqKoydAm3wyjBEx2Vu/u7G?=
 =?us-ascii?Q?wgK7DgKmE9pusx4aZe3c7pqMdgZzBfvP8pLVLemooyfPaQ0Uw/Tg4tYPezU8?=
 =?us-ascii?Q?N46m9gp6SYuTfsnWitaio7E1LmKxbx8hDtWR9K5Rtv+brXVxvQD7OKz/DjkL?=
 =?us-ascii?Q?DOpm69Sz7JoLa2SY7Ujs68p/YJ7pSi+gVhbL6Lske48BN+WI8Mv+xzVrKlpS?=
 =?us-ascii?Q?WiZBmz6rIXEu7FQH4J54M1D3NB90V4c2DmHPJUcloCXd/novSduZkYV3zang?=
 =?us-ascii?Q?cyEYPVT4Aoz/dGRsFy+CeVSi5JmTaqWpYhXc6MdhfYeDCj95c3XX4cHRwQSH?=
 =?us-ascii?Q?sQK+UZ46ZrgyZHYvQNz1gGX0lmh3CSgzQ7tQhgG/WKnChu50E+WLT/qe/Ukt?=
 =?us-ascii?Q?gn7ulsuVBxKv2/DydlRPFImsObskrQKcQfhKKbu0WpBsgnlF69iwQsy09GSR?=
 =?us-ascii?Q?rKtaCIhfKZ3wniIESRT2823u/Hvsw9JpAE/w3VHmSgriU1Lo4OUP1wSUJGBY?=
 =?us-ascii?Q?ZlkN5qyYGudnnDe7mntgNe+rH7pV6Soi5RJnRsr/+IuyCsyswOzmG1DcrQDw?=
 =?us-ascii?Q?kV4QEEeX/lDK/igX5Z0pkqIvLBM+ahyZYpbqROxYpXIJwOkStr3To5Eyzsmp?=
 =?us-ascii?Q?fLbDmLLqTlSPSsoKwY2U/+HXObOyP6pNXuQnNE+4wBNPHskWMRe7UugOXTi/?=
 =?us-ascii?Q?N/kB4WctoZkL9km0S8YvybwsGkRzBLHW7B0Fpy++gSIXTfHvCQmpKrhDbpQT?=
 =?us-ascii?Q?nIVqsjVC3Ugs7VAoSlZyrk9rACu8biJ/fx4LHWIHBNHfQ1eOVzLf7ajElWIM?=
 =?us-ascii?Q?MGPKupAYkoWZtRdnkkvrVpmOzkowtjTGe3mOfDtnXql5WAaz60Dl6XobKWsJ?=
 =?us-ascii?Q?MDFa0+6FGn8lE7zlupsViUzD7cho5jNU4Wd6a03qB6H/12M+JPuHsamSmu59?=
 =?us-ascii?Q?Ew=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: de6f4a42-d305-4158-3367-08dc7f2cf982
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2024 15:43:52.3457 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wHUMYoXN6cD5DfEInMa72y5a1ZiUuzsfwEiTuaxDtHKBEIJymFjO9l7qas3MK3337+BIaUki9f+uuWDCrozsj2TSJTsO3uLqXlSuRKYy7Kk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7496
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

On Fri, May 24, 2024 at 04:47:44PM GMT, Umesh Nerlige Ramappa wrote:
>The current code is running into a use after free case where xe file is
>closed before the exec queue run_ticks can be updated. This is occurring
>in the xe_file_close path. To fix that, do not access xe file when
>updating the exec queue run_ticks. Instead store the exec queue run_ticks
>locally in the exec queue object and accumulate it when the user dumps
>the drm client stats. We know that the xe file is valid when user is
>dumping the run_ticks for the drm client, so this effectively
>removes the dependency on xe file object in
>xe_exec_queue_update_run_ticks().
>
>v2:
>- Fix the accumulation of q->run_ticks delta into xe file run_ticks
>- s/runtime/run_ticks/ (Rodrigo)
>
>Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1908
>Fixes: 6109f24f87d7 ("drm/xe: Add helper to accumulate exec queue runtime")
>Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>---
> drivers/gpu/drm/xe/xe_drm_client.c       | 5 ++++-
> drivers/gpu/drm/xe/xe_exec_queue.c       | 5 +----
> drivers/gpu/drm/xe/xe_exec_queue_types.h | 4 ++++
> 3 files changed, 9 insertions(+), 5 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_drm_client.c b/drivers/gpu/drm/xe/xe_drm_client.c
>index 1dcae0e6d66d..4a19b771e3a0 100644
>--- a/drivers/gpu/drm/xe/xe_drm_client.c
>+++ b/drivers/gpu/drm/xe/xe_drm_client.c
>@@ -251,8 +251,11 @@ static void show_run_ticks(struct drm_printer *p, struct drm_file *file)
>
> 	/* Accumulate all the exec queues from this client */
> 	mutex_lock(&xef->exec_queue.lock);
>-	xa_for_each(&xef->exec_queue.xa, i, q)
>+	xa_for_each(&xef->exec_queue.xa, i, q) {
> 		xe_exec_queue_update_run_ticks(q);
>+		xef->run_ticks[q->class] += q->run_ticks - q->old_run_ticks;
>+		q->old_run_ticks = q->run_ticks;

these 2 lines are kind of a layer violation... we shouldn't be setting
something in xe_exec_queue from xe_drm_client. Since we can't return the
delta from xe_exec_queue_update_run_ticks() since it's called from
places other than the query by userspace, we should probably move
these 2 lines code to a function like....
xe_exec_queue_get_delta_run_ticks() or s/get/flush/ or something else.

other than that, lgtm. Thanks for the fix.


Lucas De Marchi
