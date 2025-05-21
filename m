Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20B85C2D0CD
	for <intel-xe@archiver.kernel.org>; Wed, 21 May 2025 17:05:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1D3D10EC95;
	Wed, 21 May 2025 16:58:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eL4wSgGQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA8CA14BA87
 for <intel-xe@lists.freedesktop.org>; Wed, 21 May 2025 16:52:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747846379; x=1779382379;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=ahmHulOR2/gz+yx0r4cP+fQNi9ejlB6tXcs+XeU2v3w=;
 b=eL4wSgGQh/DkfubV4ELfVi5vy+OKhfTDL/XWZBRjXTl93muRQbpNc49j
 zvtrGVz+rv6QNDMY5WwAH9XJwFQuQaw2UHnUAK1HakRrG+bmYENV/isZn
 0+mqA5RxMuzyxdF+kTmHMSSgvcZMvufyad7zpffbOp9HuIjIjIN9i2XOR
 RD3EmDHhvM2rUPELjZW+/0BM5J5ndcu7V+LG35hT8cqs9CrLSMzVFZljx
 qDt81IDwuK2+hUfYk2dS3wo4mF/hTPZMX6a4nRBC3KUaey6v+zaNwOW2i
 48VpBAg79xQ1ci4wyeWUzC9o8iAKCdXpDde4+o+mQoejsa38l14k8E4WP A==;
X-CSE-ConnectionGUID: 1ZJqUvmuTki//fsoVsErDg==
X-CSE-MsgGUID: H2FZTTExS76oXH/PcWE8Yw==
X-IronPort-AV: E=McAfee;i="6700,10204,11440"; a="49976256"
X-IronPort-AV: E=Sophos;i="6.15,304,1739865600"; d="scan'208";a="49976256"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2025 09:52:58 -0700
X-CSE-ConnectionGUID: pYbZWnBsQ6SFZV8t/kKPwg==
X-CSE-MsgGUID: qDFw/4BXSderJtXNxJ/VVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,304,1739865600"; d="scan'208";a="145293672"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2025 09:52:59 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 21 May 2025 09:52:58 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 21 May 2025 09:52:58 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.175)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Wed, 21 May 2025 09:52:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jG0ZPhL2W71gkiggs4NXIWmjPvIK+4ISXu8Fk+Huo445qd/bkkd6A6UXacyyMeiB5xEal2mzv72RfRs8D25mr3PcCcFT7TLw4nYdVhZUKVirYNuQo5syyWAyRaDnKlNicLXMQrJlXM+6asRtRbbGuOXKtI7bZqx9plsgCzjq/ftCoKKaZDM46IQb2See+pCvNb/HVTNxCBqSHIN0NU9gDUCMmWR2+D/RNTsO3v7g5Nl8NdQ6RLY/E8X2ZyIPQX0D+awXfufXkJ2vnVQWKY51VpoPDfOHamizfSkHqiy3e+0p5Kntk5ax48S04/FUroergUFXpEAc9EuCfHJ94wZXog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D32XhEDRQa/KAS+Wtgu0kJQ7nKTDoNB2AMDmGYUsQiU=;
 b=yz0+JiHODzroCJfLGeyiJbLJju2+Tq19X+U7zF92ZpLQkq6HT3eIchw6DClsv+slW1IDvTlaOKefIxb5LMkh+APSwqKYTfnzhv+NYIC1tUJQ2cNN7hV+VRGlA3QyJnzQwXeSlt94ACcT0fWgxFA2j3dr2jUL4L8T4jxm6y8GEo6/G3+AktCW+pW52UNA2jqqzJ2UD9h7Csh4oqYgwzY1i8A3paVlWRhYOKwMGGGAgOTcOnGHAN59wziKmQvN5E/YUsiyDD2yHnKDeQkJB0VvP8RAsenVfEUlmPqH9JjXfrRedvxtwIa33pROjOHD1xDLXKIvENS/7J7/n2KlRzIXHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by PH7PR11MB5957.namprd11.prod.outlook.com (2603:10b6:510:1e0::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Wed, 21 May
 2025 16:51:54 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.8746.030; Wed, 21 May 2025
 16:51:54 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Vinay Belgaumkar
 <vinay.belgaumkar@intel.com>, Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH 2/2] drm/xe: Add missing documentation of rpa_freq
Date: Wed, 21 May 2025 12:51:48 -0400
Message-ID: <20250521165146.39616-4-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250521165146.39616-3-rodrigo.vivi@intel.com>
References: <20250521165146.39616-3-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR21CA0003.namprd21.prod.outlook.com
 (2603:10b6:a03:114::13) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|PH7PR11MB5957:EE_
X-MS-Office365-Filtering-Correlation-Id: ab97e526-1094-446b-2632-08dd9887ca75
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ASXdT6WtaC+tl7QYbzT7Lzaigq1wyfHeTrBFTnHbip+e4a+z6+lAVHRTKAFm?=
 =?us-ascii?Q?NzXHzzsGHv6yuakX6tiJJJ+adHInYDdpYDztTgKefGkKkTsTjrGsksERBmJP?=
 =?us-ascii?Q?0eWcDBFhBI7wozyEdcGHie4caEocMGXE38662ZgTPV5Hk5qjiZVdV4qW+dhg?=
 =?us-ascii?Q?FT6wnSdZL7SR+3Nf2pSrexesQUf6/al1VzHbLZAFDpoUQrs2radqJamgZ+3z?=
 =?us-ascii?Q?26bVyanQ9MiMCAVddpzYr12AwfNrND9Z0TTw0mwXRw54ahhjkCXxWz6RNzG0?=
 =?us-ascii?Q?PkVHO8Us/Khsnf5Tfy+bbkp2E+65Hj7mXGOSkBqTTRQXttBpunlez+ycTf/Q?=
 =?us-ascii?Q?J8PIufqhJGYTbxRWX3uq+UEHgk5MstbgG8mJYkXCegaLH9lZDHCdWiLzowv2?=
 =?us-ascii?Q?Km86Sh3iioFAM1G2A5pJsLuvoW7IH3rjOdCYyy9H2XKFz2NYYkLzIqSg/Yp5?=
 =?us-ascii?Q?kq8eQwhVJX/vYWMvsSEaLwXgPaIdCYBhkynzpStT1+ifMtLyGQOzLcvWE1K0?=
 =?us-ascii?Q?omIzj8uDd21W02pZWLIQ+wZGcZkPTdGsI9EjPyx74MTqq20dtISEDKGqdxQj?=
 =?us-ascii?Q?E6dkLHJLCultXY1sLEmxCex6wqbyDh9jHeLXUHSdTIPkHH8yKuUXIAnwvUxA?=
 =?us-ascii?Q?rVkQBZWIuvW5Vk8Nrooo01JJZGjTK9IcCAiVZzCIyxnmVXV++c4+bGf3pyAZ?=
 =?us-ascii?Q?mnybaUDoP/dPsGUa9WpY2WDPitO9r+G+2uw6JL9hQihfveI3HPr4K8xTgHZh?=
 =?us-ascii?Q?7mAwOirb68VRLW2e1oeQY+Ck0TwifDGEtYKbng3L7pmwt2p+zsiZahX4qO71?=
 =?us-ascii?Q?M8BCnIZ31kBO0U6UeXhg3hflMzLqAsZi9quP2yxyeqhVoffNTFRu2+bKZc1d?=
 =?us-ascii?Q?UlEBZ5Ss3tb3+BHFrYKB7JHlZhF9rXz3pTfdhGcj6EBxvA24qCbfviCRLtWu?=
 =?us-ascii?Q?5we5OGlA0f8QlUVDj9Z3W1pk164EQ9Z84OJ50MtecY/nzm+vC64Od1JGetNR?=
 =?us-ascii?Q?b1QzakBI5GE7xN4aJ3AFawe+SU/BWZGH+3mC/qjywjE5TAN5dF2HnzBOEc9S?=
 =?us-ascii?Q?UAZTOJqGSc8Kn/YH+mklLsdN+Zhf1ArnvCuAAlCW9iMSE/XAOaMdNckS383K?=
 =?us-ascii?Q?xvABWERXnYRHOVIbQF888EAPm0dOdCvygrSkpxfKe1OfpdB7XwWImNHpDr5E?=
 =?us-ascii?Q?j+DtOujlU8ajXVYwKm6gixRJZtAJlnUYvC+pEK/APSBU3LXad/PQ3kMigZ9z?=
 =?us-ascii?Q?zzjpYuG6evD49Kozn8PdFiprkhwCIonqTQie+ZApiqUOmpbOAtLif7OQnOEf?=
 =?us-ascii?Q?cudGFWMUoBQ3KfO1H/WD07wrzUL3GdJykaqgbdlJObN12GDJdyJeN85w+0CO?=
 =?us-ascii?Q?Kp11SXAK/klPJ71LpJcRibKQ5syPHDxKGsATmSEHoK3IkjpodiQOxDZGP5Qu?=
 =?us-ascii?Q?hqzPDhZ8Khw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gCXRLfue41jrg9aGsaCoY+v5jSEE9Q0+ap8JMR+nQ7mLxgcd+Pg1wW75c9mE?=
 =?us-ascii?Q?zaYVx5M1V/XsLE/EgvBei49t0x+pZK1ICqz/JjyyA+pXHj0z7+PMr5UBjy20?=
 =?us-ascii?Q?6jEscAY5jJ93FWvo0BErapwsaV6NIMvh/usi6tJgRYyL9SeZ7sMhbj1NL4lH?=
 =?us-ascii?Q?purvHS2jcg1A7ikTOAQigCjy9ls3KEJVv90A8MsWShpT+yMyUZvTkIVcbCPq?=
 =?us-ascii?Q?eOn4eJp03Uiz7T4DdTUtP7J4yQSX6LH/rKA6BrWJNisYI+oXWqLW5CKVJda8?=
 =?us-ascii?Q?yhK5wvTbV/Jt+mn8plNqqIhi44Ut0VRhYktKs0rRijYfLWJ+EWcUzLBRgpb5?=
 =?us-ascii?Q?8qhAMTDc21GqSyckFwcaIr03TKP21KkNGODQy8p22YJe1YTTB3a0ADsfjsaO?=
 =?us-ascii?Q?2hJsddZOOQVKd6z8lh67c64EZ8Eurj7s5BBiODlY7G7Nf0GNAg8F9ZG/A8JH?=
 =?us-ascii?Q?O9JRe7dJQVDhQAyIjx3qEGEk1R6sXb6vt5oK4jY5lITXw+JftjBr3N4iLmpW?=
 =?us-ascii?Q?i+YIpAE+lXXJdxMc8IJTbR1c81fT+FYu3TtynK1HjM0mRE8YBez5p0NRe5es?=
 =?us-ascii?Q?ThfQ1ADi8+uxHV9QoBxmAiWdq7rJ91w9/bPNg5jAnP/lV/RespThGP2ycdts?=
 =?us-ascii?Q?bB161zb/sYxaUwuP0r61RlXTardzjNRXRFZdio7fYPxt2cvSR8Nx8Gtx4j91?=
 =?us-ascii?Q?WPIU8V2kRc89bZWDyfJODdP5CXjA6AsXxP/6PvvjnKJ0EBQhJrVh+2Y+LYxd?=
 =?us-ascii?Q?IgUs94/2QEutRYALBo8fwFAE7GZkEp2aB3Iy/evdy3lkz5DXbdj5xNXKbTjn?=
 =?us-ascii?Q?IKDfjL53CXL2fsdAofa+MGh/lwixZH5sYPf53CBY/r+88PB+HRNqbCZGGIHV?=
 =?us-ascii?Q?XpIUkcQLxN1XAQ24Ai0cwIvZnn40umQQL0ldqMbOnsYJS9hVDn5NFMHV0gCC?=
 =?us-ascii?Q?Gfj7I8Zfq9ahozxMmP30dPJJG9ke9dWEFkXvzEYuvke30jj9jYP9bjEr7xla?=
 =?us-ascii?Q?IaJHutKnBcxPj4uox3lsP0jVKDWm9TVtQpe++eE8DkMf6DQkopkjUQF/RMIZ?=
 =?us-ascii?Q?WdUyJ81GLxajbMSct94Sr1TpcIin+EAOS40bRTWONK5yWC/dO0cllpZ28QH4?=
 =?us-ascii?Q?vAyLvevISgNeNgF0Q2fdAkthJZMIdJL0f6px8kc545F4/QiHKiloHN7k5eW0?=
 =?us-ascii?Q?GH1HdgRKFyDendwNonzZ5id7iaDe+aNIDCWe7cxfpYdfqtYHc0tFekiwh6ox?=
 =?us-ascii?Q?YtbFX9mY0mqODUTTEqldeDWv6GKbTqJ8EAvqVIusN4p/VZn5QrpLAqCMMY2e?=
 =?us-ascii?Q?jU9r0Ggd8tnx9MnziTJX2aYQAV7/0FyVmoI9k9W2VgCw/yMQ1SSHXHy4WkDr?=
 =?us-ascii?Q?xCkPlh00Gvf6RW80knXBOJ57FKAM43x83CxMJmHQNyCpiq9xbxV2AE+TlxxD?=
 =?us-ascii?Q?8iaELzdtN0/vsewyAx2pjNiU6gchk3di1wJf65gCZaMYiNchUmISyGq9YglA?=
 =?us-ascii?Q?mvuc6tQbtmmhDfe6PTyC0rkKNEJ5oqU8S3vCQLfcAJBAkY1ovJOXpn9hGKmo?=
 =?us-ascii?Q?atv+cUNIpkciIeuiNKMrS3JHH5UFOz5ZiGRvqO82?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ab97e526-1094-446b-2632-08dd9887ca75
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2025 16:51:54.3683 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ixXzBQ0Q/Yy4hiYjuV7TWETae8KaSpHPa1H2WsLMOpLKU6rODaGhl1S0uPAHqJtfUkloczJ5ms4vBVHwLzieAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5957
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

While at it, already adjust the rpe_freq frequency, to highlight
that both are calculated by PCODE at runtime.

Fixes: c6aac2fa77a3 ("drm/xe: Introduce the RPa information")
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_freq.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_freq.c b/drivers/gpu/drm/xe/xe_gt_freq.c
index 3293d89f1386..60d9354e7dbf 100644
--- a/drivers/gpu/drm/xe/xe_gt_freq.c
+++ b/drivers/gpu/drm/xe/xe_gt_freq.c
@@ -36,7 +36,10 @@
  * - act_freq: The actual resolved frequency decided by PCODE.
  * - cur_freq: The current one requested by GuC PC to the PCODE.
  * - rpn_freq: The Render Performance (RP) N level, which is the minimal one.
+ * - rpa_freq: The Render Performance (RP) A level, which is the achiveable one.
+ *   Calculated by PCODE at runtime based on multiple running conditions
  * - rpe_freq: The Render Performance (RP) E level, which is the efficient one.
+ *   Calculated by PCODE at runtime based on multiple running conditions
  * - rp0_freq: The Render Performance (RP) 0 level, which is the maximum one.
  *
  * device/tile#/gt#/freq0/<item>_freq *read-write* files:
-- 
2.49.0

