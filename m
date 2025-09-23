Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A117CAC5B0
	for <intel-xe@archiver.kernel.org>; Tue, 23 Sep 2025 12:49:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4043C10E126;
	Tue, 23 Sep 2025 12:49:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WPUmKN8R";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE0B310E124
 for <intel-xe@lists.freedesktop.org>; Tue, 23 Sep 2025 12:49:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758631768; x=1790167768;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=lAjwuO59O0dLyOnLrqBNvTgSf0yUmqwGyu/Ve3P83Pw=;
 b=WPUmKN8Rlndiv5cFLeigczTunyCI7yy7ZJlL4cg+slRxIcoggINZhGnt
 pELmbTO6NMO6cfm/y+6gG9fWyfqj4CNVLHlZWKDfM1HKnveuFCiwqUxoA
 de+sjn4q6vzohVenG5nfMhftju8VeBlJudEcId/hEyQ+yJllAAiBPbNOU
 ZuW4vOHASxKj5X/XUQrKi8Nmg+epAp2nHhkTa6qGOzlVyt/2xTb3LR18U
 /cVsJ8xOSRB1FICvAj21r7pK4LzP3pk3/jM69+9Zf2pfAJt1Og15u/JaN
 DAGpru/vR8Zqo84uosGfxZV9YVdhK8vzErUBzs/Wx9NgzAbbJ++IJJvtZ g==;
X-CSE-ConnectionGUID: ExTZ59q/SCSsPBo7XKxgpQ==
X-CSE-MsgGUID: Hr5xYIVxSWuilokSpB7Knw==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="61024425"
X-IronPort-AV: E=Sophos;i="6.18,288,1751266800"; d="scan'208";a="61024425"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2025 05:49:27 -0700
X-CSE-ConnectionGUID: Svfl0W9rTCin4DalKJr62A==
X-CSE-MsgGUID: b1X/60tKRRGPyQjSULiT/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,288,1751266800"; d="scan'208";a="181143718"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2025 05:49:27 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 23 Sep 2025 05:49:27 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Tue, 23 Sep 2025 05:49:27 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.0) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 23 Sep 2025 05:49:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m2wE8Og2+iNr5uKyASLY8eArWYvQJMGAQ83p6P1T6XDz3CdeuHPG0EsN2HhX2roe/a9CYZyL85tRtOfZZppgyzue9VqSIpxGmbwkwQ1VjzrJnJciKo3MIRo7xvTVP1VgFrcCFAwOI8yCXbj24GZAf2eLEyLDIjC+VwISVw83J9EF2rtH17HykqFFmLChpb5cDvZvVYv9ppzdKKJa1hAKr/9k92YbIhVcLv5C+iYaOEbA1TFqFsC9b7BxEWAGe4C1TnBwHseME3no4iqKi8JslkvNyEefbN2fAWxjAqhqRTzK1ks21b51HOthBNyWUaZ51I4MuOIGTwrxE314k+YDxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=62Tef5SJAHhNOUcmG7C0/P5uaQUeHE4YndAm4gt2MwA=;
 b=NGUHinF+GM9bnmcBqL+RuRssI21rQjoXF+PUGzt0VAzk5ok1+NPY0L7bIFodW8VUtikCpKq856DjX9bJTaWROEGXMinMTpmBk2GS5lc+PpBcYu4PQcN/i5TGuQEJESmuQNgLXInWEeea50e5vVlmmzdwWZFsWsCrKs+EIXs9gl8nWyRQK6fbg5dgGDqAqtG2slg0OG7U/algc2Rl21MyPdKjOieEGGtbara8UXUzjZJDQloa/7hP2JJl31ewh7vF6unZ5HyS0QuM9WF8c0w5GJKqKnaWl2YCYb+5EgLpRUYcetd0zNfKvS5znvV8om1oZSv2Li940w1Jl+ZPVr0BsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by CH3PR11MB7177.namprd11.prod.outlook.com (2603:10b6:610:153::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.19; Tue, 23 Sep
 2025 12:49:22 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9160.008; Tue, 23 Sep 2025
 12:49:22 +0000
Date: Tue, 23 Sep 2025 08:49:19 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 2/2] drm/xe/debugfs: Improve .show() helper for GT-based
 attributes
Message-ID: <aNKXT6KD8tGNDU6O@intel.com>
References: <20250919160430.573-1-michal.wajdeczko@intel.com>
 <20250919160430.573-3-michal.wajdeczko@intel.com>
 <aM3KqUnWloi38riK@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <aM3KqUnWloi38riK@intel.com>
X-ClientProxiedBy: BYAPR01CA0047.prod.exchangelabs.com (2603:10b6:a03:94::24)
 To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|CH3PR11MB7177:EE_
X-MS-Office365-Filtering-Correlation-Id: 69ff9421-b578-44d5-43d7-08ddfa9f9ea8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Kk9bs9r2aY7OdGRcD7LYdZ3NQCJ4tungVuHp5WHYq+pj9SOzpNNaxySYEqhH?=
 =?us-ascii?Q?lr8xMMRDQhIUhL59Qz/DoEETnM95b5DofReiJcGDiT4digFinbPBxMBcgVRZ?=
 =?us-ascii?Q?Vh0pEl2IUQGBX89VRKzCqOqVuJPSwsrczBYX2uwULtklebSkfQ+hygkfBB2F?=
 =?us-ascii?Q?OmgAXbNatLH6t3VM8e5PNRO3nG6YVe9OzPutPRu963tvOBYZe0LfwIu2tKas?=
 =?us-ascii?Q?KPQwMv8o1zz/8V7J5DBboQ8cYkDoUEpzZN9VPacynIMd9YOj/Asy2rzOhmdq?=
 =?us-ascii?Q?0NdDxnvrwrQwY4Om/erx46lwqveciR+5X+pavkXp9XHNXYuVm/BGMnH42TG/?=
 =?us-ascii?Q?ob8kCQNuHOkIo+sGfWb+6vNA1cS21SqZnhUa9UOUH9I/K6cvoFOx9VibLQ1j?=
 =?us-ascii?Q?aG8MwSKco7LTwKCG/7pTbIgfViYc1kvTvJOhqcw37++EWWvr+CSa7wywPZlU?=
 =?us-ascii?Q?6wlDr8eboBAh2AhvpL8hLUfFQhF7rb9IdFv3fqPCisFOhrlNIrbnbnvfryYZ?=
 =?us-ascii?Q?Cv9EtSaMpNBdph9KrmDUw1NkbvLv4z83tiXOdP8gpMuWqZghGApd9/wCRfUm?=
 =?us-ascii?Q?f1bRmroGEPm0vWxugZwL3pEtjYkNKwnStCLEN5t0VlfREP12bi5NRbD1Inke?=
 =?us-ascii?Q?Xf99nkGdoGJbnsXBQYJH+DlsLq2tc3BSgr0lAgkEn719I+NnvXntvnzzUTXN?=
 =?us-ascii?Q?oLV8u8kOUHEeztp5Qjp6oMJMlpphdAtkMSLCf+VwKunitlrwtUjvvzJzPxAI?=
 =?us-ascii?Q?D7TOK4GRhS6KjZZTffrVUxUKGM9ML4WHqAWF09Fs/AA3PMyfBt7e6AABt3gr?=
 =?us-ascii?Q?uq9JqFlGpjVZUCEkfD0Wt2H8JKryoWiDNHOEemVngK6buMn5v6XO64VsfmcW?=
 =?us-ascii?Q?bdHE+twyiNBOlsUqxAGGR1D4vIejqHJi7y9rvrfjU4Q+rCzpFZqjMCfspvi0?=
 =?us-ascii?Q?7FfrFfQnNTFTRCSB9TZyROEV9JYzXlUiaZgzvAMo+fq3JYND7fhHB//CU3FM?=
 =?us-ascii?Q?w8bJTLOvzoHHxP4vmXMheXnMnRf6cMhXWH9sLAWdpZWhluWS3luiLVL00YVH?=
 =?us-ascii?Q?GgLg/82i4n7RDdIaPYLRfDYbaedQnba+38G1E2zMcWcHLiuDfqzrZ+Pzp3DP?=
 =?us-ascii?Q?EESGo9P5ROHGfaJz8SgLNLJyw9DUjrHBCZ3QnwjoBUJAI5hzcIojWTRP0bPm?=
 =?us-ascii?Q?w7btS/iZVImLFnVosP8jgtk7QhjfegftzKTMz9vrLSAuYAigs/2MOyLMGyu+?=
 =?us-ascii?Q?n+bRqrNLrjuLpepORl6EH5ynXfPXBX+ZJ8URD2Rv/kADFsER9npAerHywuzV?=
 =?us-ascii?Q?/J2IUOAyrSBNMWBIFmHTdBPdgCpUSJwf1rPvIY+Tk1zels5kg2ZVHpi2T8lp?=
 =?us-ascii?Q?CJnhfaxqYpl+KbmPYe/bn4gZdrNpTqa2IhePeKwrQcBr9mBtZKMib5DTcqOH?=
 =?us-ascii?Q?/BOB6oBnI00=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2Hp3meakSOqkVox4lvaQv/UBjDUeT3Qk+BmMdAJSfvxf/l/uJQrEws3kJbZ6?=
 =?us-ascii?Q?eQWQ/LPkNFeY8YrjVs6dLrIxC/MDn9pYxLAZxjTvhNEGI3/oufXE8//S3diQ?=
 =?us-ascii?Q?reDgQmbEz6yR5giyYyjvkOwdAwOTIYD54n6KaLu5ZGDSK8nLs3AksRpfhZ2Z?=
 =?us-ascii?Q?8TseJyjvdlVBa5ZvhFrypBl5WbuEhxV3d6B0KOivVOj34li635GesYkdJmOJ?=
 =?us-ascii?Q?oOKv3TxvIlL7CO6Y/Nq9D/kw5hrJ+mRDJfL+Dx2NTCpX+A3f1t88ddacVleq?=
 =?us-ascii?Q?VZ6CQNrL8gO9p7V0M0XNZEg56Rms5GQGx9Dfzny+8au/JCbfCFFKDh6Y+P4J?=
 =?us-ascii?Q?OSCMkrxVc657ieFI/VDRPFJxTDYSg7vvryT1yQQyuN//C+BNhg5Qjh9Ml1j3?=
 =?us-ascii?Q?i+EFECkyYXDtpos9JJlgEe6OhMMjmjCLXslwLz8qYntg3+YwN4RC0vfAdyXz?=
 =?us-ascii?Q?xzaIAXQKULYWua2/A99xFUUT+wkpSPGYNrfwlwl7X5wRmb0SFWfsT7qGXzox?=
 =?us-ascii?Q?HDEQM0FrHrHJHUTSibi9YIBbhuJrL2N/YWEMUL2sDzBQA1J0pL4zs7k5B8i5?=
 =?us-ascii?Q?c58saLRigQH9jsaJ4wnqLGgBODr8gx6jiX6J99QVa0j6RyPgvml8cJ6MNIsi?=
 =?us-ascii?Q?cRUMQDH3Dgl/2wPAVdyz9pHodimW1Z2dE0ezSJd72NdwPWfPXW5Q1mTbMJhy?=
 =?us-ascii?Q?i2VdmUYD0HPzAC/iaWXQABKDHkx0aWjA2BdnBRcZqS/NwkVqbKecp8VPYuwd?=
 =?us-ascii?Q?WZ+s4LL9it0dNxjDXhxtPUJwOuOVl4MjZCY7FWFIr5tfAELRVb2Y0+x7c9UR?=
 =?us-ascii?Q?qQBuErF2VvuXjgX4MzsV0k9hO4ZkHULVOkXZZmLb2QgQ0NMvXzr62eglbYte?=
 =?us-ascii?Q?i/ys4c57XxiSGlU6Ac1JhLgYQKNeCwS9bg5q0puC19/xgGUdHJvaQOfIRGlE?=
 =?us-ascii?Q?74fla/oxyjxfZXtgb/6WXapt5xncsGlhEs0iYEkdUzJb8CWitCWmv/ymLSLP?=
 =?us-ascii?Q?/hb1iMGbVULgFLmEfH7Hax9fd/uqssX1T2ppJiVas4KwSym2yJDBSyWs5TJx?=
 =?us-ascii?Q?UY1SDRw1eM/zTtoYVllV5RX+dt4B2py/8ozMTdlTGXZOs/naMDTz0YKVo093?=
 =?us-ascii?Q?SF/LMQak+dRjvTb99TAh+6fal0cOqvQBgSpcKX01M7FiJYI/E2tDujnNETWD?=
 =?us-ascii?Q?sAyamHzzZj1WxMJaFdZLjbCl06eNvHYoNDfIZ48LP/mFp4cHxzGdfeggHC2K?=
 =?us-ascii?Q?2rpvmpcZwnfz/IvOeRRH9QXzsAmSNmqEvrYOGJa3diOloARq2hozn9rXNkQu?=
 =?us-ascii?Q?gkELl2sbA1OOsaWMY5KAxn2OXOqJmRFPjHEyW9yNkStqDSwr01pJFmN5co+V?=
 =?us-ascii?Q?laVQFxK0ZcPPJlENiema+mbDbUuolTLpG1luLlQadZ5jb+bxvgCjeOxL03Lh?=
 =?us-ascii?Q?P4ijkg2tT2G1kfmNraP4zk+XaI39EvQ9P9VrUYCO0D5ix9WxDj9L5AmFiDb5?=
 =?us-ascii?Q?uK+h6Nk+dA/dyt2hW63p8VZ91uhBikmBum2BOWM2z5LEv3aJXMqJ+dygxCXf?=
 =?us-ascii?Q?RhkJd5CZsh3MGzAC78v06fHXTLar56ZTJqg0EdcY?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 69ff9421-b578-44d5-43d7-08ddfa9f9ea8
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2025 12:49:22.8084 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kqDVImJS75sQ9/Dufcl2KDTEYP41jaSfM0zDcKm8oh3WFyqJBkPDqMpht4sDDuFYKS2ZageCAdf6lG/zWp1HBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7177
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

