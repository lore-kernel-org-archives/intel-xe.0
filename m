Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21828C282C5
	for <intel-xe@archiver.kernel.org>; Sat,  1 Mar 2025 00:56:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF71510E0C9;
	Sat,  1 Mar 2025 00:56:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U37KBuan";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35A8210E0C9
 for <intel-xe@lists.freedesktop.org>; Sat,  1 Mar 2025 00:56:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740790564; x=1772326564;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=YNmuLA0Jgeaij6as7aX/FnCW9V4Q6CrXK5oMVslhKsw=;
 b=U37KBuanTsT/jP+y4M/x0dyFQe68rrp3pdUbngizAV1ka1UJh4jz/JwB
 bzS8shetORUh2uCvbL8z2JfagdGLmRZhTMu5f10LtNFZq5NpYsj243rV+
 3uldfDdJROoL6alke0LETEFIzzQZf2h7FAFO3QNW0+WWQi97ZJ+uN/Qk+
 jegvjQrtXxNNmq7f7lPiRUBztB/iso0OJ2aLbNn6d4elqXYAivsiL3ySz
 0wAA8hKOGnS4nWPuIbw+Hq+JJuc2mP1McFIqYpVRiA5EX+AgRFo5E6jR5
 vWK8ePb9G3lbeiL8kimQ5b3mDhoBCy5AfpwvPHfyNRIulUplVVKfM/ZGR A==;
X-CSE-ConnectionGUID: 7eQgxzeSSsS+h0cdm7fKVg==
X-CSE-MsgGUID: +b3yrCX/Qce3sBalMa736Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11359"; a="41433508"
X-IronPort-AV: E=Sophos;i="6.13,323,1732608000"; d="scan'208";a="41433508"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2025 16:56:04 -0800
X-CSE-ConnectionGUID: yk8/1bgBRL+VvKlAhwayQA==
X-CSE-MsgGUID: D44w72PuR/ez3SKR/dqXqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="117994072"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2025 16:56:03 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 28 Feb 2025 16:56:01 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 28 Feb 2025 16:56:01 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 28 Feb 2025 16:55:43 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ahNQSPeOL9sn0I0rSfGW7CAqt4vxyooqy5bL6krl8F93n65uMxqLsZGFuqknRwid9PCIyrChyS90urynR1ECtqr/YGESgCSYYOoI+//nHzRVr/8D8/6yS4kEtj1bcEib/jfoP0E1Zjhresye9GwwBTyqUQ8Pc8s79O93iWZc9NHxImlOakjE+zcg3ljY0F1APdXrg+PgvspCXBeEAcy0enQ1W06jYITAI8VqOboj14h+/VmU9gnAMc6KFLUhr8NLAdTa8QNILZRnyJCGfQiXsyNELlsM69CMNdIAGIKJ0hWfBpsb2mtJiVITXpyzJvShUwg3tQz4YLnNV1LjOjH03g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KcLW+jHDSXEm6PkInPB1XAT7HY6M2inMMSiEf6QFGWY=;
 b=hblYkVSaBO6qIDmM1dYigr2QrsJErJH30KDLs3UUPzhLc/xiKPF7IRQG2KGGTQ7kBY1HUmbBA+BwEd4Wxyi1Ieeu+1+FYrUTIc43OpYQwaf5vslW7Oxzaxuoka2hEyy+h6lm3892WBsFXwenNKMjnEv3oYsy3m233tGeXeQAqNkhvFcv0dfN4CXrhkuNc0j13Uj7GZl67dZgjrG5RRlxB9OCA38bwrXNKImsa2Zlagwnyg0JH1AU3/Ej3DyB2FVLTCR6hWfUnKOUDSsx0zqgjCXwRcvWQse01V/tRptd4IHs+geqL+9o2LNKGdKwUW1LLrhwCHrmkkcWlPmrBO8luQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CY8PR11MB6868.namprd11.prod.outlook.com (2603:10b6:930:5c::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.18; Sat, 1 Mar
 2025 00:55:36 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%3]) with mapi id 15.20.8489.018; Sat, 1 Mar 2025
 00:55:36 +0000
Date: Fri, 28 Feb 2025 18:55:32 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
CC: <intel-xe@lists.freedesktop.org>, <kernel-dev@igalia.com>, Matt Roper
 <matthew.d.roper@intel.com>, Gustavo Sousa <gustavo.sousa@intel.com>
