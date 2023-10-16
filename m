Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D407CDB465
	for <intel-xe@archiver.kernel.org>; Mon, 16 Oct 2023 16:02:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF5E110E1FF;
	Mon, 16 Oct 2023 16:02:53 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40D7F10E1FF
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Oct 2023 16:02:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697472172; x=1729008172;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Mt4PCzlXBMbDKU+PSrS4raftOX6AxaaLCgH8RbLe7ac=;
 b=VDPkYNSNnHOQI8D2olpaVHdOL/ymtKClPn45SSNy2CpkGqIWFOnUo+B8
 6mgxldAXSRgpfE4F7ypLGUCgDoUQi2G0X7myLUJr5asTq/YQNrS8xNpte
 9j62V/c6wQOZ8PCJGdDc+f4KmK9O3iNRSSIKUTEuTrBLmEQgv6XbPblfP
 XuO/YmgfrNaJV3SR1ubyTDDe6ecZ/gm1bplbWBfGpFlL+C/7Q3vyK6VXd
 59ypJoJhhKYtLA8S1XNjlmVgchNtbcrDxSLvoU50LDInAfdftu0WVYYgF
 QGVYczFPEYfAeT8nVGyjNGyynAq50CEkFJ/BRGrJbT+ZF4MSZ7tpLLU1x w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="471787390"
X-IronPort-AV: E=Sophos;i="6.03,229,1694761200"; d="scan'208";a="471787390"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2023 09:02:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,229,1694761200"; 
   d="scan'208";a="3688143"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Oct 2023 09:02:53 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 16 Oct 2023 09:02:46 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 16 Oct 2023 09:02:39 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Mon, 16 Oct 2023 09:02:39 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Mon, 16 Oct 2023 09:02:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ULgPNaZZzn7CnQiwc5HIbUeVqwqLTWDvU9370uplJXug3OG4ueOLZObgUuN/5s1G2ov5Wy2gdw/v/CpC4Gvs8zEqNfo7mWA0eAoOqOgbGd53fIgWcCB0RQTrRLsOK7DxUz7lsDBrhwznJpd3x0E/LkuIsRKa+Lu/5uEWEFgx+sseyUbXvxWeX7vmMyv4/kvvFcdj519uFdrjXMDaAmt7gzzB3oms9a8FBFN1hLrw981la/yln0Tw+TSRbJiH0HYGMgH1jDkG/CtB56GWbMoRQGDXik7yiCsCdaSiL1lXVOrnqES9yZmn6ZMq5TiPZl4g35RLcB0I5ck8Y/CFChdUYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wpmybor61KCfJ7S5V4mwMYlbjiH02BifAyOkJSnktzo=;
 b=n7PUVpJURu3zZlX9rIVSosOJWbTL0mgeWGZp92eyB8d9BNUkegIT6wD8Pfn35xDqQhlOUKfJ1hQqasqn4iR5/5S69W2r5jPxJFTSqgLx3iQ1jtzwILP5oXTJOWgr9m3hMOnO0NjHkeYrWouWx+PBTE+iHTDL8b9idjBXcqIgSVL8EMQhlWzJ0KxgkIs15T/1tciW8bKfs1XJNXtcbN/5zRILGEzyR52jd2IsxP+TZBIDZHrx6yQOpYKArm0Gu9u3Af1Iv9lVaxgBScThwVm6Xuz6jHgbngSIl5jxTtDWgty+Vv6dRmhV5q1sOiQ+qSfOFcvsSICC8UBw27bRoLAgdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA1PR11MB7040.namprd11.prod.outlook.com (2603:10b6:806:2b7::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.35; Mon, 16 Oct
 2023 16:02:37 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::f345:2318:9a82:51b5]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::f345:2318:9a82:51b5%7]) with mapi id 15.20.6886.034; Mon, 16 Oct 2023
 16:02:37 +0000
Date: Mon, 16 Oct 2023 11:02:35 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <eh6yy3aa74i3i3v4xqmkl7p2rcx2yozxrx72bnunystv2advq4@unppialpwfky>
References: <20231013220250.927876-8-matthew.d.roper@intel.com>
 <20231013220250.927876-13-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20231013220250.927876-13-matthew.d.roper@intel.com>
X-ClientProxiedBy: SJ0PR03CA0287.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::22) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA1PR11MB7040:EE_
X-MS-Office365-Filtering-Correlation-Id: eb54d9bd-98c3-4417-8772-08dbce61512b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DdKhSy/fJ0r/lM9rHAEbs8FvGy5RNPCskUi6uI3IrYt9kMsc0ebqp72FX57WvXuBhZ5841H6SifvHUqXSZ4E8c6+gEFy4xFgP3MWk1iBRD4IgrpmBh/zTUpm1540LDmjZ1P+1dtxud2uveWNKwDf4tAOBz7rqA/jlaM12qJiLvuiSbR/+ms3yLCLSltfPf+bzF/zgOBgR+KPy3cnjO6u/hnhdwNfEJz9YmFWAeWPYC2sQvrv1vYGrfHCrHlVYlS+eX9NAv+CQOT+YF322qOie24xqM93uWnBhanOFOnjJ5+seFEH6BG2mnXEeOpwYcV/ioITbnj/rV/B6iNE0Sa9co7hS9YiaMD3c8ABfSZpqqvycfXfl/PYAIYSc4W0NtG1tgZdYSRj+UpZvmqw69qX/cqECuXdIvm98Do+vNvakP6xOkUT3fqGLrFAwCY4L0U1uOim4iFha9LDMXPvvQZFsH4dmwzqwxwMjGcP+hJaD9W2IyCq+p8uUOKaLsFwf3fW6mWX5iviDTNVyaYAPuZOL1Psp5f4Eli/c81Gnl5fNCfGlPIgmafOBsbPuUKGgG0OaAYul1H5rRjf+zWANnKBhPn7szEcHFP1mmyiJd4ilUDO9gAkn1Rabo4Fgp1/g/e3
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(376002)(366004)(136003)(39860400002)(346002)(396003)(230922051799003)(451199024)(186009)(1800799009)(64100799003)(478600001)(6486002)(66476007)(66946007)(66556008)(6636002)(83380400001)(86362001)(82960400001)(38100700002)(6512007)(9686003)(316002)(33716001)(41300700001)(26005)(6506007)(5660300002)(4744005)(8936002)(8676002)(4326008)(2906002)(6862004)(27256005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tUef7m0eXLcSMH1NWg7gKkQgTsTqeJaWlCJhbSyEqrB/rvyQnwzaBdqS7IJ/?=
 =?us-ascii?Q?tzAPqfOuDZGa9yaQJRGmdpFihUXblYfVQkoNxp5eKyhL7Z7p1gXv4iUIiV6G?=
 =?us-ascii?Q?31XhvmWDDfc5OwSWC27DJgjscl5LtvTijgqoxR+zCuT5uQF9iBAD5MlOvz0g?=
 =?us-ascii?Q?pdj8UkhPLBjOekEuhFmBFbMNHzEK9dZKXPNYN0wz/4sncSDexml9kLwpiT4x?=
 =?us-ascii?Q?qgQc3qVRayVKoBciOhZ+I6s51LQ4pr9OhrMaqdzQT7PYeplSSwIV5Dwv/LiH?=
 =?us-ascii?Q?CStsKzqCIP3a7sWR9CoiKbUAzoJNDnw4i2uja/mbKJ5kBnPzevPDsxrK4fd4?=
 =?us-ascii?Q?jCTmc1OWn7BnOYTfJn+QWDciCdjntv2MCRRnyGjvgiTDVnELYSl5phQTWYwm?=
 =?us-ascii?Q?FRFB2MwZ3DKm+WK5kx+ECkAEDLiY1dg1Y6KMwz398xakIQ19PAo4hmZ9m20w?=
 =?us-ascii?Q?5dtkoYz1l3BMSQPHNuVv0405PP6dayqh8YFzYL7y+vgOV2t1fAgzCc+iryF1?=
 =?us-ascii?Q?07Js3DeovrqI/JvoaJU68IHHZGwIrBWzK/rXY4GWDfgkDUxSu/m1AyYeMuy2?=
 =?us-ascii?Q?M39zNE8nAZDTHvHB6bQKMmzFUwvJE6eUesyZmSB5fQkHCYtc8bkkSySm9r4o?=
 =?us-ascii?Q?vZWpYNp6cZpCg4gebqmE7Aqn15nbfK0tzk0cp56UUSU1k/v83hKigPX9VAM4?=
 =?us-ascii?Q?MST8LimUFPcTeUOxYaCqoEWXPN5YlKjkHxKbT645ZY8F3sfjYawwqU1aahHj?=
 =?us-ascii?Q?J2abbh1joKSRh8WdTvwyyna/AazdvV4tLbcsmuO4631YMY2fwatMx7vLPvWp?=
 =?us-ascii?Q?L41X7Y6ur2B7vVzQh7aSfL1b/5nFehKVvkFujQI/pclO0Y9pPEBCU6gcy6ul?=
 =?us-ascii?Q?7nsq8wzX1Kbllx9vJkwVTzLPS6iR9k5oz1wG79cysxRuWN+5z7wMJJpSSBxW?=
 =?us-ascii?Q?R4LAWEMmIc4o+Vl6U5DdeEZaZ9hmqOgtSD/qQJLviS6rC/nWOEMy6naWr5/i?=
 =?us-ascii?Q?dPWFIJTfykiqZK2Db611uSPoJw67gRRUZsE1yoS7rPo/OTJ/oLRGKgKCIF09?=
 =?us-ascii?Q?rgfP/oo5cyEPJPWDmb0nWw4sZx12EWeJX1/vBHsBX+BWKLP++N26NkVDRHS1?=
 =?us-ascii?Q?ccbWGE4KtCimn6wqUwH43dcwCuYZ6bzAro8R/OMJwq/MaKFeh1uS2H7GrZhA?=
 =?us-ascii?Q?HRXI/XLZc56PU7bATt8PAx2wnPPRE/pwLxyJHgIn7UActqA+btc6IYqfSz9A?=
 =?us-ascii?Q?x5ZbZCrCnAwMW5LWPlCJW3VhHliRn/BQQ3EmHwKGCiOPJKzr2g/jtIib+KaZ?=
 =?us-ascii?Q?9kW2g9MvBMbKKZUBtg3yM3KjurU/KTLL+TtS1+oViR25G909hg5dI21WtCcQ?=
 =?us-ascii?Q?Nbgf+8J7yiihNICL3sb+0N/G6seD8D0NHsQAKW+EazTDBFN1znN2BphETnUb?=
 =?us-ascii?Q?PhA3WFHleWGqg/rnLqMW77JGCV5omx+sI1dy0Wkd8HIcJ5hJduR3QlVXJrt9?=
 =?us-ascii?Q?2umffpFJgrMY9KH+D+1lDnBsJlQ8kNAIa6s3qdQUqw3JM5b4Bb/o6WN+Ysk+?=
 =?us-ascii?Q?zBfLVGszWC3LN3I2Dd4OYZ/86vUOIxf9pScW0vZPaKpZRGdNZAuQJh9iPLrA?=
 =?us-ascii?Q?WQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: eb54d9bd-98c3-4417-8772-08dbce61512b
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2023 16:02:37.4466 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hBEKG2/A/JbQRFSEUAGlF9ePAcWfkFMRMHUG0X7ON5JPq2vL/LpZTMTDAGUm0j4nxxrTDkgkutp26znUBfLfh4P1PrQpMFUsb7W8HPCQyLo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7040
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 5/6] drm/xe/debugfs: Add dump of default
 LRCs' MI instructions
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

On Fri, Oct 13, 2023 at 03:02:56PM -0700, Matt Roper wrote:
>For non-RCS engines, nearly all of the LRC state is composed of MI
>instructions (specifically MI_LOAD_REGISTER_IMM).  Providing a dump
>interface allows us to verify that the context image layout matches
>what's documented in the bspec, and also allows us to check whether LRC
>workarounds are being properly captured by the default state we record
>at startup.
>
>For now, the non-MI instructions found in the RCS and CCS engines will
>dump as "unknown;" parsing of those will be added in a follow-up patch.
>
>v2:
> - Add raw instruction header as well as decoded meaning.  (Lucas)
> - Check that num_dw isn't greater than remaining_dw for instructions
>   that have a "# dwords" field.  (Lucas)
> - Clarify comment about skipping over ppHWSP.  (Lucas)
>
>Bspec: 64993
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi
