Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8740C3600B
	for <intel-xe@archiver.kernel.org>; Mon, 31 Mar 2025 15:00:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EC5110E415;
	Mon, 31 Mar 2025 15:00:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZM2ckhQC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3762510E415
 for <intel-xe@lists.freedesktop.org>; Mon, 31 Mar 2025 14:59:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743433200; x=1774969200;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=6gX3HD/dMGBDwfS0BIBoOyzmMJDEn048NUDN4DzWFc8=;
 b=ZM2ckhQCYIS927por1fsJ3HRD9R/lTnQ6Cx1/K9ehli1aOmH34uKRhLJ
 8t8sdbHvbN/YR3JBqsjp5RqmZvayPkvT1DHKgFle6GUavlQvCiFD7Y3Sd
 dydLOyEJueTeQrXuFUNqu3xKWoHBNhPYn8a0VqueyRgzrWaPrMqAG7l98
 guprk6j+eUvucVVg0Oz5Aj+4HVj23lHvjFe+jLn3n2LKTRSAM6gSqg6fu
 SMvbIxX8ofcvjjH1zsOqTgNPZrInrE4XJ4myrnb2CntXI6ybxyMIZUZ2o
 SKcRMZ6GLQEppUmAkkuYyrVDxe/12FnZ6MF+jh8q1xRPkA3P8YudpKKCa g==;
X-CSE-ConnectionGUID: cXwel8IHTMe1I6521Ro/ww==
X-CSE-MsgGUID: JZpGw+EPQvCaP27OXxLnTQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11390"; a="48507666"
X-IronPort-AV: E=Sophos;i="6.14,290,1736841600"; d="scan'208";a="48507666"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2025 07:59:59 -0700
X-CSE-ConnectionGUID: qU/X8GDMRFiYP22kkFL8ow==
X-CSE-MsgGUID: BoN2welqQNWQRY3pmDBx1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,290,1736841600"; d="scan'208";a="130225995"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2025 07:59:59 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 31 Mar 2025 07:59:58 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 31 Mar 2025 07:59:58 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.172)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 31 Mar 2025 07:59:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VhzYtyS4PtbK+RFnOiuKyvxJjmFgrggUyPuQqn9Z2Y385X8aV0UEXYy1vB7WzV/w6yp3Aosmaudl0dN2iKAFm1ORa08+ugH+XN3+cN+2jVusu5m4PoOToPFYOupaUothJtQ5wWBJ6I3ZdSaLzXaKaexkU0YHd4o+0Upvmqvjhr1wTQColzdhakPhMvcRhMFl9CYajjzD70LuqZsdjUVNvIrcfJLOFjIR1Dptjx93qsTqSmCjfDew1cLve2MsFrrI5lpJp7hOjNpsqvAhkmqdCLtK5nE5rrTu2YcQ4MB+tjjN74x7wQIycogTesjy7PwubL0IWiAoenq4RIzyh0ZpBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K2NbBZlELuQlFxByIFwuNeKxLBy/0eIp8ESTAqTdkmc=;
 b=AvRvPDbFbmcKPo4SrzcSGFASLhh7tY1y1d/HqvNdJsPhSvPcg33++rfJfsioFYqnyoOFeSyqiZDetacsojAvnmPaJ9Q9BsdzCHDZti0YUXLadYOcYizF0zdLrEcakZZxgGmGuAZJiJGGBS3CFIKTUI8Rsn4mG47vZtfLHCNDzL+ptvH5ybMYukNNvX1jHnw1XxwCjlKUl0ChtvRM8QtHbKy4HvHWk2C3bP4Usi8mgMNbiQYEQkR/qomhBIWn20DtI/3a/7241z3HVw6cit+RfrdUUdUO3GR0dkmnFYenP48MDcS5H+faeU/DnHO4draLbof3lbExu78N5dKcwDz8EA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CY8PR11MB6987.namprd11.prod.outlook.com (2603:10b6:930:55::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Mon, 31 Mar
 2025 14:59:55 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%3]) with mapi id 15.20.8534.045; Mon, 31 Mar 2025
 14:59:55 +0000
Date: Mon, 31 Mar 2025 09:59:47 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Dan Carpenter <dan.carpenter@linaro.org>
Subject: Re: [PATCH] drm/xe: Restore EIO errno return when GuC PC start fails
Message-ID: <uqd24yuordxfvtpdwnyhod6g2khshwg7kpzha4oqnnuzmkko2k@v255sredurwi>
References: <20250328181752.26677-1-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250328181752.26677-1-rodrigo.vivi@intel.com>
X-ClientProxiedBy: MW4PR03CA0061.namprd03.prod.outlook.com
 (2603:10b6:303:b6::6) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CY8PR11MB6987:EE_
X-MS-Office365-Filtering-Correlation-Id: c2294f11-53ea-4262-71d1-08dd7064b2a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?iD/6HHYgws5dxMPCxdLO2TfXxgxJEQzA7L70bzQKGL8Z9OHUinwlbtlmswel?=
 =?us-ascii?Q?puEnm4JyFDqvMJHRkan/sVxrKAt4oPgPjB3xto6n/JOq3S0X9s9eutTILNUz?=
 =?us-ascii?Q?Nx7Og/aJKRnyvYgPWZJAs5wC9Qa9jPbdpnb9g2iqB3tkHVtWkc+Y1oRUbrZ8?=
 =?us-ascii?Q?tXeMVp2Vo2GRsxJPs/MMhXk+++qvgs9jmQvUqvMK5qdAKieQaXebCC2kyt1e?=
 =?us-ascii?Q?FUp/A0p1HJQ0BjBOC884nqWKxVmHTsraD9+xOVrNvcdzb9G0GRgZCBp3PhN/?=
 =?us-ascii?Q?yFKMPlnpyz76wzhZjM+mE43gObdjP2R54xqhXzQjPd7zrA/LlWsMjkMOvHRL?=
 =?us-ascii?Q?3Zz6e/UdJjNgcjHvu3nm+fgVJos4iqPPEdcK+E1VSfYYCbZ34hGFnuzCfj1I?=
 =?us-ascii?Q?wMTjCX0aTwUa2zZSHJ6auOJGkPcqbVDw83UbZO9tVU6rz43NRNy3C0UqY8yQ?=
 =?us-ascii?Q?rg+e8G3gjDyx4jpJ0aEtlW72Y6LoqdDj43BHNfEOatxPknkEa7QiHqF3Y260?=
 =?us-ascii?Q?/Uau6M+aAYBMIZEgOE0k6vH8qialvvJCJ5E5KjlLKJTU0EO1QImP5p38c5JM?=
 =?us-ascii?Q?JF7cIAF9XXhhIeaffl96Fg/jzatzoz2G31K5VW3oK1Fqi4QrS35hX/EWWdZl?=
 =?us-ascii?Q?cRskgkoodTbLlJsECPCkepUpwsHaQdjFoCcfkYiq00l6mV7Xkdf3fanEvvKN?=
 =?us-ascii?Q?yWEH+AoRYNBrKr9Pbt6kA2HdXuq006gp5Cy35L3OnSXr11ArS2yxgEigKVZU?=
 =?us-ascii?Q?C3TojVmzTounS0UVYXo0S9OOSO0pe5amC6KYR0gGxC9fx5MlwBG2vKNSOup6?=
 =?us-ascii?Q?G2PaQrda4kREG9Lc2q2GBYnv/aYcdwIcHqfCr+ZTI7loCJa3fMT4f1Xrrk6k?=
 =?us-ascii?Q?urwSu5RNHePKEnkU6rJzaB2bfhwtBHvLvT7AKxmmgCkiEj6Mt7B+gMB1BaCH?=
 =?us-ascii?Q?SmagMJMAe2V1AzRt2AixmyjZigWxwqRJi9I35OOvzOSAXmIPw/SjpuzGJK7m?=
 =?us-ascii?Q?XWh2KR8fm4xsAKUSibNjUjk5NVXDzm83fSyKktTdA7aqU8UisVD4IhnVlkvN?=
 =?us-ascii?Q?7p5RH84L+5Ay3xqVRozkaxzNY3C2pacHVYNp1R2Sm2iQgaDit6yJ9nM65ZO1?=
 =?us-ascii?Q?p4n9+3iTxzQQZV075DwpjZZrb4ygBv26kPzbh3mlDMpWsGFDXXAr074ovIR2?=
 =?us-ascii?Q?VpZB9MPETlB7xZkiHWQUJHRPsQQWrljGlLDgHsEnTteDWKbTW3lEwxj14G7h?=
 =?us-ascii?Q?4OaswTVeSvRo0svkxsXx8JrJi1kjcchBGQGZF0qWiaKgnYfHgzh/a3yrJzYz?=
 =?us-ascii?Q?S5V/1t8VvEYZMXWD39YJx3KobCKLSahgLyuVNXszqdCOhZrQ2f8HSSFYvY+o?=
 =?us-ascii?Q?h9UvSzhO255Mc9pGO+/vfN6emaAW?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PSov3FIlVtuv7Kv/jqgDfhl+4WbaJYfDjJhXhJK3sP+3F+xa7G0ud7XYyYWs?=
 =?us-ascii?Q?gOp8xQTe1zfStcehJimbZGJHvTQnAVdQFOrm57Rpzfryidh0zULNCUynVpHQ?=
 =?us-ascii?Q?4FBuRAnr0f0Mv81rI5uSMA3rvYjrBmVxaOuWum2rJaaFNk3aiaYJmbtxY3dA?=
 =?us-ascii?Q?QsBzxs2V2E6TsvBr6tADszqtLQ7hzxtEdUQBOQHXz9OwK2WNXoR8KihhXu18?=
 =?us-ascii?Q?aNeUpVDMgnr7UqZojqgSBFT6my6iSxhfDMYUgl+QUfwq35pTSWSGwhR/Jod0?=
 =?us-ascii?Q?D0jh+tjhFyWZjAnjvIIRwDvKcgebmewih/xWo16QgcHLQxPbZMpii/HdMrr/?=
 =?us-ascii?Q?8GZ/w0n6gxriEFgw3n7IBHgT0jnpKhnpU+IsH27VB3WFsbLkk0c+PE+TudS8?=
 =?us-ascii?Q?EUUERmFfnSuvFYDrFLHx56bOi9bcYXiesPPr99Ctt5UZhFxxdf7j5DFA2obx?=
 =?us-ascii?Q?7zRLBr5/9TGiTyJe1hTGdbfUW9k/J9FD+B7tD/McrLVNaVraY7BaSFvj8EE9?=
 =?us-ascii?Q?yZKm7Kyme5cTNVBAOHsMih/D/uQMGFyUpPL7Ep+fyMdpRE8OyZSZxvIwiFKb?=
 =?us-ascii?Q?mYwgAloVGoSKGG8VDVOSkL16vKtIpPdSyjSd0eGL3Z9y9gWfU7U8DUY+FH0O?=
 =?us-ascii?Q?IjM+cFiPefwWns1fqkSg4tCi6SL4/QSMyHQUqOHbO1f9kEg06JWdQDwKtBV6?=
 =?us-ascii?Q?F5vwhE9i9D5jOKeoSyYzP5cWnHHuT8YTlt58cFNzxL4fNhv6YQo7nkuiWhey?=
 =?us-ascii?Q?PT+YsgKPfZQ79eM905WTS9UhdDa8WOfbT8yquHCqjIPugPjQwKKWEORsL+zk?=
 =?us-ascii?Q?Odrz1yTQwb+V5HhcVHufJ/gpBw5z22xfw3Hjvq5ymIdEbe7IKEfNghuyD8Yw?=
 =?us-ascii?Q?yjb4cuM+W9TDJU1mru4M2KAk5gDGhqt1pHcU85h+YWesZIWja2YAMIKS4sun?=
 =?us-ascii?Q?0o5g7SrrMTNilRH8MhSx62jw2bjBdNynoVFZa4FFvMAKeR1PaMNclSVppBAc?=
 =?us-ascii?Q?ev81UamEih2Iu+0MP1CMFVAZL6sOv4idBPKwvgLfTZ/U82DDDZrBK/cuVgpV?=
 =?us-ascii?Q?Bj5UtkWqLFo9IdnvuS2K4b9/vyPAqNksEw3Q69/w8JwIYXrsPzIrUPESkmSQ?=
 =?us-ascii?Q?qPTnDLLEQ07fMOtiwfMoJmRBCEMspKpRlWxPI0MBTaN68Vew/AOtWNke5/KS?=
 =?us-ascii?Q?kEse/JwSW9Y4hzGpX+IrC6PbIXRwamWv9fPDk2iDuYJdZWEZPywD9z91Yg66?=
 =?us-ascii?Q?x/bb4Yq9d8UpjNfwGnp1B408qa7bkYIrE3XwQNSzat0gwV6VSD+/J6VwY6A/?=
 =?us-ascii?Q?EG8AVlLb0jrsHyWwqRY7QLZTS9j+xfYaoAo+n38H2AcmxXLesc7k0I0Ykx1Q?=
 =?us-ascii?Q?LTR0xksoFdBkw5gjuXzqPLUyClWldkjpPeDs51CIv1TqDT7VnF87qxtNNN3F?=
 =?us-ascii?Q?wudLvobS7wjM202GJuMWTE88dAhbIsVxLzmgrKJL32QeKz+tagnsqMYTGLO5?=
 =?us-ascii?Q?xBCqkZKnP3lfEAQgBfrK3P5sRec/0058bmaPVaHlSMHOEZzMhnKU6J5q9Oc2?=
 =?us-ascii?Q?DFc10zY6GmJxWlSP5IJXbm+cYsNAZE+UEkaowk0b2FbYsEQ21b+PAKK47n9M?=
 =?us-ascii?Q?jw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c2294f11-53ea-4262-71d1-08dd7064b2a8
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2025 14:59:55.4895 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: claNIG9m45eI5JfMYsDvOAU1hXh7KzkB8iViBpwg0eifYyRblnMw3nd+ZQqyipc4xHDoTZfS1xMCOcgkpl7csu8EDNM2egaB3xZ1pZqXGi8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6987
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

On Fri, Mar 28, 2025 at 02:17:52PM -0400, Rodrigo Vivi wrote:
>Commit b4b05e53b550 ("drm/xe/guc_pc: Retry and wait longer for GuC PC
>start") from Mar 7, 2025 (linux-next), leads to the following Smatch

	^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

these are not needed as the commit referenced is simply in our
drm-xe-next branch (and if it wasn't, then this fix would probably not
go through drm-xe).

>static checker warning:
>
>        drivers/gpu/drm/xe/xe_guc_pc.c:1073 xe_guc_pc_start()
>        warn: missing error code here? '_dev_err()' failed. 'ret' = '0'
>
>Fixes: b4b05e53b550 ("drm/xe/guc_pc: Retry and wait longer for GuC PC start")
>Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
>Closes: https://lore.kernel.org/intel-xe/1454a5f1-ee18-4df1-a6b2-a4a3dddcd1cb@stanley.mountain/
>Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

>---
> drivers/gpu/drm/xe/xe_guc_pc.c | 1 +
> 1 file changed, 1 insertion(+)
>
>diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
>index 85215313976c..43b1192ba61c 100644
>--- a/drivers/gpu/drm/xe/xe_guc_pc.c
>+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
>@@ -1070,6 +1070,7 @@ int xe_guc_pc_start(struct xe_guc_pc *pc)
> 		if (wait_for_pc_state(pc, SLPC_GLOBAL_STATE_RUNNING,
> 				      SLPC_RESET_EXTENDED_TIMEOUT_MS)) {
> 			xe_gt_err(gt, "GuC PC Start failed: Dynamic GT frequency control and GT sleep states are now disabled.\n");
>+			ret = -EIO;
> 			goto out;
> 		}
>
>-- 
>2.49.0
>