Subject: Re: [PATCH 2/5] drm/xe/xelp: Move Wa_16011163337 from tunings to
 workarounds
Message-ID: <ejudzwrvycianqerwozy3d4jxpe7c7kshijwpljsgd55dulus4@74mx6je6yp7l>
References: <20250227101304.46660-1-tvrtko.ursulin@igalia.com>
 <20250227101304.46660-3-tvrtko.ursulin@igalia.com>
 <og3rnaevqomre67vpskvk3xnlmy62ugs6g2nbiille3dvjz66x@vfvoioi3r5x5>
 <15ecdc03-e7ec-41f8-b91d-77a1c6851673@igalia.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <15ecdc03-e7ec-41f8-b91d-77a1c6851673@igalia.com>
X-ClientProxiedBy: MW4PR03CA0155.namprd03.prod.outlook.com
 (2603:10b6:303:8d::10) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CY8PR11MB6868:EE_
X-MS-Office365-Filtering-Correlation-Id: c1a4313c-7405-429d-1526-08dd585bc6dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?ldvkRCHG3IUq6DGZ7tnL4jEivwo89ekqZCoB2SBT9ZVVFeMIzTg9IsaS9a?=
 =?iso-8859-1?Q?hgEkarCPoeWQSneRdJ9LmB++tYCTYC7eo2D7NSMYD4JOfkBCG/+ySY8Jpd?=
 =?iso-8859-1?Q?aa9Rb4GJRuKoSU1xH/RV4imuggmuHYRiH8BhNQ5/ca7CC4b4cqW9AlMqKF?=
 =?iso-8859-1?Q?HhduH0bFLZjiWqnXZa4h29TpOX3Fa7vK9x4o3feuvEd8ce1vYHTAVwV9d5?=
 =?iso-8859-1?Q?xmw/1/B6d8VSBux89413NvllcvxPqfRWYGO11c3pT/L3SqFbCqqZjlxO9c?=
 =?iso-8859-1?Q?XGbZhTxWhhtyMGIDw10Pp9+2BNro9+iPNCfLqX/fP7JPraQqfHjvPfRpOC?=
 =?iso-8859-1?Q?kbmgTD9kHtMPHYiMsoOM4XyHhRkhlVMom0eKe+nP6m7WLVjJeTQdYU/CRN?=
 =?iso-8859-1?Q?4ebdH9DOlpVQAyon9NVb4DgBFDFYQEafenrp8YtVB+uN5SWiyw7kupH2tc?=
 =?iso-8859-1?Q?yxtaC3MO3Lpnj+KvFYAr7IVHyvcjewLJE4pC1E9DX7v42Vl9Ss0SAef/C0?=
 =?iso-8859-1?Q?LaSQSVoK5zIx5o70VU0NgYgfIq6cSECweyfivo4spLyFGZzOLHEi2QAaW0?=
 =?iso-8859-1?Q?CrFj/8xGgYjJ+EkhwjfDPRDeXHcdNO+mjKY/XlZGvRkISBJbTwXiYxaVrJ?=
 =?iso-8859-1?Q?DcX+YCkDWLrzuSNopftVt6Jbli3OiH326I4k2PL8QeCSsytUhFxqozbzND?=
 =?iso-8859-1?Q?ToVQYiVBO1PjH8tNv//vTAgDkgaaU0nRdAOAjXer/vM1HwOqtjqqWRlzVe?=
 =?iso-8859-1?Q?gqUmIGiozD1Kw/1WXMRLm6dV0Es0R/JqRcIpxAFlSFgVAeOfP1dCUgkZpD?=
 =?iso-8859-1?Q?nemk00a6kjXnupLTBkcKrxqz17lm4ecJcxcSowB7DUECiT1j2MVRSD8Uty?=
 =?iso-8859-1?Q?6Ot83DaxDEFoumk4SD9kynGyz9RNUdwWVv+kwTTBJgdMiBFEgZOmg77kSK?=
 =?iso-8859-1?Q?+egHQFx5liF0DNfnFkGaIM2CjwM4edABDwSfwvQIrVbAvKl5E60Ut5FeoV?=
 =?iso-8859-1?Q?TpbayEAg8ID9zgbaAQ+ekvvvrnF1JBYkFEGDXaBE3XyFcwGHpQrcGGvkpM?=
 =?iso-8859-1?Q?I5H/9uQl0yvMc528bX9lIHOhmN87sCefQ7Vn5zjoczpRUxWfcdgyZUZF2h?=
 =?iso-8859-1?Q?atTzlt+CVo87angaSwGKAPxMRBsvcb+na1BE5pNM6ekVD/c5U53lPicESO?=
 =?iso-8859-1?Q?Z5k55lnWN1PLjZFmBiNT75eetCnp9RwmEfNcytAMRHdPD5jPoNOe43GFLw?=
 =?iso-8859-1?Q?APvX1q4HIu3OI33/94VItBn3dBcZgYMCimh7s9UL09q7YprKJpH5Sk/u5r?=
 =?iso-8859-1?Q?eEqSZeRIfigktbRgRUSNG+b6WD7kgCyTc59fqnJO+GJqo9XvAKmrBW5nUb?=
 =?iso-8859-1?Q?oiYjiE4fDiSiJDhgw4dR9GsLCSzJchXhisUi5mafRl8EzadCnXrDQmgGAM?=
 =?iso-8859-1?Q?qqau4DiBnV8xc+MP?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?B01GIQIVUx2XxC8SK9LjcycNRTt+CmK1CtbxBZEwZdGXvnMwuTH6CyGz3Y?=
 =?iso-8859-1?Q?mE05v6PMeZb/WOOP2LevCWKv5gqesJZYEnIqHbLsbKVlEsawcMPQ9B+hYS?=
 =?iso-8859-1?Q?4RmvFpkIwOVm+B18gE/tCy5Cxog+zQCO5UYmKw7ONQXColr+KwOi2vhNEi?=
 =?iso-8859-1?Q?4/5+mjkh8sm0aaUtdeaaAs1QAPNaCB5fF5VNp1dCcdmpTB//TCB2F6MeQw?=
 =?iso-8859-1?Q?v7qmSspvwbCGNMgBAmN8MXoTb9Ulpu2K4uJK162Hb3xcEUa2bR6NuBbAv7?=
 =?iso-8859-1?Q?6erBBnF7PgYLDSi3txDxaNlkngH2iExEKSDZQEoA0gtvCTCJoR/IU0FFa2?=
 =?iso-8859-1?Q?LuLGQIUhj7sJyQ+L5ZNcbyXG6ojdXQVyZuX2P7+yzcMz06DhWAbHHOOgjk?=
 =?iso-8859-1?Q?wbam/g0U2yuccmbzwuZ918+wPGQ+EkSCfTv0xgCw1nM5PBBTkASerHHDy4?=
 =?iso-8859-1?Q?1tL2KZAW0ucpV6dq2ZTjwja73ei6cqfSMJ4gEgFT8cEM3Rjd12jXD9JAzj?=
 =?iso-8859-1?Q?vn6FcYHaNVKycQtHAbEfb6nnyf6kUQHpvmRP8y1b0c+q6Z0LQ3eArmToHF?=
 =?iso-8859-1?Q?SCC/cJG7gGQ1PgPFPMMgoTs+0GSbTS/YNfTYO7BEBMgqYatl8nxw4OXm2c?=
 =?iso-8859-1?Q?QwoxgPmrJs5lC2GYcv7XUsiRwbcC6pmAfEswNW5fWXRuqHjW3SnFFUaDcK?=
 =?iso-8859-1?Q?s1++7uRUl50w/TBCWOjMgVEHXydX38mc5VCePENkSJirT4Vws+QE/S5Fu3?=
 =?iso-8859-1?Q?W9gPxPuVnPlhHnGlErCS3Oj2+RyKCN7BKzwffmqquETu4yeKpMgRxElXl4?=
 =?iso-8859-1?Q?Mb2LNuMKeRYc8/kXWosBYnwFsy2+HLA9mGr+U5WnGBLr5Y4PpWltHIYB+z?=
 =?iso-8859-1?Q?WrjNCaaKMHrEWawrEO/vkJrHMDHYy2csQEckSIlF76UBtKIGlrBQUDyxne?=
 =?iso-8859-1?Q?Wjg+inWQtLs1FyxRrHve68sIxD0SktaYCeG2tWWLwLTa7aMqgMj+UemAcs?=
 =?iso-8859-1?Q?MXkA8vxt/SDaNKCPizypxF8cKnC2o9xUQAg3rwSTpAUCSj9/mpbn09xyDE?=
 =?iso-8859-1?Q?1ww1mx2iTtgxjsLiaTnusOq9W/1Vvp87G5lQ2DFZeUZSAm9UHuJT5/Ry83?=
 =?iso-8859-1?Q?kUc+FKS54XIyEWVrit9bytAAy2dSKjsMYul1TSfSa/i2ouCuQYu9wB3zXw?=
 =?iso-8859-1?Q?oNoeX7Whw71Q14cWjmtGjsWtuduMlHkAETG0TRzddUJDZ0rR8lpXo/biQ7?=
 =?iso-8859-1?Q?upocW9O5+biEHaSBUFVNee8nR+Z4NyBe0/E9uFMkxxLKwOJdYVRBZxenAB?=
 =?iso-8859-1?Q?kj0aSO2stYVCVQ501cQ0q2bT/QiAMGcDzh4gYUvyLtEETqkOmcG8FB0lew?=
 =?iso-8859-1?Q?Fpzso9dNgYSJISFJZ57NkCX8aLYvIU1P2t0rW4SBlLnLiI5gsg8+MH/05+?=
 =?iso-8859-1?Q?umUfWApdw8PpN/IKdjIvlxKVT8QJ/PhFA409qLgS3DxUYNTNUrU0Fr1m/W?=
 =?iso-8859-1?Q?8nmpNCGBntiAJSsmS8FN1eaQ02WI3Xr1Na8Rt7p4is6YOfvHaLiy9ZTR7T?=
 =?iso-8859-1?Q?g2O9yk7fc+FYO7RdQ0hFj0YAQ2CaQVpwj+S8Nu35AxBuRsJZ5AYYIcANdW?=
 =?iso-8859-1?Q?bcL9+zlppLuaX6VzLOeJUGtEvGozb5GL406G+QSAmS/sdzrV6Wcu/rmw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c1a4313c-7405-429d-1526-08dd585bc6dd
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2025 00:55:36.0171 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9sVF8D3ivcVAFd3bOdN/N1lQb0mU6Er39Q1YcQkSbZ1dsWS9CiDtostYiQgLZOeskxDWE6YzXQbWpyb4XvQGh34ujFYm9W/YzttmdJSFq4o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6868
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

On Fri, Feb 28, 2025 at 08:08:27AM +0000, Tvrtko Ursulin wrote:
>
>On 27/02/2025 20:58, Lucas De Marchi wrote:
>>On Thu, Feb 27, 2025 at 10:13:01AM +0000, Tvrtko Ursulin wrote:
>>>Workaround database specifies 16011163337 as a workaround so lets move it
>>>there.
>>>
>>>Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>>>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>>>Cc: Matt Roper <matthew.d.roper@intel.com>
>>>Cc: Gustavo Sousa <gustavo.sousa@intel.com>
>>>---
>>>drivers/gpu/drm/xe/xe_tuning.c | 8 --------
>>>drivers/gpu/drm/xe/xe_wa.c     | 7 +++++++
>>>2 files changed, 7 insertions(+), 8 deletions(-)
>>>
>>>diff --git a/drivers/gpu/drm/xe/xe_tuning.c b/drivers/gpu/drm/xe/ 
>>>xe_tuning.c
>>>index d449de0fb6ec..3c78f3d71559 100644
>>>--- a/drivers/gpu/drm/xe/xe_tuning.c
>>>+++ b/drivers/gpu/drm/xe/xe_tuning.c
>>>@@ -97,14 +97,6 @@ static const struct xe_rtp_entry_sr 
>>>engine_tunings[] = {
>>>};
>>>
>>>static const struct xe_rtp_entry_sr lrc_tunings[] = {
>>>-    { XE_RTP_NAME("Tuning: ganged timer, also known as 16011163337"),
>>
>>we now lose the infor that we have this tuning implemented, but I'm ok
>>with keeping it only on the WA side.... for newer platforms it's there
>>so this is mostly making the older ones work.
>
>Good point, and I am happy to respin with a reversed description like 
>"16011163337, also known as Ganged timer tuning" or something.

I prefer this version better, thanks

Lucas De Marchi
