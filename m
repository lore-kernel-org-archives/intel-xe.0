Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15C26C4332F
	for <intel-xe@archiver.kernel.org>; Mon, 11 Dec 2023 22:41:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAC8B10E51B;
	Mon, 11 Dec 2023 22:41:21 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FC6810E51B
 for <intel-xe@lists.freedesktop.org>; Mon, 11 Dec 2023 22:41:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702334479; x=1733870479;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=vZ5kNRRjHe7sMX+FgeUnqrBZARCkyG5I+R9Zj65QWwc=;
 b=JE7b+ELFyT7O8Wo/7/l1wg14UAYcLmK4jz3V8v7zepKGxZkyB0HU3R2X
 VKUi+aTUmfC5YODx/YTb2ODHZaDi/wkF7/vIPmv5AYe0jitAGpCNKm0ek
 gdR6pihfaEQ/SwQpEfmo7l4aqwZM+3c5FKIKbUsuvADJEKSdDlHBWg4pK
 R12Rh4BWQYWXhZsjuK0Hr7aHAJDMyvwSHBoS2iLsfH6DWngj5gY3a/ryX
 tY4DaXihJ23e/As/j1R5mXFhFAMUo64SokzrwcawlkftITOJ1GZoXFbkJ
 RNFYZJeU7y/9CNg8Y3NNQ51FB6jSwCi6elYyKDL6Yb71LkrESBbkgTZ4J Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="461197155"
X-IronPort-AV: E=Sophos;i="6.04,268,1695711600"; d="scan'208";a="461197155"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2023 14:41:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="722986848"
X-IronPort-AV: E=Sophos;i="6.04,268,1695711600"; d="scan'208";a="722986848"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Dec 2023 14:41:19 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 11 Dec 2023 14:41:18 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 11 Dec 2023 14:41:18 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 11 Dec 2023 14:41:18 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 11 Dec 2023 14:41:17 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gflHdI3zG/IpPA3r7gojZRWy/MGOz+9oqDewaHvckTAe0d974EJdkB2kdDVHzuZSJce1U3mpRbKKqIn63e4qfIrTmvseG/C3ty8557R8i6HKk8Fs9njLnTy1qXDxMvCsBKs1diEaLb1sfibqKhuwrwAJg+aY8jwbxz6Zfgwd5NxrKx0CTGob2mM0VyCwywjADMxrLeSUHl9agtGncnAqWZPHn1J5QEsioVsHYtl5Rep26GKD157z1N0w8dsuAGwSyVzBGtmi2Sb4R9tX6mCT6R+Fh6NgNJGZyj0kqSJzIOCdOqkBputhr0U4mHcXtwOCgnBKJtEd+Xc3CAVp2qZeDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=owePf1mmdPJfCMysKuTzP2NbP9H69Bk0CVYsXcF8ES0=;
 b=iuPp7ixkknn7ymEI5kXXyXbjXYjBxub1oeb7vfTyEVswgSetniZ1W1Hg2OFqpi44JT16z5beDRzEdxQUaD+uqOpjW/EKxZG2NvNCkeconlmtiRmzdQ2WcoNuEuqTcZwEtJ900sIimrRqy40XqJMFQyPD2+w2tqwSZdPgCsRSVby/XXxOijiutmwA7w8s3cbiizbz2JBrXRZR96EZvyP43AzRE+W2CYn+csg53FeC+zZlpd4ovIIdkpcwj4jz2FCUdJNmc8LZDVWPDy++ClGuXkGnUu91KMCO+mw3FJ7ddmc4plnrTFuAAPl65ygq/wGe++VHtv7LXCP2tOQ/ZwP2BA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by DS7PR11MB7806.namprd11.prod.outlook.com (2603:10b6:8:db::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.32; Mon, 11 Dec
 2023 22:41:15 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::4f1d:17b5:88b5:76b0]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::4f1d:17b5:88b5:76b0%7]) with mapi id 15.20.7068.033; Mon, 11 Dec 2023
 22:41:15 +0000
