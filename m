Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4282DC4167B
	for <intel-xe@archiver.kernel.org>; Mon, 11 Dec 2023 14:41:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1405F10E10B;
	Mon, 11 Dec 2023 14:41:32 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4FCD10E10B
 for <intel-xe@lists.freedesktop.org>; Mon, 11 Dec 2023 14:41:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702305690; x=1733841690;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=EAvxt8ktWCgMFcCRD80XMcFCss30ew24X624limJr+A=;
 b=HCGa5UWog3riQsfk5uQpKL3YGmXOrsgFUrvn4TtLQuDqKUEJmItB7iEz
 5eWLL/GwAs/h+HOMQOQ24ifGKi0efORRspEP/cxQNvIpTTO6RAbPGy83e
 h9jMhgGZLSiwYGUJ7d28heYPH9bU866td4dyqiV4DDyb4oBq0IASJ9BXb
 zYWqE6q8+JXtEdLdJVbnu1/4SJ2ry8GxFFOE5vHDJJFGqmgj7FQpL7s9N
 Wen6LEgAGwJHkAZoFHPpo8zs6fE1vyOhVWRnC+ab0NT6WCwD8YXDsQJGC
 YCdjCakVnq5wbg8KvQcoog97RRF2d+65+IASjkbBE/lhm4s6nHebygZru w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="379651030"
X-IronPort-AV: E=Sophos;i="6.04,268,1695711600"; d="scan'208";a="379651030"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2023 06:41:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="722827412"
X-IronPort-AV: E=Sophos;i="6.04,268,1695711600"; d="scan'208";a="722827412"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Dec 2023 06:41:28 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 11 Dec 2023 06:41:27 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 11 Dec 2023 06:41:27 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 11 Dec 2023 06:41:27 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 11 Dec 2023 06:41:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FGQaKjbT6eXW4wM7zYznnSPqzYuvJDPXF6CsKj0r4hs9raGHZl4ra3c4K/mB3s6E6LPjwQPA4R4XLPOg3/zmYmJyZaseTUMRsBp8OjLsI/C6G+bMqzSjBzy63oyLiHehQMzVHzzEkbhp+V/0fLPIdEqxwjay6tPTBERErr2S7oJFlnEJ6NhLzWCTDehw/zkDbSt2OO5aCHB+2QD6riPOVbEoxEUxQGt5uKO9jWZFOqQx/HLFQeS41bl/4nz7DkS1GrV42gZDk8t1UO3uqD/aGe9+9A4VK/t7p+yU0NG5d7itUehuJl8m0c3+rSDZY8ytN+jAXdtG0kHfrHCpeGQtLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EAvxt8ktWCgMFcCRD80XMcFCss30ew24X624limJr+A=;
 b=X0pUDvbEnFWWfjee6kpzvm8mwYlWA2Twvk/9bRvVujcEAgfG9Jfy5IjjY8YHt9c1NlrBDQQhpEiGGmo5dvypA5tVK0V572CH2Ro25f0LUhC05Pm65EVvZgkhHyH4P/+ccirWnqy5MPZ5c48QZJt4HSyhq1iJodgm7dfXi6GIFZgY/keOFouXYOKxAnQJ7J59GbIcVJP/Zty7e/oBxGpnaq8LyfGO23N2gi9V06pzuxlPDYGO1fTE4kJvdFsQ78N1+qZDMeAOjvpY8uTdNZjX25hnylC0VrTcsejlLS3y2NBhf0tnwRqH7ORTeeYw4p8KLLAlyV0wlYVfKVYurgtrYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DS0PR11MB8764.namprd11.prod.outlook.com (2603:10b6:8:192::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.32; Mon, 11 Dec
 2023 14:41:20 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b%4]) with mapi id 15.20.7068.031; Mon, 11 Dec 2023
 14:41:20 +0000
Date: Mon, 11 Dec 2023 08:41:16 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH 2/3] fixup! drm/xe: Introduce a new DRM driver for Intel
 GPUs
