Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BADF6C7EE25
	for <intel-xe@archiver.kernel.org>; Thu,  8 Jun 2023 08:28:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E15B10E084;
	Thu,  8 Jun 2023 08:28:27 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A3C010E084
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Jun 2023 08:28:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686212904; x=1717748904;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=yIzO0bCu9BzJYya2Q+FXN8yO/+vD0lIDFU/hdNQt8+o=;
 b=Sjo7tEVO7Y/3HIbiXxbcKWmN2cY90LgZu46kjUDn5QG2shjEtPD5xV9k
 bb9OhYqKnDFZ1PPTGjyuk9hFMSZRk+Sk6YSfYhtEhoFYOQvMvZPwRN9KK
 r4XhU1+phdBJPSSe6jG7h65FAokKYQrqm6Oj4pyydsPnRrpadRr63pin/
 calx5vZ6+Widcwhda6lRl0B+33uI/3BaiU9Jsb2ZSSGyhdVD29AFbc6DJ
 Lqup3JZy0nmaNtjYTlQaCqieXVtaE7ck3mCM20KOlfPcTIGSQmOCepnr9
 aNEF5S2IMTibV/NMjEmdMM7wG+eH0UWvevxKJa1LkcLpwNfb1sWzCeZCX w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="360582798"
X-IronPort-AV: E=Sophos;i="6.00,226,1681196400"; d="scan'208";a="360582798"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2023 01:28:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="709898308"
X-IronPort-AV: E=Sophos;i="6.00,226,1681196400"; d="scan'208";a="709898308"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga002.jf.intel.com with ESMTP; 08 Jun 2023 01:28:13 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 8 Jun 2023 01:28:14 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 8 Jun 2023 01:28:14 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.174)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 8 Jun 2023 01:28:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DwWjFvxVYpE+kEEt41/PHTjiUgK5QbRxZw09guk1KyGZi43vJBHX+dFcSGWXNrzw8JN+e/prkwEpgHkeCu4dxdrSGeiQt0fOVPXyzJGKMZLbgXL6H82aeGk0QdOP6Amtebd+n941saNJHhcwxQvBT44RwwuiYL6VlvfQMpn0cU611eeCjyzDjg7BJt2+ae81pYlLsbdGbvPOKx0x4s/MtqvRsb79vj1rhZ/zPoOCcYIrMZQOiAq/47Vh28/hlMMuEDgWAVS3qTLbhZAJG6BRFA/hNtzSBlQ6Uh6+n1N8MojUzXhHq3WZlsaA1XFTwMgNHgXGrupNbTbfw6qCXd8XWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mpv8clOoRXI3ySqVrFPnepRxBEnpJ/Bjg2DSsFBRumM=;
 b=T5GkIdQNNC65aOkblOI5pNRh1e3yU4bkSlpzGpKgqprn+CwoyZWNjZ/DxeNIsm/1fso+Vk91A6S911bGhv0eM94tTWV76BZGk9VEhIGVbVCgJPelYtOGSz1Nf3C+puhXBUAV+2p1cOI+pab9VYLR7kwJhOo/kGvo1GjqAn/yaStjFlQUmmviLJPHixsirr5B1vfTbx/0zFdw4QdT9xS8zImwfMte3/9Qy30/Y5550el6A4G/D3/GCyADCvy5o0jgSQ3TLIyg0ScOnlPl27z8jutk+lnQWtPm3Zj0Sj4A7PRftsID/g15DnGKVKNDgGvjHP/IQZ/vFjnjuxUYJ8hO1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by MW5PR11MB5932.namprd11.prod.outlook.com (2603:10b6:303:1a2::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Thu, 8 Jun
 2023 08:28:13 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::e1a7:aae9:f8e7:6aa8]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::e1a7:aae9:f8e7:6aa8%6]) with mapi id 15.20.6455.030; Thu, 8 Jun 2023
 08:28:10 +0000
Date: Thu, 8 Jun 2023 10:28:08 +0200
From: Francois Dugast <francois.dugast@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Message-ID: <ZIGRGOAwgyeNhXbp@fdugast-desk.home>
References: <20230608050333.37581-1-matthew.brost@intel.com>
 <20230608050333.37581-3-matthew.brost@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230608050333.37581-3-matthew.brost@intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: FR3P281CA0031.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::9) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|MW5PR11MB5932:EE_
X-MS-Office365-Filtering-Correlation-Id: d0981750-abff-4b2c-5655-08db67fa4b62
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YAv/+P552FkL/M4hl6j6Ugz8UWUvz3blraXde0fh0rSc5eiZJPe+whixxpu5JUhDI1lU4LSMBsarE13+jDvmELemNo6d3gUMXQb9co4EVtpQqgDj6dt4U08bn/ttgaD6GgEuuz5o7qM1UYW+k6mK2hCQg7gfIQG6MIIYzIJo/HR6QLpWtzDVk4TAdcYKVxdN9ecvAyvP8ubon5tr2Mop6McVG3l3DlrR+fhd3i8qZ6+/2AsrGBqftZFqpweJLBCNu8gkrbLH8oFCVmUEQ0ZBn3y1AAmZPtLBAxMIbvqego+bS9eC9az9FbYUExkWcCqQ5qhnvEUTOZ036naSOVm+f3eecFIN+uMQ1GsnGAz55PFP1tzWk+cZ6POrDXP2Qyw4JSrHLAC2BXzJ1+irgl8qjDhpwpDY5s37bgr7z6ZYDz74UDZ3UX6+h/OITdUmF5uE1EpMHcjVtkRUD1+hf3gG1f2kzuir/N4+hCR5U9M5aaXFFqpngluheacO3CGGRZZ60rOCRJdENelFdAojdbvOOCDbtpRJvILVcyG7ama/QipO+q/spfd1JBa/bEyvHoH1
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(39860400002)(396003)(136003)(376002)(346002)(451199021)(26005)(9686003)(6506007)(6512007)(44832011)(316002)(83380400001)(6636002)(66556008)(4326008)(66476007)(66946007)(36916002)(6486002)(186003)(478600001)(36756003)(2906002)(5660300002)(8676002)(6862004)(8936002)(82960400001)(86362001)(41300700001)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?R0WjY9FMAMpCQAENxJjlBLCBH75MBBiphfoxB8m1IXOt2vg525I8aWZ3BoU2?=
 =?us-ascii?Q?/RyT+w5L4E5rzvpS5o/LT3IX0osw7FuhupRGM0veNP9carqHuunbHUi6Nzkr?=
 =?us-ascii?Q?Ega9IxwJXfGS6vJWi45ixkkBCAGcBB0VjGQRKfd86txhf+LB+wHaYPdl454L?=
 =?us-ascii?Q?mMZbCzEpD03HE1TOVoMGpLgS3FbQAZD/JK7L57rNtZV0jMOKvDQz3t/y3OXI?=
 =?us-ascii?Q?wx3zumM8PCDne1wr8W0TqHVQanJCoks62Qv8v1J11moLOBpvAsXW6ZjIRp6I?=
 =?us-ascii?Q?++Vozwkr41vwwToF0Oa8fmFqOaBivuWHR+ZSK6fIwfB4zHf7+kVOb8XYhvTM?=
 =?us-ascii?Q?BiLdtlO2ThU/XAiR+uBvupdpzTX0DBEKim6XmzCB2ky8V4+8YH+PgnIXnAG6?=
 =?us-ascii?Q?OyR9dqVGa16Lqfwllrl3COowd/A3XJFEpLZ4NzsamegpXpUAEnR8KEbRThIc?=
 =?us-ascii?Q?2qVs3EDWkGEGvTxt+JYxJkuyZ7a5N2mboLKOzlHx1H+fNDTGZA+mI9emWqjh?=
 =?us-ascii?Q?66ZrFItb0L2BmPTeSc2hMnSv/5iCVZhV4xlQHMb5UNeljExhXaMUqRjV4t2F?=
 =?us-ascii?Q?zBSSMtEenq4EUk4Di2lNMngswARQpskWJeO6d3s2aeq4b+E9joUdHJE4dUuW?=
 =?us-ascii?Q?gl2ibgTCzS76L6G+TdzgJ9qIvMYvr3mzP3l5LAaYxbCnFME6NvqmVl8ytrsg?=
 =?us-ascii?Q?ssSIooNVogkAYsS6XJki2RLadx4qCUd892WRpuZBKBFMCXqpqtQOTnq/FwA8?=
 =?us-ascii?Q?uV0LH0SjwsAch4j/czeHWR3scCNS4KE8xE7tuF0sKhFhA4Y5BOAqKsZX0P3w?=
 =?us-ascii?Q?NIkbsum3jQbT+mNmkMWzAdxM0ejDHWtYsBW7JUxjrgmzX2YvZeoH6GXRH5gS?=
 =?us-ascii?Q?PyhhqPtt+2uQ0buSVXXAvcgIBLMtTC5M4mlDwlJwMAu+r4W6ca2/IxxqVfb+?=
 =?us-ascii?Q?qht9y/VnULE+3T3/g7XPNZk9TiZaeNTybrBkDVE11ZklUK+E3WYfH9peSN/6?=
 =?us-ascii?Q?XHsVkhfFVK89OJvjyOLlo6FaeSXaRv7yNnOVNX3973VjN6ui0Jc7+Ms/w/uM?=
 =?us-ascii?Q?t+bWPyWyrxSuOqLD3GSgK1vYPG2gwnUjzwbotb/ttNEBVMruQ0b2bmrgCimI?=
 =?us-ascii?Q?Pb0GSjncFSJ/rtEAbU0aCOuGerVIrotyTkpuK3joiU7ptSonDegua74kZO7o?=
 =?us-ascii?Q?XXMLU9ifGjQNoUchiShaW2huBzqlh/dYvvjTZhRC5BUb7kOMaf+/szOuCXmx?=
 =?us-ascii?Q?nlUCgZ4QJjpxfm6SOVJHGAUk6IS8jDfrUnTiDup9I0x7rtjf08mvKBnnGnwS?=
 =?us-ascii?Q?wbO+e26t6Wz4QyTYshK03JlFri0rJi7Zou4O+dnWRCQSp3FUwfGuqFf7odcN?=
 =?us-ascii?Q?ZOidIGgl5+ae1WstIfPIVC4JEk1QWMmrdhX622T0Q6I+701kKtO25KRKEcJb?=
 =?us-ascii?Q?dV9SCyMp7LVRWsc/izE+eU5f4CG9pTOzc8D0FzbLDxoExC/qin/ccq0wAPaZ?=
 =?us-ascii?Q?JjI9PqWcgmFD6zAK8ZBBIFqKL6ktcQ1CdZlvVDqj3ZC7wbsFw7c0AQX4/IkL?=
 =?us-ascii?Q?QE14kB16GCPBr3cskrPPiqjM2G699tInpTGEBny4xYi+ZdST7A/bouD9VaGX?=
 =?us-ascii?Q?9w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d0981750-abff-4b2c-5655-08db67fa4b62
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2023 08:28:10.8320 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dH9dUjtks1zkUczJRVOwT2/+jY6s8bMUjRKvDpgImUIyn/Zp8jMjMcGY3N6sLFeDI7u48n1LxPEBEI2K+vwCMQn23EdJgshyfqeKRNKFNX8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5932
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 2/3] drm/xe: Move XE_PTE_FLAG_READ_ONLY to
 xe_vm_types.h
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

On Wed, Jun 07, 2023 at 10:03:32PM -0700, Matthew Brost wrote:
> XE_PTE_FLAG_READ_ONLY is specific to struct xe_vma, move it from xe_bo.h
> to xe_vm_types.h to reflect that.
> 
> Signed-off-vy: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Francois Dugast <francois.dugast@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_bo.h       | 2 --
>  drivers/gpu/drm/xe/xe_vm_types.h | 1 +
>  2 files changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
> index 552fe073e9c5..dd3d448fee0b 100644
> --- a/drivers/gpu/drm/xe/xe_bo.h
> +++ b/drivers/gpu/drm/xe/xe_bo.h
> @@ -65,8 +65,6 @@
>  #define XE_PAGE_PRESENT			BIT_ULL(0)
>  #define XE_PAGE_RW			BIT_ULL(1)
>  
> -#define XE_PTE_FLAG_READ_ONLY		BIT(0)
> -
>  #define XE_PL_SYSTEM		TTM_PL_SYSTEM
>  #define XE_PL_TT		TTM_PL_TT
>  #define XE_PL_VRAM0		TTM_PL_VRAM
> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
> index 76af6ac0fa84..6daddd29d416 100644
> --- a/drivers/gpu/drm/xe/xe_vm_types.h
> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> @@ -30,6 +30,7 @@ struct xe_vma {
>  	/** @end: end address of this VMA within its address domain */
>  	u64 end;
>  	/** @pte_flags: pte flags for this VMA */
> +#define XE_PTE_FLAG_READ_ONLY		BIT(0)
>  	u32 pte_flags;
>  
>  	/** @bo: BO if not a userptr, must be NULL is userptr */
> -- 
> 2.34.1
> 
