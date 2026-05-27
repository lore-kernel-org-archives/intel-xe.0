Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62379CD5BD0
	for <intel-xe@archiver.kernel.org>; Wed, 27 May 2026 21:45:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1471310EA39;
	Wed, 27 May 2026 21:45:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dB8z3yyv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE12A10EA38
 for <intel-xe@lists.freedesktop.org>; Wed, 27 May 2026 21:45:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779918304; x=1811454304;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=7X+YRutqWn/Lix/+dLWlDPTtMw227CfVUr4WgJSwrhs=;
 b=dB8z3yyvtZPpfhgaoDJgP6+xdmedS2s03o+MIj+N/4dKFAdWKb07SCBW
 sit7rye5OXueQbTmNlTuiHf3CpK/N5ulM/Yk5eVyi0VPZFXWG0Tm+xeEh
 pnrqD5TIwVFXyNV5WAwnSfCbAwdgvES/r/IA32Af0nRQyzOlPviROIllh
 ttKfimFxe7PGuuR/Jq9LXyulGv5N9kL5ax0sJp054DvadaGXiI6KnYEzn
 pAy1lP2lLTTrojexwwUK3bn+u3BJkotznVJv0GnH5ZIcHPo+nTApN/+/D
 ZkrZ5R6cnjtsecpnwyVL1QeHwv80U+ayKaSb0Y+jABIr5YrYIMkidsw0X A==;
X-CSE-ConnectionGUID: 1k10XITKR3Ouquby3dsDpw==
X-CSE-MsgGUID: cgfEI68vRpqkqvRoGCHQ/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11799"; a="80613564"
X-IronPort-AV: E=Sophos;i="6.24,172,1774335600"; d="scan'208";a="80613564"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2026 14:45:03 -0700
X-CSE-ConnectionGUID: n3Q8Id3QQU+k5eDoA/rrmQ==
X-CSE-MsgGUID: OBmIsP87ScOZSbIXNAutFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,172,1774335600"; d="scan'208";a="241527256"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2026 14:45:03 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 27 May 2026 14:45:02 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 27 May 2026 14:45:02 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.33) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 27 May 2026 14:45:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xo/Bg+ed617dP+wZJcFldR3nLPLyLtkPt3feGdKCj7gHvOMptonfn4VXXdqUz0KieBknotK4JFNgVj3GwHAKJxygl+KkFu+0ULK390qGnz4pt5jWu28bL1w4FvxvjXXd8/09hSJjeFslGmP8jHRDWlOhVWRU7J9SvxoJ5hTukJQt+Cq9UWHoUICCZfzYLXF5SDNyiop+pTk+nDOJ+2ywSEjWFC4kZn0OjoZYWO1kDFv8Sf3fCusqFvskkErbqrJiTQy8o358uFyAZDM2QRAy0nKgzXQ2QWKyHuRGLgJz1wiSyNfQkwTVQ9/z0r5GG5TuJ55SUKpXtoVnsGJC+aiw3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PNAq/H0S3HEq4KWLXuCL/5lYkuDvN7/6yCN7QZ4/s1Y=;
 b=HiQ8wzQ93StHiXK49P5HLyLeWIci9EQnUQtXHg9PUxrpvJH2oPrI/N2CWPuxKfetrWOZL6VMlUqZqWY7fMvhPqc7iRFTge8FcWmZnwxDIfROulSNIq72MJ31OBJWqsxJdO3Dr+fDnk8+h3ojh5itasGJAtvpMH5r43zNX9lGlEQOwHPuAJv9DQney0BCSBErdv+4r83gNN8SEekZ0nnDNKeN5t7hWZd2yOusJ8b6Kbw2fYL3oZyuqRbkDPIHnb/iULStSOiVIgtkJg814/iRQFqToeekdM42S/pO9YmElrfkLjk02d5GsNGsueQAoQKnlM1Vdh0l0PTWk5aZXRwKvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5073.namprd11.prod.outlook.com (2603:10b6:303:92::23)
 by SA1PR11MB6992.namprd11.prod.outlook.com (2603:10b6:806:2b6::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Wed, 27 May
 2026 21:44:54 +0000
Received: from CO1PR11MB5073.namprd11.prod.outlook.com
 ([fe80::a153:939c:df8c:f4fe]) by CO1PR11MB5073.namprd11.prod.outlook.com
 ([fe80::a153:939c:df8c:f4fe%4]) with mapi id 15.21.0071.011; Wed, 27 May 2026
 21:44:54 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH 2/2] drm/xe: trigger GT reset when a job was never started
Date: Wed, 27 May 2026 17:44:39 -0400
Message-ID: <20260527214437.3891167-4-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260527214437.3891167-3-rodrigo.vivi@intel.com>
References: <20260527214437.3891167-3-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0142.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::27) To CO1PR11MB5073.namprd11.prod.outlook.com
 (2603:10b6:303:92::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5073:EE_|SA1PR11MB6992:EE_
X-MS-Office365-Filtering-Correlation-Id: 98d11296-eaf6-4230-283f-08debc393066
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|6133799003|22082099003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: Ug4cEoX4A1sPmZSr6p91kSFniFHExgB8mm4D3rJfWW/+pHILjyifGLIFyMFsjiY4fWy5tX/KcTLloCwDppRYRkFjV0wLQo8lBOHu3Z1Zx2Ip155UVFXH6n27OmICFouxaEp6moi7ngJzBd4VxhvfYOcbHU/FjXlOe2tQR+u7uC2pnJJHRGkLp9CtR6cP0FG6aB1BXa5hghlj5VKrkeHeIHuuS+y/+NyBHaW56Fj/ebn4MlF9rxGmUY214MtGL5cie384m8cFoEy6lQIUfduUDFSGANFPZWHunHyO3RWzVgkAxDldge3vbxcvl1jtbkjIGCIhnzbciZcGuUyHYAAJ77Oj2Szj1ZZpMNerJJRHFZEo59EJfDQ6PSqZoGGy3jfjJfvKfTVo2JbQeN/cffaTn8P66kSdD1zcxEOV92EB6RgANBPB4z7g9EITpzPNXhjG6kxRzEaJlW4HM7pBx6mFyxfbVeGji+GtmpUKobcD5q3TbufIHvnxIFzO9lN2aoZtP24lTPBfgxtEbbLNHdzltNDhwHICrJGBaVga15NfjWtMpi/mVoW+eCcJGUsfWhxfdbjQkNMyUzHV6p/ZKlYsH5o4aJ4Jnf5SRMeTP0mn3MB2E/2LcpXUgTNDd2GLFBh3NEeExsg2VvEbDrCry/lwaJSMkXkxXOBw7hQWXXw8vRbk/6Vt3g9tBrYVL9Q0DP8L
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5073.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(6133799003)(22082099003)(18002099003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wZmSMAjfx4CIfAPzo1c82zKquXqA59tR3s8IW8GKlac3WYvQE06BqPtChLCe?=
 =?us-ascii?Q?lGgW6aUM/KwqsTkRe5uo3VGH1fw2Ax8Pe+sxAZRyZ4fOH78N6uFx03ibGzYj?=
 =?us-ascii?Q?xWS9/BOvGHN55j+PqiKGkRSa2zoEbNpUoTMZK40FP0Xtwzr2/CZvx5hk0JOu?=
 =?us-ascii?Q?7EvNy6+AFwK9sGFi6C2rNyS1gTIg5vcs2+wOV1dFv94amb+GP0dTA9GATqYo?=
 =?us-ascii?Q?o/0++Ja+3hYEXk6cuHG7SL0MalP6yL5akUtnVviUYx1BA4BEv1hF6FdpI+vR?=
 =?us-ascii?Q?OeLHqEGJ2WWWJo3edHCy7ewLn8OOkOyUW+HUTQSnJ1ns+az218/iinng7s9N?=
 =?us-ascii?Q?8nxWJAMZdITVMvRdCSFiBLY5vRZsebWZPkrWJ+vPGlgZkIhRqW08TEC26umU?=
 =?us-ascii?Q?pk2oUdjKvyovw9Cjmvi/cujNwadj79PM7xTUP5OXa2CzRN3uk55J2pil4/Zf?=
 =?us-ascii?Q?qSb9sPc32itNJ5htXSrR4k8R+SKogK2yRKp4B63jt0YMqn8Pkzi3Vs4cxpTw?=
 =?us-ascii?Q?dLUx9syXzwZJWeyfr5Tvmaw3BPKK1jRJ7BgU+612ryDIkvrJMaZp0nSi4SX3?=
 =?us-ascii?Q?a7hGs4e2f4mUlzz8HJlFfwABxZ3l+GcaFfSzPC4VFH2PEwJBGHKeJBRRlk7g?=
 =?us-ascii?Q?gleWaFNxl2sc4HiB/3lVyYTMFdCzJC8EL4ePQb2ebeh7PcNxAG/XtADCrrpg?=
 =?us-ascii?Q?mB+jgek8Z+WJJh7AjzQfz/BrjlEOIvzSAXfuKcERsP1xG9JmYklbrN4Jv4d9?=
 =?us-ascii?Q?xupEnfDbLb4pCrm3yd6niY9rxQAhalPIcKhDzVlwDHfjGQKYgwpIIDEnmjFa?=
 =?us-ascii?Q?lH6K00XrkWp9HosdX9czBCTNWdhBHkWVz7JNQPCjj+3N6ra3K1rF7BNOs7xa?=
 =?us-ascii?Q?sAq4zWcYtLI8HKuHTJ3kNh/GVccQcjlTqbcXFnIaHpPSZfhUee1um4XFoH1N?=
 =?us-ascii?Q?iGBSURGxmCPkoPwyFXkrof8EGdWebNHBm53Im1svR0RfE0hw24bVQl3P+g5l?=
 =?us-ascii?Q?gxuAxH7jHhoTLtspXYsKFHUsEsZ4E4dsG39h0YebQcjkwj88ha+1tJ3LM6MG?=
 =?us-ascii?Q?5RtILAwODqlzy6aUFHGGNr4ZlbdzNU49cSVg9qe9KST3HwAo/ExE+22jLgCP?=
 =?us-ascii?Q?T1TBAcATMHjgqUNNVPvAy3lBG6ibN8+b5pcOBeTOCLfL7QIX4AxwPJdfBJXI?=
 =?us-ascii?Q?+usNl+GJ5dcmpWg1HYY9YCEbSW8dvqBsjXuCHgHBKknLwFmeJkGW+Y15Cpnb?=
 =?us-ascii?Q?9fW0zf6gxaoxvHJJ9+WTi2tLZGO2rD4TyXyL+PS8h46Fhw77dYBQmV1qIXAT?=
 =?us-ascii?Q?FpFDLrZeqYib4g5+YnOOQmHY3QaRY54fIN2FIJ09nxzCAZgfgtaS16f49N0q?=
 =?us-ascii?Q?zKhwSCSb5LY0pHK345UsaEBvIcl8k9iu3hlIOLyl8eZAL3rFU0F0oekF1TD3?=
 =?us-ascii?Q?uZIPDT/jkqSJ4ToI8I0xkcxNacZGuwL0kRX2v+6Qdgsucd6l0OMaGqQ9t5cC?=
 =?us-ascii?Q?E0A35x4u3Qm9/Avx0ds1en9PP361FqeWWox+XZxeX86HONkSD6LaFlr/x3es?=
 =?us-ascii?Q?O/RiAp+rPb/YkN1umIvsshDkjJ7ue7gCu5RycJdfQIFAA9HZ4PgUnDQWgIqG?=
 =?us-ascii?Q?yVyZHFl+VE4D79UIJBMMiVW+5j9cjrTcD1YUNM4ecpcPtxDfDWT3A75k+1Tj?=
 =?us-ascii?Q?3eFCViHBAMXojClGEbaW7X4Q7Htwhzqs2LvLq96blJH1si1Dl42kPSgLc5qc?=
 =?us-ascii?Q?i79J02DUfw=3D=3D?=
X-Exchange-RoutingPolicyChecked: cqfuFIPVPV8K1/2Ect+StKtW+oNVpON+Q8Zvo4ZgwhDYWfLqqMQj8maKTOCgmgTMnjzIP7FF8/qArJKu98bgvs07y/7PwGnr9SZ0B2odqKfurEJqk6xE8lyzWFhSXF08Vg5DQWV46ZeJi8q37fnCRsMCkXwBrX0fki6l+WGeyyO4ywKMgZBBg8QChMAa+WhyAG3FCsTyZtIor+zri4q3Y/LH0Eu8bWRo4HjRWmudEj+XQoQcM13WUxpcuNrR4inWmuLOKBmWMdH1DD6CrT0SyH/ypBBNEVuzqy5bTJ15JhcyDkegWaWS2C9CscrYRQkGbjsuyU+zndGnbfAOfBjopQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 98d11296-eaf6-4230-283f-08debc393066
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5073.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2026 21:44:54.6150 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JtBpq6yzAnSuLoiPlkhoKftvv65/bxvrmOyIecgyYXn249ZozgcF1XYIqj1Iy1+JHwCi38ZRb9Ca6vbcanroeQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6992
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

When check_timeout() detected a job was never started, it consumed the
job's karma counter via xe_sched_invalidate_job() before returning.
By the time it returned true, the karma was already exhausted, so the
outer recovery gate in guc_exec_queue_timedout_job() skipped
xe_gt_reset_async() entirely and just errored out the job.

A job that was never started means GuC did not schedule it despite the
queue being healthy - the right response is a GT reset, not a silent
timeout.  Return true directly so that the outer recovery logic drives
the response: up to two GT reset attempts before giving up.

Assisted-by: GitHub-Copilot:claude-sonnet-4.6
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index ab501513d806..c2c91ed84276 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1375,8 +1375,8 @@ static bool check_timeout(struct xe_exec_queue *q, struct xe_sched_job *job)
 		xe_gt_warn(gt, "Check job timeout: seqno=%u, lrc_seqno=%u, guc_id=%d, not started",
 			   xe_sched_job_seqno(job), xe_sched_job_lrc_seqno(job),
 			   q->guc->id);
-
-		return xe_sched_invalidate_job(job, 2);
+		/* GuC never scheduled this job - let the caller trigger a GT reset. */
+		return true;
 	}
 
 	ctx_timestamp = lower_32_bits(xe_lrc_timestamp(q->lrc[0]));
-- 
2.54.0