Date: Mon, 11 Dec 2023 14:41:12 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
Subject: Re: [v3 0/2] Add memory sysfs directory and attributes
Message-ID: <20231211224112.GA1327160@mdroper-desk1.amr.corp.intel.com>
References: <20231207151739.1241374-1-sujaritha.sundaresan@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231207151739.1241374-1-sujaritha.sundaresan@intel.com>
X-ClientProxiedBy: BY5PR17CA0028.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::41) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|DS7PR11MB7806:EE_
X-MS-Office365-Filtering-Correlation-Id: 18742a69-119c-462d-47c8-08dbfa9a4877
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: e1N6IiglXO/ZdWxxi72NLCuMNNqQ0DQsn0QWGikoirn0OoMlxnFmBe/y1qR0DA+vfpRTnm5BJ011OGgzQXlWAnJRWH0Mr3TBWaL66cBOrrYQJFbNeoT5hUkp7u363Ui7gjSX5Rhi6CYMYxnfYQUTWwog2ap0opXo9nWsvICjnZjFsEUKH8+oUC8jLZrV7qFvkYvlSwhZWqiJ8wQLyUhm9ZFXJ9X4sZFPVofHtLBMtO94jOEkkyQBHn7CEyoNybfMG/pWkqNFSlVixvQcQUtcsPITCwxdTNwN4OM0nV+S9eNtqZZ8HwXAVEPzJtD+aQq6VY/seOkGTK2Tdy6zSLSacYOZwPpz76C8g74INpTHmrqSo6fj7eM8LLZeLrQJJho9bq2d3Riv7UMHvdHNLupqOdRNep1/w4ZvYCWwrg3kOpkLGRc5oWmfUIiiYqLwGWcUWz0KKnjd5oV6MHTsuIEHqbp2kOOUSsc5JEq6eccRasTFgENlpWcY7MAb8+900DSEDMSSzmquZeroRfZjOpfDFVgqWBsl/yVpDxNVBAPojedGFA+UbDCXhJjEZDOjdCk7
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(376002)(39860400002)(396003)(136003)(366004)(230922051799003)(186009)(1800799012)(64100799003)(451199024)(4744005)(2906002)(41300700001)(38100700002)(33656002)(86362001)(82960400001)(83380400001)(1076003)(26005)(478600001)(6486002)(6506007)(6666004)(6512007)(4326008)(6862004)(5660300002)(316002)(6636002)(66946007)(66556008)(66476007)(8936002)(8676002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VYaRGpXFVCm+ynJnZdSlKkrOo+wr9brdjQ75E3x9Sip/EC5ru2TR3P0lIC0Y?=
 =?us-ascii?Q?e2NGaTZ9FflR4IBjJenmKjZjEqr2vqDvkQp9/pdV2hNhrdwlH1koGaCyHW6L?=
 =?us-ascii?Q?E8vLXLqAiMTqP6AhquTWb6XLd3w6qa30sA9TxsE6DnrwreTWMMfRK87OKYMq?=
 =?us-ascii?Q?FGd/HJUtMfFKTS4wIVolE2YGdjdB8qaETcwQpPeDisjfCU7kbZWDBlWStOmP?=
 =?us-ascii?Q?FiO/RwglhinMDpS8Yz6q5pvEO2f7lpPa1hqgax5KT5ZtbxLNI5tS8ClH/iKv?=
 =?us-ascii?Q?FD5Nr+R+E+fK5aMqOhQqrdQbxEHlZcnOIc3cTEpR1Z53rzRGAcYHMOWFvLX1?=
 =?us-ascii?Q?VIu22Zw3hsWFA4v54hHzhExIIIEC5v6l74ba53TaQyFgu4NUbbk6prM9wBKk?=
 =?us-ascii?Q?Lepqy4hC1q96vxwckLk6cbWpZm7+VXhbVImuQyKip5YdyIkyeKZwaEidDB/q?=
 =?us-ascii?Q?JE5DjCIR77iT92Z9Tba5Zbh1Z05rrb8VszuXjX8YcmK/MtME5TspXWipMjrm?=
 =?us-ascii?Q?nVRYOKV1fKuMYZ2fIlhvHWBHqPAD1m/yQmmA2jI/AnENi249x3dwTba8uUsk?=
 =?us-ascii?Q?Nhb0lKPwunpVEcfo0YDYr56TbLfoLwmbnL68PU0b96qJYUnBV0+leD+MJBVM?=
 =?us-ascii?Q?vcHRv2XFD8oPPbwwpwzOdnWfU1QYYgUu3Gu/s6eO5OVtKPBKUW95mgM6VP0H?=
 =?us-ascii?Q?lwwAOysb975en9rlZosdO3GzaZ+UKxSWIupfpm9176uNhLN11YoSjPnRl7AI?=
 =?us-ascii?Q?BfFgpCG2EAlBcfUuSoXAqC9O+nttTiYJzwSw4NvycvKoIptof8Kcyf6dqEEX?=
 =?us-ascii?Q?yFivfXVZbZWJgfkoyIMmlqr5lXswiYeOEdwktnBTiDYfdy6ExchGBvgVLQWn?=
 =?us-ascii?Q?qzgDBANxv9Ee0sWLIHbE2TJLg+aVp6E1B+WwPp94UZ18CtMSl0o1iDZ8QQME?=
 =?us-ascii?Q?AgPEb/bBAWRX7iaVOWiUp624SMJ1FznqK5n5cglU3zCkibXMdo4lZ8GXUj51?=
 =?us-ascii?Q?94uacKrO/FcC1Kg0uzC/N82oSotWU2BCtGyG+0Fjmvru7KiAWBcO50Ah+/4Y?=
 =?us-ascii?Q?BaSkSpeAJioBwOM4RHJi6Xue5EiFHH6Jd37nZ/NS1LPnrw/NzD7Fwk2S9ceO?=
 =?us-ascii?Q?CYqGB/GTDGEbPVnWGJtGYwhKxF/dRz3uBB0VJ0PU9edBp8LB63CgX2FCy1SH?=
 =?us-ascii?Q?APN4+j6AEjVQMb93KfwutVAac8/0KhBBo+Qg/+XOM0ZGirmtu8hEsV4/ky1m?=
 =?us-ascii?Q?QCOHSig3yqsp+61tF4BK4ZFFZFR6X9Gwz/kC1BsmD1OYwarmNI7UGZyU1NIz?=
 =?us-ascii?Q?TtzkwnfgAY1azYXqA6BJseD/r0zpiCANNVV0dTLlWHtRz19/JCfVyLpA7GpX?=
 =?us-ascii?Q?CpZfBgH07WU+dZOyAG77Yd+twnpfMaGn5vYtJa0uC4j2dJHAeRIx8E06M67I?=
 =?us-ascii?Q?Yb63V3Dtdx0braa3XNzdexjyCW66vhiN81ZvkS/rN2HEQMDgWGWFeCKwZ7OC?=
 =?us-ascii?Q?uyvL3EPGx7h4oD5cHFO/QdrMlC5HBuKhTKLAC2TN2QFknoK5nYZrRqUzGp2C?=
 =?us-ascii?Q?B+JswcCY9mbMCqBVGDYbb8eY5tD8K4aeMDYdyxpINZ7rGN3IsyDNIKT1CgMg?=
 =?us-ascii?Q?ZQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 18742a69-119c-462d-47c8-08dbfa9a4877
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2023 22:41:15.5631 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PzOBWvIU1mZqPAYIVp4i8jRxksugosa8aIIV8jkluwNvU2XTj6yoBANcjDgWISg6oaWCTb9LPgb065ISeMnlaqpVTw3kn9VhKk41rho4CDQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7806
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Dec 07, 2023 at 08:47:37PM +0530, Sujaritha Sundaresan wrote:
> Create another layer of sub directories to clean up memory/vram
> related sysfs path. Additionally, introduce the vram frequency sysfs 
> under a the new path.

What's the userspace consumer of this uAPI?  How will this wind up
getting used in a real-world software stack?  Isn't stuff like the
memory size already returned via the query interface?


Matt

> 
> Sujaritha Sundaresan (2):
>   drm/xe: Add a new memory directory under tile
>   drm/xe: Add vram frequency sysfs attributes
> 
>  drivers/gpu/drm/xe/xe_pcode_api.h  |   8 +++
>  drivers/gpu/drm/xe/xe_tile_sysfs.c | 101 +++++++++++++++++++++++++++--
>  2 files changed, 104 insertions(+), 5 deletions(-)
> 
> -- 
> 2.25.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