On Fri, Sep 19, 2025 at 05:27:05PM -0400, Rodrigo Vivi wrote:
> On Fri, Sep 19, 2025 at 06:04:30PM +0200, Michal Wajdeczko wrote:
> > Like we did for tile-based attributes, introduce separate show()
> > helper that implicitly takes an RPM reference prior to the call
> > to the actual print() function. This translates into some savings.
> > 
> > Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > ---
> > Here is a report from the scripts/bloat-o-meter:
> > 
> >   add/remove: 2/2 grow/shrink: 0/14 up/down: 114/-581 (-467)
> >   Function                                     old     new   delta
> >   xe_gt_debugfs_show_with_rpm                    -      98     +98
> >   __pfx_xe_gt_debugfs_show_with_rpm              -      16     +16
> >   __pfx_powergate_info                          16       -     -16
> >   register_save_restore                        317     288     -29
> >   vecs_default_lrc                              73      42     -31
> >   vcs_default_lrc                               73      42     -31
> >   rcs_default_lrc                               70      39     -31
> >   ccs_default_lrc                               73      42     -31
> >   bcs_default_lrc                               73      42     -31
> >   hw_engines                                   179     145     -34
> >   hwconfig                                      70      33     -37
> >   workarounds                                   66      26     -40
> >   tunings                                       66      26     -40
> >   topology                                      66      26     -40
> >   steering                                      66      26     -40
> >   pat                                           66      26     -40
> >   mocs                                          66      26     -40
> >   powergate_info                                70       -     -70
> >   Total: Before=2870434, After=2869967, chg -0.02%
> > ---
> >  drivers/gpu/drm/xe/xe_gt_debugfs.c | 116 +++++++++++------------------
> >  drivers/gpu/drm/xe/xe_gt_debugfs.h |   1 +
> >  2 files changed, 46 insertions(+), 71 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> > index e4eba91cb83d..b9176d4398e1 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> > @@ -35,6 +35,11 @@
> >  #include "xe_uc_debugfs.h"
> >  #include "xe_wa.h"
> >  
> > +static struct xe_gt *node_to_gt(struct drm_info_node *node)
> > +{
> > +	return node->dent->d_parent->d_inode->i_private;
> > +}
> > +
> >  /**
> >   * xe_gt_debugfs_simple_show - A show callback for struct drm_info_list
> >   * @m: the &seq_file
> > @@ -77,8 +82,7 @@ int xe_gt_debugfs_simple_show(struct seq_file *m, void *data)
> >  {
> >  	struct drm_printer p = drm_seq_file_printer(m);
> >  	struct drm_info_node *node = m->private;
> > -	struct dentry *parent = node->dent->d_parent;
> > -	struct xe_gt *gt = parent->d_inode->i_private;
> > +	struct xe_gt *gt = node_to_gt(node);
> >  	int (*print)(struct xe_gt *, struct drm_printer *) = node->info_ent->data;
> >  
> >  	if (WARN_ON(!print))
> > @@ -87,15 +91,36 @@ int xe_gt_debugfs_simple_show(struct seq_file *m, void *data)
> >  	return print(gt, &p);
> >  }
> >  
> > +/**
> > + * xe_gt_debugfs_show_with_rpm - A show callback for struct drm_info_list
> > + * @m: the &seq_file
> > + * @data: data used by the drm debugfs helpers
> > + *
> > + * Similar to xe_gt_debugfs_simple_show() but implicitly takes a RPM ref.
> > + *
> > + * Return: 0 on success or a negative error code on failure.
> > + */
> > +int xe_gt_debugfs_show_with_rpm(struct seq_file *m, void *data)
> > +{
> > +	struct drm_info_node *node = m->private;
> > +	struct xe_gt *gt = node_to_gt(node);
> > +	struct xe_device *xe = gt_to_xe(gt);
> > +	int ret;
> > +
> > +	xe_pm_runtime_get(xe);
> > +	ret = xe_gt_debugfs_simple_show(m, data);
> > +	xe_pm_runtime_put(xe);
> > +
> > +	return ret;
> > +}
> > +
> >  static int hw_engines(struct xe_gt *gt, struct drm_printer *p)
> >  {
> > -	struct xe_device *xe = gt_to_xe(gt);
> >  	struct xe_hw_engine *hwe;
> >  	enum xe_hw_engine_id id;
> >  	unsigned int fw_ref;
> >  	int ret = 0;
> >  
> > -	xe_pm_runtime_get(xe);
> >  	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> >  	if (!xe_force_wake_ref_has_domain(fw_ref, XE_FORCEWAKE_ALL)) {
> >  		ret = -ETIMEDOUT;
> > @@ -107,37 +132,19 @@ static int hw_engines(struct xe_gt *gt, struct drm_printer *p)
> >  
> >  fw_put:
> >  	xe_force_wake_put(gt_to_fw(gt), fw_ref);
> > -	xe_pm_runtime_put(xe);
> > -
> > -	return ret;
> > -}
> > -
> > -static int powergate_info(struct xe_gt *gt, struct drm_printer *p)
> 
> I believe this should be removed in a separate patch.
> It confused me when the number of rpm removals and the number of
> function changed below didn't match. 
> 
> > -{
> > -	int ret;
> > -
> > -	xe_pm_runtime_get(gt_to_xe(gt));
> > -	ret = xe_gt_idle_pg_print(gt, p);
> > -	xe_pm_runtime_put(gt_to_xe(gt));
> >  
> >  	return ret;
> >  }
> >  
> >  static int topology(struct xe_gt *gt, struct drm_printer *p)
> >  {
> > -	xe_pm_runtime_get(gt_to_xe(gt));
> >  	xe_gt_topology_dump(gt, p);
> > -	xe_pm_runtime_put(gt_to_xe(gt));
> > -
> >  	return 0;
> >  }
> >  
> >  static int steering(struct xe_gt *gt, struct drm_printer *p)
> >  {
> > -	xe_pm_runtime_get(gt_to_xe(gt));
> >  	xe_gt_mcr_steering_dump(gt, p);
> > -	xe_pm_runtime_put(gt_to_xe(gt));
> > -
> >  	return 0;
> >  }
> >  
> > @@ -146,8 +153,6 @@ static int register_save_restore(struct xe_gt *gt, struct drm_printer *p)
> >  	struct xe_hw_engine *hwe;
> >  	enum xe_hw_engine_id id;
> >  
> > -	xe_pm_runtime_get(gt_to_xe(gt));
> > -
> >  	xe_reg_sr_dump(&gt->reg_sr, p);
> >  	drm_printf(p, "\n");
> >  
> > @@ -165,98 +170,66 @@ static int register_save_restore(struct xe_gt *gt, struct drm_printer *p)
> >  	for_each_hw_engine(hwe, gt, id)
> >  		xe_reg_whitelist_dump(&hwe->reg_whitelist, p);
> >  
> > -	xe_pm_runtime_put(gt_to_xe(gt));
> > -
> >  	return 0;
> >  }
> >  
> >  static int workarounds(struct xe_gt *gt, struct drm_printer *p)
> >  {
> > -	xe_pm_runtime_get(gt_to_xe(gt));
> >  	xe_wa_dump(gt, p);
> > -	xe_pm_runtime_put(gt_to_xe(gt));
> > -
> >  	return 0;
> >  }
> >  
> >  static int tunings(struct xe_gt *gt, struct drm_printer *p)
> >  {
> > -	xe_pm_runtime_get(gt_to_xe(gt));
> >  	xe_tuning_dump(gt, p);
> > -	xe_pm_runtime_put(gt_to_xe(gt));
> > -
> >  	return 0;
> >  }
> >  
> >  static int pat(struct xe_gt *gt, struct drm_printer *p)
> >  {
> > -	xe_pm_runtime_get(gt_to_xe(gt));
> >  	xe_pat_dump(gt, p);
> > -	xe_pm_runtime_put(gt_to_xe(gt));
> > -
> >  	return 0;
> >  }
> >  
> >  static int mocs(struct xe_gt *gt, struct drm_printer *p)
> >  {
> > -	xe_pm_runtime_get(gt_to_xe(gt));
> >  	xe_mocs_dump(gt, p);
> > -	xe_pm_runtime_put(gt_to_xe(gt));
> > -
> >  	return 0;
> >  }
> >  
> >  static int rcs_default_lrc(struct xe_gt *gt, struct drm_printer *p)
> >  {
> > -	xe_pm_runtime_get(gt_to_xe(gt));
> >  	xe_lrc_dump_default(p, gt, XE_ENGINE_CLASS_RENDER);
> > -	xe_pm_runtime_put(gt_to_xe(gt));
> > -
> >  	return 0;
> >  }
> >  
> >  static int ccs_default_lrc(struct xe_gt *gt, struct drm_printer *p)
> >  {
> > -	xe_pm_runtime_get(gt_to_xe(gt));
> >  	xe_lrc_dump_default(p, gt, XE_ENGINE_CLASS_COMPUTE);
> > -	xe_pm_runtime_put(gt_to_xe(gt));
> > -
> >  	return 0;
> >  }
> >  
> >  static int bcs_default_lrc(struct xe_gt *gt, struct drm_printer *p)
> >  {
> > -	xe_pm_runtime_get(gt_to_xe(gt));
> >  	xe_lrc_dump_default(p, gt, XE_ENGINE_CLASS_COPY);
> > -	xe_pm_runtime_put(gt_to_xe(gt));
> > -
> >  	return 0;
> >  }
> >  
> >  static int vcs_default_lrc(struct xe_gt *gt, struct drm_printer *p)
> >  {
> > -	xe_pm_runtime_get(gt_to_xe(gt));
> >  	xe_lrc_dump_default(p, gt, XE_ENGINE_CLASS_VIDEO_DECODE);
> > -	xe_pm_runtime_put(gt_to_xe(gt));
> > -
> >  	return 0;
> >  }
> >  
> >  static int vecs_default_lrc(struct xe_gt *gt, struct drm_printer *p)
> >  {
> > -	xe_pm_runtime_get(gt_to_xe(gt));
> >  	xe_lrc_dump_default(p, gt, XE_ENGINE_CLASS_VIDEO_ENHANCE);
> > -	xe_pm_runtime_put(gt_to_xe(gt));
> > -
> >  	return 0;
> >  }
> >  
> >  static int hwconfig(struct xe_gt *gt, struct drm_printer *p)
> >  {
> > -	xe_pm_runtime_get(gt_to_xe(gt));
> >  	xe_guc_hwconfig_dump(&gt->uc.guc, p);
> > -	xe_pm_runtime_put(gt_to_xe(gt));
> > -
> >  	return 0;
> >  }
> >  
> > @@ -266,25 +239,26 @@ static int hwconfig(struct xe_gt *gt, struct drm_printer *p)
> >   * - without access to the PF specific data
> >   */
> >  static const struct drm_info_list vf_safe_debugfs_list[] = {
> > -	{"topology", .show = xe_gt_debugfs_simple_show, .data = topology},
> > -	{"register-save-restore", .show = xe_gt_debugfs_simple_show, .data = register_save_restore},
> > -	{"workarounds", .show = xe_gt_debugfs_simple_show, .data = workarounds},
> > -	{"tunings", .show = xe_gt_debugfs_simple_show, .data = tunings},
> > -	{"default_lrc_rcs", .show = xe_gt_debugfs_simple_show, .data = rcs_default_lrc},
> > -	{"default_lrc_ccs", .show = xe_gt_debugfs_simple_show, .data = ccs_default_lrc},
> > -	{"default_lrc_bcs", .show = xe_gt_debugfs_simple_show, .data = bcs_default_lrc},
> > -	{"default_lrc_vcs", .show = xe_gt_debugfs_simple_show, .data = vcs_default_lrc},
> > -	{"default_lrc_vecs", .show = xe_gt_debugfs_simple_show, .data = vecs_default_lrc},
> > -	{"hwconfig", .show = xe_gt_debugfs_simple_show, .data = hwconfig},
> > +	{ "topology", .show = xe_gt_debugfs_show_with_rpm, .data = topology },
> > +	{ "register-save-restore",
> > +		.show = xe_gt_debugfs_show_with_rpm, .data = register_save_restore },
> > +	{ "workarounds", .show = xe_gt_debugfs_show_with_rpm, .data = workarounds },
> > +	{ "tunings", .show = xe_gt_debugfs_show_with_rpm, .data = tunings },
> > +	{ "default_lrc_rcs", .show = xe_gt_debugfs_show_with_rpm, .data = rcs_default_lrc },
> > +	{ "default_lrc_ccs", .show = xe_gt_debugfs_show_with_rpm, .data = ccs_default_lrc },
> > +	{ "default_lrc_bcs", .show = xe_gt_debugfs_show_with_rpm, .data = bcs_default_lrc },
> > +	{ "default_lrc_vcs", .show = xe_gt_debugfs_show_with_rpm, .data = vcs_default_lrc },
> > +	{ "default_lrc_vecs", .show = xe_gt_debugfs_show_with_rpm, .data = vecs_default_lrc },
> > +	{ "hwconfig", .show = xe_gt_debugfs_show_with_rpm, .data = hwconfig },
> >  };
> >  
> >  /* everything else should be added here */
> >  static const struct drm_info_list pf_only_debugfs_list[] = {
> > -	{"hw_engines", .show = xe_gt_debugfs_simple_show, .data = hw_engines},
> > -	{"mocs", .show = xe_gt_debugfs_simple_show, .data = mocs},
> > -	{"pat", .show = xe_gt_debugfs_simple_show, .data = pat},
> > -	{"powergate_info", .show = xe_gt_debugfs_simple_show, .data = powergate_info},
> > -	{"steering", .show = xe_gt_debugfs_simple_show, .data = steering},
> > +	{ "hw_engines", .show = xe_gt_debugfs_show_with_rpm, .data = hw_engines },
> > +	{ "mocs", .show = xe_gt_debugfs_show_with_rpm, .data = mocs },
> > +	{ "pat", .show = xe_gt_debugfs_show_with_rpm, .data = pat },
> > +	{ "powergate_info", .show = xe_gt_debugfs_show_with_rpm, .data = xe_gt_idle_pg_print },

please ignore my last email, I had missed this entry here. And thanks for pointing out it offline.

I wonder if we could do something similar to the void return functions as well so we
keep some kind of symmetry...

anyway this patch is correct:

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> > +	{ "steering", .show = xe_gt_debugfs_show_with_rpm, .data = steering },
> >  };
> >  
> >  static ssize_t write_to_gt_call(const char __user *userbuf, size_t count, loff_t *ppos,
> > diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.h b/drivers/gpu/drm/xe/xe_gt_debugfs.h
> > index 05a6cc93c78c..32ee3264051b 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_debugfs.h
> > +++ b/drivers/gpu/drm/xe/xe_gt_debugfs.h
> > @@ -11,5 +11,6 @@ struct xe_gt;
> >  
> >  void xe_gt_debugfs_register(struct xe_gt *gt);
> >  int xe_gt_debugfs_simple_show(struct seq_file *m, void *data);
> > +int xe_gt_debugfs_show_with_rpm(struct seq_file *m, void *data);
> >  
> >  #endif
> > -- 
> > 2.47.1
> > 