Message-ID: <pyl7x4zq5cqjhdif3mns47ocfc36hf7szp4d2lg64pgdzn7zs7@2simw43uchy7>
References: <20231208171316.901795-1-rodrigo.vivi@intel.com>
 <20231208171316.901795-3-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20231208171316.901795-3-rodrigo.vivi@intel.com>
X-ClientProxiedBy: SJ0PR03CA0178.namprd03.prod.outlook.com
 (2603:10b6:a03:338::33) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DS0PR11MB8764:EE_
X-MS-Office365-Filtering-Correlation-Id: b5ad0b2c-f30e-4064-3f5c-08dbfa573d1b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lU36cunzLN1rYRDlxwCqbwSA7TTETZxSHqsIXujH7udlp30cb+xDAr4B6diZWqAZ/4loqs7OXBXZD7WDy7lkg06Jg9kaTMIhWFKbMGTowvKS8bmrJXnLlp8KY3GhLqMTZlS9rdkqpv+yf5Bquqxhc5j7N18btPNay8leOBxwuccmIDGJ4BjiLsYReZCRyLayCzYcrm7UgtJ7I9RAo2LMoKstrKcorbS/fOq5687gWJ/5M/JK7ylwuFJ+NC4EkRwUF39LEw0G5sULZsrikHcpXf6WekdmNp2gs4EEvtfyr6kSfmkxHrTKyXhUOxXiAnaRRjpzOrFAXvwsZBoa4LBHkb0eFN9Rgx3rB6f001GcvB+527ZpshO/m7BA+oE+BKgj7cwTRqHqgc3Ontv9cxUy/nASs+6obulfjHmOYeCfn5aLXdYmOu/D4uYHKpu9dsigs51XqCQroEveJLGEPokvd5LmRvPSUwHTWcqcyRWqcXorjTaiLZgvcR7ZX/KalsFbB48ZjfSdV2tggDsC6VFFzUubi0OYm9Tr0krgDVozC6JcXgd93PHODsx4UWnJvbdB
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(376002)(39860400002)(346002)(136003)(396003)(366004)(230922051799003)(1800799012)(186009)(64100799003)(451199024)(2906002)(41300700001)(33716001)(38100700002)(558084003)(86362001)(82960400001)(9686003)(6512007)(26005)(478600001)(6666004)(6486002)(6506007)(6862004)(4326008)(5660300002)(6636002)(316002)(66556008)(66476007)(66946007)(8676002)(8936002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?L404LsqGBPox+ldi6imVX5DZQ6hBLq5+2wiSo3pDc/BFzhU7Wj0cgChyGnxX?=
 =?us-ascii?Q?zd0zVISA6vUbcBS5r1/zWE9eD8m9Ou+Cly4kW/IEDbefLjUTJcVGW9mXLaFi?=
 =?us-ascii?Q?Eicg4UYE8r19jVpUUAntvZFtbQhRPGuRxzNJuIhSnEkocjSkfpFZYPbl9DF1?=
 =?us-ascii?Q?zSEYVWlg3lF4OW7o+NYeA6cVJO+5tpMmxLf8ug9VmBIQGJFM5Pptg+WTQj1q?=
 =?us-ascii?Q?AdjlZPK8XRD7eysq8A0BcF8jObmxe71nBlrI7FkcCLfGvivabdjrvzfCjbDq?=
 =?us-ascii?Q?0RMr5uxuIQY4ddm3lnmr2YV/BMG2hDC08ShDn+YOfp0dPQLO8HyABBRb4C3t?=
 =?us-ascii?Q?d8VH/Z4mxE5U3D88rA4TO/PW/lP8+J2OEe7hkwTS4Aog7YHsqbfePfMhUr7V?=
 =?us-ascii?Q?wAWObFwzE7qfMdr5S58hqOowzx9XLZXxuAA7nc9DB125gCthBwZbz/FgVOrC?=
 =?us-ascii?Q?jzKg+U3M0KCshya2JlwCh/s9RDWjmHaK0DccnUkx/bw6GjJ78eMRM3g2ElcB?=
 =?us-ascii?Q?bbHIywja5e1rMcCRyAt4wxqEZAKm6+ukcaGGCA5x7203wxwIjZNMfe6k8oVe?=
 =?us-ascii?Q?Mxl9PKJ2XdSxE/quUkU0ywHyLfQY+1sPcPrbJM7p087Xip77CaVqLA8k70nr?=
 =?us-ascii?Q?bKHyQiphbcXlNW9gwykg3/Wocrz3jnljw80ce01Zv4aWVMOgYUqejlxsDSGx?=
 =?us-ascii?Q?04eunQQr3YI+cxkfZMGvPHR+u/f7MhMnGW7Qg/hZFuVtUgy6F161EH3G1zyU?=
 =?us-ascii?Q?pzcbShVd/K4RjLB6BLiTLMTMzrFQIn4JAWiZcnphcK9V4HfBChlZWsHPAWFE?=
 =?us-ascii?Q?31M6lAZzmWOcc9vonNBXyXboLSQePWTejJRF6rI5mTOSdd5MPa+lpNPO/wPh?=
 =?us-ascii?Q?8key1KHE3F3B8Y7HW0vjJzmLoeEmIFPhVNB6ECXt9OUi4u0Mbu+v6D1whCoa?=
 =?us-ascii?Q?fQGg/xhZZ5P+/eHBEoX3x3hZCFIYIAugChZU/9DxP/VMbrc7LbPkn6gxm+Wd?=
 =?us-ascii?Q?Bp8ZyzEMPeAgVuLjgalJxAKVxy8W2vHo08qxHyf3tvo9zoaUSyjg1Qy64sYz?=
 =?us-ascii?Q?8EWOO+kyh01NoxFpV8ap8pvw8TRS17jNQOkJLv0UCIslTX9N2zWc15gD/EJx?=
 =?us-ascii?Q?SEfHRQ+Tk1+pEazxdKz1NI2Hr05IkcrIWzR94aTdGJyFlXBEt4MoQlILtppS?=
 =?us-ascii?Q?zkSScs00SBQge9G2TlgVYG6UYesRNCtlIWIakiI62ijvZi54Ww/ISErXv25d?=
 =?us-ascii?Q?giKaLdzy9U+9hMStzjrudAIlUWnKlDU+P4mEH89YyBMXoyfJLw3n2R6+ferU?=
 =?us-ascii?Q?prkr6gZMC7dvZqMTMqjw+r8BLWYUj8l3BxumaBsUvIW76lDDrL3XRJmgC984?=
 =?us-ascii?Q?1293oxUV7bkfcCmoJHNBR8Rlvv8q3hMWHkoS5VD7jOyvlpF3WG8iYgbKYGbO?=
 =?us-ascii?Q?yR9F2jev2xeeaEOOf0sjxBq1FJgoexhJRBrAORQl0Ncl3G7auJkG1Vh/GsV0?=
 =?us-ascii?Q?C6NG1TB2UmMZ8WFedxQQHYYYDnc53kPVeGXaRZdnNwul37a8zClXhVPLNSAL?=
 =?us-ascii?Q?VKHpT1ggY1BXQUyAuP4ZBd3gcBVPm1pMjUicpARF8hF0CJiQDDeDgKoZ/mX2?=
 =?us-ascii?Q?Ag=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b5ad0b2c-f30e-4064-3f5c-08dbfa573d1b
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2023 14:41:19.9105 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ErFxs6U6A3Mwq4stJUnod+/VQl3d4rIEblBOk0Ktb9dsewG+JkDti/iSab6fIDxkF40tAV2iIO6AV3mtvBm0xd5Cq3ZiLhFwqH+p0MY8pM8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8764
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
Cc: intel-xe@lists.freedesktop.org, daniel.vetter@ffwll.ch
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Dec 08, 2023 at 12:11:05PM -0500, Rodrigo Vivi wrote:
>Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>


Acked-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi
