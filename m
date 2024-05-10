Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 025BCC25B78
	for <intel-xe@archiver.kernel.org>; Fri, 10 May 2024 12:22:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D0C310E9B8;
	Fri, 10 May 2024 12:22:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jj731tJO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E8C310E6EE;
 Fri, 10 May 2024 12:22:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715343765; x=1746879765;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=3iKxCrxmYld2CkqbioqSe6chkkJePyZlqfp7hqdBwvM=;
 b=jj731tJOEycVA7vhNmW5+UUD8sli1jxoXhMvkCMhhpYh1Nc/pmWooHoR
 YhpNv/diZLdYCC6kXlzL15MnvSrCsPxeQ8bh6u8364/mBAXkO2yGD6qz0
 o/LJ05wD/j4ywDuFSbOFu1eLvxAOwZQg0oual0anFvbicDM1TbKnh3IKX
 CQnpqwMmK0zPglRtzr96Y/Hf6NAvXkYIyUzTAVSn1F2DP1E6tlmC4lYB5
 PhnfinWvU4w358NXNhruiau1LqdLUFFrzgGy++oAf7wwP+pwp35oDU9s8
 f30cvtVLN/SFefIV9anBjZOgFNNcr1QAHg4CH0raD+sZnWQbvVwlzB86p w==;
X-CSE-ConnectionGUID: 7Tv6VFopS8WnEIyAs0rrJw==
X-CSE-MsgGUID: 8YxSsmMJQzCZZXOLJ01n4w==
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="11158154"
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; d="scan'208";a="11158154"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2024 05:22:45 -0700
X-CSE-ConnectionGUID: shvujxrhSSGo64f35zhR1g==
X-CSE-MsgGUID: zgjuKSXRSa+EpiAkti8fiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; d="scan'208";a="60451558"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 May 2024 05:22:45 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 10 May 2024 05:22:44 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 10 May 2024 05:22:44 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 10 May 2024 05:22:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vc+3y1YAYWFQQYXwvhVCjLa2HwOgYHK0ceA0VdgfN/Kuy/eh8pcTxgbub3hbtB4Nt6rYnzFKugMsHHH6OcUKje3vB5MPEVTsBqEteXiOhmiBfMVciugYNt6UgPw96iLJ+GDNz/hBVKRfmwUKN5mc1TOInVJC9rDow0k2Zqe1Z9aEj81jafFYWcbOxOfj6hbTvsK8rdxGdzi4uhXPgrsSktSK2WpXiilzE00oelGVRbTD8vNru/XQG4jSKu049fN/RBpcn7JoJzJBmkFPXZXwfZva1nFASw8UAgRvUofKWkg7Zp5v7EPhXuaWuPs3OF6qBB8g0kMYVfFxv5oKKWChFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FwNE6moSzYFYS7WWCnTyVTmASdCPIhHKI6tif0R9KA8=;
 b=ibAuKW95j8/PKAOKnGRJ+dCM/QYaFVlImzzrQfiOVq28o4C4mhIrnNktpzLkq51swaTjinZyo7ZLwCS7Jupu6ZlK+MyXqtxlBF6BI1V40QJZvwcu5/+48wO+CVHpwwP1PPzbctFxbmeGwbPVqYuhoN0gL/GKuYS/oLKN0igEwCg3KDTRoQozKBbiukugzawlFVZkUhCh8VK/TuTTAZ46FvEgHSlNlF4U5x5WmTMJttxm4aZ6B+A5fNeH7iK0bXXAzDFM97w3RvYnc8pJsl83rOSR0mCpgvzcfrht9Fqqn8tTmS70bLdMY3zx63w8gxHL8uh1JmW9mgvieiOTnE4QSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH0PR11MB4901.namprd11.prod.outlook.com (2603:10b6:510:3a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.48; Fri, 10 May
 2024 12:22:40 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413%5]) with mapi id 15.20.7544.047; Fri, 10 May 2024
 12:22:40 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: <intel-xe@lists.freedesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH i-g-t 2/4] tests/intel/xe_pm: Also disable display for
 mmap_system test
Date: Fri, 10 May 2024 08:22:28 -0400
Message-ID: <20240510122230.724229-2-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240510122230.724229-1-rodrigo.vivi@intel.com>
References: <20240510122230.724229-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MW4PR03CA0272.namprd03.prod.outlook.com
 (2603:10b6:303:b5::7) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH0PR11MB4901:EE_
X-MS-Office365-Filtering-Correlation-Id: aafbe976-0797-45d9-bb9b-08dc70ebe251
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?IS+3Dg0XRUGrID3AqhsBq8F2ZHEdZZ5GyiKFHVpZjdhHQf1a7Y/9miNGg2x7?=
 =?us-ascii?Q?fzPiHEukGARoiOsIlsfavRNzJ4la7lLmrSp7PWiDRahgdeKN/9pVQ5m5RCqO?=
 =?us-ascii?Q?zIJAm6rHtT6/u8XGZFWNnzNy3LJOwV9fLBZ0N971eO1WgrS6sP8wGZwGzxrs?=
 =?us-ascii?Q?Fm+6j7a3+fNn8quSA0ujkUGlSkP6fYHyo0cNbp/f4Ea5Kwg6T9UENbuqGlqh?=
 =?us-ascii?Q?0YuIQYTEc/E+LIPzQb6Ep3Dw9U8gT149U9kCLpF5T6kFgnnvmfIjRnD3WGqm?=
 =?us-ascii?Q?Fo+PQ3pJkTJm6egWrGyyfGijRxprj0r1DOFqhF8bqDoQ7lBvMHR6HCON/8vA?=
 =?us-ascii?Q?m+yH4egUu0W/YKcgWRd1qFOPCzIJH5/ODOStt5chuz0QDkE8j5LKo0pKq/4T?=
 =?us-ascii?Q?e5pX7qEJ9hqXCrHVEA6TQ3dzDFOcg0yqa17bw07JdrXC4yeArp7qPbYBXhOY?=
 =?us-ascii?Q?w6uuEioDnWvjD+ApDb2dQn87CcbfaxPSKAiNAIzGFh/XHJK4Yj2CaPLq6dkF?=
 =?us-ascii?Q?lwlCQoC/D39ICxijVR5efwPhZ+1mfFJQNpChftdhf5gs7OPxnRsBHifdtqz3?=
 =?us-ascii?Q?Van0nfScEmNFbpNaxatexSNGInsDQQjdaXe+jS818UjmAq9iSYE0RwWX6Mdp?=
 =?us-ascii?Q?IyVtkYyqT/+SviOoQaAo6nZwA5TS2VK3w5WjdDuo7g4MPRNzvjl5gJ3H7wD7?=
 =?us-ascii?Q?4mVLHSgnD8rX8sCqMNCGQtrESQ08Ik4r1Eruj1EzHQIVBGzmhiqMuou5tBiw?=
 =?us-ascii?Q?Ybjje9V3/63wfGVmtjXMj7nwkix4cGiPqSgNlRhMb4McWVDH6is5SokAG2OG?=
 =?us-ascii?Q?4/2MtBYPsiujmN82c+Yuc8/zuLhV3oIP4fnszFh3PnhrDYWz7xFsDhHpJjp1?=
 =?us-ascii?Q?jwHlJ4k+dDMarta74f1JQbiAItwa3bVJEq7J08FPLvHGtmnHb7UXB5ChH1IZ?=
 =?us-ascii?Q?Zds5IR2naTf/shQMl344A5A9r8AQJK+rTaTB1mQWXMNC5TdasouZE7yqpne0?=
 =?us-ascii?Q?bMbSWYPjaoe4sG1ICjVP262NJ0ynXSp3Ql6Ov9MrVsHSZrFkN4QeUUqH2txl?=
 =?us-ascii?Q?O6z0V3bB9Jo6y0dNeh33ZtzDA4YYJuLaE82hTVSxaLvl97TnauCmi+Nyrv/h?=
 =?us-ascii?Q?rQcGSEcaxUK+eDoOjl6Kbf69f6JnXPuPdo5L7lx0LCFEYRQqvAFZp2EsFFsd?=
 =?us-ascii?Q?fH4+KRjQI0fnLfyTgLab4QXluU1H5h2KDXGW2nOWS7euCpTN7btdNXXtP6nC?=
 =?us-ascii?Q?6nckgOsK3lFg5wFmx9UqGGKkHCwSQdTsgokEESUBaQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qWPXAri+LVmtGbIerIk2lTdPjzHx/CtDcslXzVIZgR29y9bBNnNogId1b2fY?=
 =?us-ascii?Q?5Q114aNwKAJENkJB1WzpQXocTQwp88MLi3TFvdKLVJ9W48U/XuJ8/cXY8w5N?=
 =?us-ascii?Q?ysdhzoYgr8R5GTUZ3u/rcUTKQIjePZl7CIZLcF8+nopiPu7Cni1L71bOCI2w?=
 =?us-ascii?Q?eyk0bxwV2gw+wXdnpW31rzmRRUmHmByQmueKmoUZs4BJrpKCtLayk8remTgr?=
 =?us-ascii?Q?PtDf+WsTzhLvqCiJ6X3KTDl8UGZptGuJL/Lepv6SKX6nzvY7E7tLOZWKNlli?=
 =?us-ascii?Q?6xB/JZkDZlYbzSvTx1emCoWLPBDAAMUO5qnqJlV+lgtus91T3E8rjqVEEnqb?=
 =?us-ascii?Q?pnr0UlQ5Xjd1kcHsxvOlL7MyGIXQzUozI5gxrNSU58VuIyQY2tguyyA0PJTR?=
 =?us-ascii?Q?UPHmu6Tmv4QoOOU1ZenTmfDbrbYzuq45/jIqpKCaDo4dgXgyavdbKZAj2xSF?=
 =?us-ascii?Q?P3T9PrtkBGVP2+uZAaXih6ZVVXVsKFvReoYZwUeyf8LGZrqr0iO5AUfCxy1B?=
 =?us-ascii?Q?H1KIK2kURqsm2SLGjA4cTyBcNYzFyDU5Howxc5CakW/xxTOfHR/HmPqYS0RR?=
 =?us-ascii?Q?V2p1KN3O0gOQQrOn7NeXSx/E5fOKhOBqecD5/K22GFSfBFrPVEXSAzNTHdVp?=
 =?us-ascii?Q?i12JBLeiNuHD+A5ros0SKiL6M8Dk2LIofe9ydqYYHHwfkSJ0mzZmRtpuV66h?=
 =?us-ascii?Q?HDyXs4ddiJUDJP32kjPc6SPfIb7MrkGW6ASYhIG+KwMixn3zrv3nyPpz2Bbj?=
 =?us-ascii?Q?Y0czAoP+N8BSadfTjVXHwgq8SY4EQc0EOfK9SmPnUHXNf9ZNc+nDjba81rRd?=
 =?us-ascii?Q?k2q7m+94e+HBPn+Ma4H9e3t2qOSWXCKZXxAZzRHSyG+PEObDA/744AG0QGj4?=
 =?us-ascii?Q?xovz25TPrpgeUSrbD2ePhrghSiILLvVfTv+prvKWzMc+IQanU54lUGRSRJP3?=
 =?us-ascii?Q?zG+WjFXsvCVMcM4OAJEaDHsdmXVzXq5hUi8danZMbt/OkyGjVpS/zIUkxs1U?=
 =?us-ascii?Q?HhBEGs1Xaz9YZxwIV+gBJVo9WP1KfvwlNp9ytRkjW8oWKrkc1vAvadS243rz?=
 =?us-ascii?Q?2vwuSVjeqp283afVH9r9LcE07dmY6WEAdQjV0igvKtsEQ+qjvlA6Lu3tnVdH?=
 =?us-ascii?Q?/gYXGYrn4UDtjHkjKQ/56/XynISR1naykjqJ3RGc/663TDkP9N/xT5Fi7BTs?=
 =?us-ascii?Q?wYxWSuxTwh6QuMmiwNNSupMVNDRfJ7TgCjSaOSrbviEBW6xm39bpge64OMUH?=
 =?us-ascii?Q?xdpwba0YEzjykapy9Q97PzZXi/fTRuvC9/TzbU4rqbI8wD+cgJfWifyBox+p?=
 =?us-ascii?Q?kXiCIeSlqmnOe4FPbs18od9xkSvuYwpFXIjZ1TeTSr8Uv2burmQnBxHDOmzl?=
 =?us-ascii?Q?zHkyN7EyWfXEPJsAHlOg0ngdLHCAzn/PgdEySw+3npFE6QWA9N6505/BofxI?=
 =?us-ascii?Q?NfVUyQuqbXykK455d48sL6HsaX+aMXp8mNmi1Fao9fKGGRleTrZlxMlJSC0k?=
 =?us-ascii?Q?oHhLtIHk1nr6rPeXj9CD3lF9glo9esruEPPy/syUQjuBWfbxfms0Lq2S2xoO?=
 =?us-ascii?Q?FzN2/muk3Cbf7Ns42D0IduApjWd+ZV6rPRqEsH5TXEGVV5V3D6lPVJ4wOW8Z?=
 =?us-ascii?Q?ng=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: aafbe976-0797-45d9-bb9b-08dc70ebe251
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2024 12:22:39.8260 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uVzq/SuE0S55ryVkvQpRoGEANo8jyhxhMlLjgIgnwFlc3zDs1pABV3h54pbl0TNaOEYsN7pmBiXy3lVD3kEz6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4901
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

If display is enabled, the always-on components will always
keeps runtime pm references, unless you put DPMS_OFF.

Cc: Francois Dugast <francois.dugast@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 tests/intel/xe_pm.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
index 3f963bd9b..72d484163 100644
--- a/tests/intel/xe_pm.c
+++ b/tests/intel/xe_pm.c
@@ -780,7 +780,9 @@ igt_main
 		igt_describe("Validate mmap memory mappings with system region,"
 			     "when device along with parent bridge in d3");
 		igt_subtest("d3-mmap-system") {
+			dpms_on_off(device, DRM_MODE_DPMS_OFF);
 			test_mmap(device, system_memory(device.fd_xe), 0);
+			dpms_on_off(device, DRM_MODE_DPMS_ON);
 		}
 
 		igt_describe("Validate mmap memory mappings with vram region,"
-- 
2.44.0

