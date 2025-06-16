Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F340C71135
	for <intel-xe@archiver.kernel.org>; Mon, 16 Jun 2025 09:52:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCF9610E305;
	Mon, 16 Jun 2025 09:52:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TeeZYxqT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 569AD10E305
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Jun 2025 09:52:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750067553; x=1781603553;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=oF7AgqrQllj0tS3MStDVRO9B0zrWp4kdngob+flElxw=;
 b=TeeZYxqT2BuioMXL9nzQfOlkE29vtUMN4zwiy3Gxrdu1gdhVFc4N0ZXJ
 X0zD09qNjcd2WEC/u3j1uT7s4GrEp7cI1cq/qGAZa3w5+jtjZTccC2cvR
 FEtyKlqVQ4ftGLnVBAuZWm1wvPVN5wqBMZovl2E8sWr2Q/941yl/wK0Os
 SSvRsycgFtCwJdcapOzTGad7e4xaXlFqUKfrGgXk0qg8yH1cTWLqpTa4d
 +l0LKf+n/VTmjnBcbEu5lAu6u+l2mieeDQ0v/3lj5nkJJ9SrWUqHUjKbl
 +tpBe2rUWkqKDhihUosrlHSypTaRQSvrSnTXppH/+OaZnrhfewuPWoIVB g==;
X-CSE-ConnectionGUID: qDp4oGdZR6euZueuXiUquA==
X-CSE-MsgGUID: hbroF7IvTrWKM2Tfz8XjFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="55880715"
X-IronPort-AV: E=Sophos;i="6.16,240,1744095600"; d="scan'208";a="55880715"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2025 02:52:33 -0700
X-CSE-ConnectionGUID: TvRAK5v1RBeL7BAYtr3bdg==
X-CSE-MsgGUID: K4EI+VBSSaW2VBO4BS1rhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,240,1744095600"; d="scan'208";a="148889536"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2025 02:52:32 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 16 Jun 2025 02:52:31 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 16 Jun 2025 02:52:31 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.78) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 16 Jun 2025 02:52:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=clcjJ6HDA7kOihqk68GcIe2I9ysP1yJdy6f+0tVpEULKtGmK2KXBuBMO5r66TkGer3xTJTGKHTwp3hRRRgtrHhtEI7c5KEGjAwtX4q6f1m4znwkc35XaYixfzDmbIzbOx4YN57/mq/pfAJVu2tT9Fs5jRZkru4UL3dpXVG+gKU6Y1zDywVYtSBBpHw1a6i9hlNP5nE841452BAe0Uluu9SOpr+IHExZ0EfU+2jtUitzqXUQyEyhi2OMjF0PsfYdz1m4DyL+n0DGihcG5gSpmm5Oo0vcfNIbYtykG4rxklHi4NeSzL/3TLBD834+m/aUoKjAlhv6NkkiOlfAq0H2obg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CuzZ1tgIAysjBIzUuCGl3WE23jqX8BpOPm6iZjY9s3k=;
 b=UHR90+8KpwN4xEVdh1iL9xjtYFarb6HpaE30/xaSXt57q9mkA+oantxSXwhl7K9mg6EQJLsboFO5mLE9H7MJxcV2pUnhrnTD8z+/MLNF5433igHmxLkHa7Tlo5aJxbwuIV7nP04Gnm9T/7rilqB4hKarE7xPxmAED60DhDq7f5uAQbLbsth83QDCj7OlUQgkrO23Hf/7J3n8bmd/B6Yr8yKnG9pJdE7bc1WRzbjFXKHda1ClKPi6Vc57lxxAMQZumZJETnhFaI4I4XLqwV6Q6XskApbVnnpnlrPFA6AkAIohuqnemcYn8wqetQuh+O0i+Q8UNq+zmsxwcGxcSCc8HA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM3PPFD320E2257.namprd11.prod.outlook.com (2603:10b6:f:fc00::f51)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.26; Mon, 16 Jun
 2025 09:52:16 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.8835.027; Mon, 16 Jun 2025
 09:52:15 +0000
Date: Mon, 16 Jun 2025 02:53:52 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2] drm/xe: Use RCU free for exec queue, not GuC exec queue
Message-ID: <aE/psGMZdKc3aF9a@lstrano-desk.jf.intel.com>
References: <20250616072737.2062805-1-matthew.brost@intel.com>
 <faba71be-0f1c-4c5a-81db-b072e43a1c7e@igalia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <faba71be-0f1c-4c5a-81db-b072e43a1c7e@igalia.com>
X-ClientProxiedBy: MW4P221CA0011.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:303:8b::16) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM3PPFD320E2257:EE_
X-MS-Office365-Filtering-Correlation-Id: b1ef6348-b0c6-4dbd-e311-08ddacbb79b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?QRwSSm7lf9026H5CGyU6goX4f39MkkBllkqcHjjP2OMEDlC4Ss+8p6d2rD3P?=
 =?us-ascii?Q?faafIJOilzwJ3+D66DuugtH2Wx2BlEKsVEeisvcCFTgeupGu3+iI/7OqGbYa?=
 =?us-ascii?Q?7JnUTNxadmM8iBBoBRFb2AFnORq/MnRHCCU4zpgZQyddYzkJ7tNwrQDLuNnD?=
 =?us-ascii?Q?xA5/4eeoZlz2e9lOmdpIh1rQgONQg/94o/BuA3On4+wpVL40vzMcGVG5nU+i?=
 =?us-ascii?Q?NfnHadc2WcHtYECIi3bXP6dPGR0NZxojQJh7dRgp+ZqfyxwUnRUG8HevTEnO?=
 =?us-ascii?Q?a+el7UcpU9RhelrrupZ1+7kcWR3mDq+Ecj7cTGgXQf/fgkCwT/GXxGyLiE53?=
 =?us-ascii?Q?qNKkRwIQFT72b/8HQUu3GEBLHhAsdpaBV6Xqr5FjI4kIiafxcbVG8iKOinz7?=
 =?us-ascii?Q?a3ViXdY5jicTEeXVXlCab+4TTNswGIhEEymUmKWfSfi9K2BdHzyj3VLQ7I+s?=
 =?us-ascii?Q?00tsWX/CWsT/4MYtYL6BDffZ/gFMQ/BV7NA3b+45/wJGE52UYDtq20MyV7Sk?=
 =?us-ascii?Q?oUZcZQsNzyMKW+EXRLtCRTdwUu/0ear5Wp7Js6nYvwQCEXMoq0siGG73JVXN?=
 =?us-ascii?Q?5NsXs4TsELuUf5oHSHoGwlbFp4wToSFyfwujSCuMRyoCZ6OB80kYhcoNSJQQ?=
 =?us-ascii?Q?9DnQ7oDIpLLDj8P7SWPT0iMjPJpJ/pR3JUy7f+0CPykpRh2A+/b1ljJvLM3x?=
 =?us-ascii?Q?IHS4Ne1C61Vw4Wbf7mrssTxbBdoTEQ3VNUZ5dNzJP/5fnxeoVKSK/iKxPWZP?=
 =?us-ascii?Q?2+dVbewaDFKpTAsggUS6bfIZBcWUlyeZuPjNOvzskGHQFbfTDeXFqkUFdeM9?=
 =?us-ascii?Q?02jLgdRJslaoezvsntwRKmGfttL9uhoprHwzzxOssbcoA5Z0Nys6lRhBvJ/j?=
 =?us-ascii?Q?kCHmZd5Qx24ra8CsrhC/Rj90PavTVF7dNCLtqkT4k4DNmW/1Mshj+noV6HKh?=
 =?us-ascii?Q?pc4s8MltWE2zaQrm7VjAv97UZ2IxiTt9QrnO1otEdZF70EhT5qW1ZpJGX67A?=
 =?us-ascii?Q?IG6Co4PXIRXgMgYj2VqUpQZDai5OZF0A318Px+Hh1L58xxsm9cBnXhNAfuXx?=
 =?us-ascii?Q?nlQuGsh605ek42FcqLvy3Z9DdbbvEAkLHjQiS62s4oxAXhONFeksItElV7TW?=
 =?us-ascii?Q?O/j5ZwlLq4ryPX+/KcKBarZeTqDiQ/RLT0akL/2OAIEZ6aXPDe7PysLhM2yF?=
 =?us-ascii?Q?shfy0+7Pu8xb4RH2WdT8Sh0IpltIqMMygu6k3kzyv4J7PdraE8x041eYhq56?=
 =?us-ascii?Q?2yLPh8RBuoyYjD6VoC23OSVskPSJGei0tt2WwJ93+Bn3d+m5kl7X7HCurAqb?=
 =?us-ascii?Q?UFIvEibGAnwifB+V7MfRnjKJoj+H6sYqETe8bRk2rl6UFHQeaUvmEAMo7uXm?=
 =?us-ascii?Q?SI8LJ69rx4RcWIKNpiDk0XebcDHlwgBKj4LtLi387272+Xm+dQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?uUCe5Sn2qTOW4dejGTaMuq8iH1VO2awfWyH5w0x2WrssVk5rzHFHD5LFAwFp?=
 =?us-ascii?Q?G30LPtFqjZNgqCHzaZRz/vWd4J5Ku/mGcFom9FEV/sbAogpYCz312R/AmEig?=
 =?us-ascii?Q?x56uiXYVfUT4eVYyg9ovGOJHiGM4kbwPQSuLLgYYffJi18Tq/VXpciedvQRt?=
 =?us-ascii?Q?yU+7PhPr7CfG5HzRjDK1oVX5iTpTyi0qF+d9UMYFVnYmeQsvhYNpYzNTg+wv?=
 =?us-ascii?Q?bH2ysqR2jl2Op0N7cGvUoAyDoIR6yOs4+Jc3BCPesKiDU0yokNCLjM0UwO6y?=
 =?us-ascii?Q?uOrkkatdylLruDDQqu3CitBqO9vnreVvbi1GaVvzrFVXYxoosaYGx0joVOW9?=
 =?us-ascii?Q?Qe4mcFS2pu7NzoRv4ad3vJWtWnrSOWuCEIqIK6t+xV1AbPhZYiaj8RUbBfMi?=
 =?us-ascii?Q?AJ8nqbhkQ6aUrN0IfKOFN+FEunhhkTjoxwcGRFYG2efHmXgdLV6CcKAwhgMu?=
 =?us-ascii?Q?paNAUcmUzp93O0CJr/WdmBoelazXIcdiUuZet/oxMUGhwnn4u13gbogNbhhI?=
 =?us-ascii?Q?hwmqolUAmXhyfGs1fenHlM3lfbhFK014rJFHCNNQ92hLYfTNX+ccjFK6V9NC?=
 =?us-ascii?Q?W2cGVCZ/2/VlWixyik1Ua3o975nyHp08kzOqsQ/XHSXrR4QW8CN+A4+z50jV?=
 =?us-ascii?Q?Q2qaX9PT2p8d5vRmGzVwofE5snunxs5+tuwLo5XaPeabBziPf4bXtjrslyMP?=
 =?us-ascii?Q?AK5ju1m2d/sbaU2f5c3UIu8hsPnN1FvsBJe1YyrncmCTuqRn58D0VOm80y3I?=
 =?us-ascii?Q?O3z6gPzJUeZq4/EsKpeU0SHSN6uOsroQ87zILLz5RWnrjjJ7tS5RId7W2WDA?=
 =?us-ascii?Q?6gL3IdBD7vVDxqZged+3vUpPBDCXXE+ziF1lHDMfv+9fDH3JOacbOLHgnfzM?=
 =?us-ascii?Q?QB5kxk0CsuoXee8XmdlmJ8SNOSbWQsolr02FsVJuB4xkqRC6FwVI4qn3lQLe?=
 =?us-ascii?Q?ABYI4Fx8sj/uHH6ClMGL8DAa9DJUt42QZ0FtwZgYjsBlPA6iyid5qS73HzE7?=
 =?us-ascii?Q?QJV4kZrPZEOxH0qVaT+Ty1gNKiPgWea8rjSE68fE3a1vdV0xVFTan9iBfaG/?=
 =?us-ascii?Q?Wsqu1TpAi/AW66o08oSEO+20r8Ogi/3X18vija/PBTC5/gnEvpv+LbpB1S2h?=
 =?us-ascii?Q?7gQ/n3fvUa93geIZLqz4Ntp7VXjxbEc2IUBW3g66MXVdLxWOg10YjKiB8fs+?=
 =?us-ascii?Q?0Hetx+oIXKsIMVeHa/+wdsaBfO8ckvR+0+IOUuMXWLH9HIFwCsJT1o32f+H0?=
 =?us-ascii?Q?tNegtHqQnJPtX0q/pNMcCwxCzn58PNxza7QC+5NWHWMUIP4BiXizjFxQlswn?=
 =?us-ascii?Q?qcW94a987QPMCVA58kjCn1vyI4dd7Y5p6nYm1aZTGLKg9wHM7l54t4lNBGlJ?=
 =?us-ascii?Q?unt84RMv+8Kh83JH25qTLjwmbbq9DEgdYwJio99WPxYk3uNrVRzh4JlrQhY0?=
 =?us-ascii?Q?MZoyPDKjjXA7+b+H9uZnXmfO0YUnGKZXSFZBnzhpfC8Ean4OawPTrtwKonkR?=
 =?us-ascii?Q?Pg/fr5Qt3d2N1eUjLXRjWNq6tTvSHJ0V/RxDS0qEs3SJ80ADlzCBaUJhi1Kr?=
 =?us-ascii?Q?cdzJjmu4tyAK0m06+dMjIKe0ealyRbLcBz2PAxrGKCZ7yuj94chtBNTQ3rjv?=
 =?us-ascii?Q?sQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b1ef6348-b0c6-4dbd-e311-08ddacbb79b5
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 09:52:15.8968 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GnYrhgarkybHY3wxLXoCjpnd7JsZyuwqy3r9V05gzeGpoSHa+TTc+qPkVLy+anp69CzcGqDx/9guf73TxPrmtQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPFD320E2257
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

On Mon, Jun 16, 2025 at 09:35:14AM +0100, Tvrtko Ursulin wrote:
> 
> On 16/06/2025 08:27, Matthew Brost wrote:
> > The exec queue name is used in dma-fence timelines, not the GuC exec queue.
> > Therefore, the exec queue itself requires RCU freeing rather than the
> > GuC exec queue.
> > 
> > Fixes: 6bd90e700b42 ("drm/xe: Make dma-fences compliant with the safe access rules")
> > Cc: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >   drivers/gpu/drm/xe/xe_exec_queue.c           | 7 ++++++-
> >   drivers/gpu/drm/xe/xe_exec_queue_types.h     | 2 ++
> >   drivers/gpu/drm/xe/xe_guc_exec_queue_types.h | 2 --
> >   drivers/gpu/drm/xe/xe_guc_submit.c           | 7 +------
> >   4 files changed, 9 insertions(+), 9 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> > index fee22358cc09..d8c3e983ffb6 100644
> > --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> > +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> > @@ -47,7 +47,11 @@ static void __xe_exec_queue_free(struct xe_exec_queue *q)
> >   	if (q->xef)
> >   		xe_file_put(q->xef);
> > -	kfree(q);
> > +	/*
> > +	 * RCU free due sched being exported via DRM scheduler fences
> > +	 * (timeline name).
> > +	 */
> > +	kfree_rcu(q, rcu);
> >   }
> >   static struct xe_exec_queue *__xe_exec_queue_alloc(struct xe_device *xe,
> > @@ -82,6 +86,7 @@ static struct xe_exec_queue *__xe_exec_queue_alloc(struct xe_device *xe,
> >   	INIT_LIST_HEAD(&q->multi_gt_link);
> >   	INIT_LIST_HEAD(&q->hw_engine_group_link);
> >   	INIT_LIST_HEAD(&q->pxp.link);
> > +	init_rcu_head(&q->rcu);
> >   	q->sched_props.timeslice_us = hwe->eclass->sched_props.timeslice_us;
> >   	q->sched_props.preempt_timeout_us =
> > diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > index cc1cffb5c87f..a17fe852fc0d 100644
> > --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > @@ -43,6 +43,8 @@ struct xe_exec_queue {
> >   	/** @gt: GT structure this exec queue can submit to */
> >   	struct xe_gt *gt;
> > +	/** @rcu: For safe freeing of exported dma fences */
> > +	struct rcu_head rcu;
> >   	/**
> >   	 * @hwe: A hardware of the same class. May (physical engine) or may not
> >   	 * (virtual engine) be where jobs actual engine up running. Should never
> > diff --git a/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h b/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
> > index a3f421e2adc0..4c39f01e4f52 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
> > +++ b/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
> > @@ -20,8 +20,6 @@ struct xe_exec_queue;
> >   struct xe_guc_exec_queue {
> >   	/** @q: Backpointer to parent xe_exec_queue */
> >   	struct xe_exec_queue *q;
> > -	/** @rcu: For safe freeing of exported dma fences */
> > -	struct rcu_head rcu;
> >   	/** @sched: GPU scheduler for this xe_exec_queue */
> >   	struct xe_gpu_scheduler sched;
> >   	/** @entity: Scheduler entity for this xe_exec_queue */
> > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> > index df7a5a4eec74..7170e78e5b8e 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > @@ -1299,11 +1299,7 @@ static void __guc_exec_queue_fini_async(struct work_struct *w)
> >   	xe_sched_entity_fini(&ge->entity);
> >   	xe_sched_fini(&ge->sched);
> > -	/*
> > -	 * RCU free due sched being exported via DRM scheduler fences
> > -	 * (timeline name).
> > -	 */
> > -	kfree_rcu(ge, rcu);
> > +	kfree(ge);
> >   	xe_exec_queue_fini(q);
> 
> Hmm but before it gets to the name it needs to dereference the drm sched,
> and drm sched is embedded in the guc queue.
> 
> So as soon as kfree(ge) runs here, drm_sched_fence_get_timeline_name() can
> oops on fence->sched dereference.
> 
> Name is then one derefence further - fence->sched->name. Which indeed points
> to xe_exec_queue, but because that one is destroyed second, kfree_rcu on the
> guc queue adds the appropriate guarantee of one RCU period before signaling
> and ability to enter fence->get_timeline_name().
> 
> In summary how I had it still looks correct to me. Does it explode somehow

Yea, I think you are right. No exploding. I was working on something
else and misconstrued what the RCU was protecting - the scheduler not
the name.

Matt

> or what prompted you to think it was wrong?
> 
> Regards,
> 
> Tvrtko
> 
> >   	xe_pm_runtime_put(guc_to_xe(guc));
> >   }
> > @@ -1486,7 +1482,6 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
> >   	q->guc = ge;
> >   	ge->q = q;
> > -	init_rcu_head(&ge->rcu);
> >   	init_waitqueue_head(&ge->suspend_wait);
> >   	for (i = 0; i < MAX_STATIC_MSG_TYPE; ++i)
> 
