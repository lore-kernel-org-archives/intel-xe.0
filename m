Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94F71C4706F
	for <intel-xe@archiver.kernel.org>; Fri, 22 Dec 2023 23:29:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 248A010E0BC;
	Fri, 22 Dec 2023 23:29:00 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1369310E0BC
 for <intel-xe@lists.freedesktop.org>; Fri, 22 Dec 2023 23:28:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703287739; x=1734823739;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=M7FqmKYCcfk6nd3LDcJfwn9aeIBCJFoIgD87XXGbbuY=;
 b=AGIYVjFvowk8h1Yiyi1aL0kkuSQEtaGNCaw/B451QDpwVdjmK5XEiIoK
 e0pfPf7tvbWrLshJjSmJypXkxUXCIDkpekWBW9smFxnVM1hgmXOKiL+7B
 9WGJDHWfVEEMYaKIwjlTMjvQkJNBTjzdwzT37Ua6uTvN0L0JTfTHEO83u
 bwh9c6vqRB0emyHOumforS7irVCLzO0sFRX/liAd0AfxHHD5Kn1vNEVRg
 xfLsTt58c3cK5kC9HXSG3nPlFM4EatQ8bseFOufA0J86W1Ka5pBMXUYKv
 ARO1xnfz1CgKpziZRjXeV+ySFmBlCWU/garm0I2R6MIwvrXaAkIL46n3k A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10932"; a="381146180"
X-IronPort-AV: E=Sophos;i="6.04,297,1695711600"; d="scan'208";a="381146180"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2023 15:28:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10932"; a="847622032"
X-IronPort-AV: E=Sophos;i="6.04,297,1695711600"; d="scan'208";a="847622032"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Dec 2023 15:28:58 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 22 Dec 2023 15:28:57 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 22 Dec 2023 15:28:57 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 22 Dec 2023 15:28:57 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 22 Dec 2023 15:28:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XL826CwntUIK1G/P8DuNmcWkW/knR3dSf8rXYaAxl3Y5GFbNtPV4CH73Em4h2V9pCU5w5i82UbdZOhpe8CRwTUAiL8K5HMq7LO15ScDJERRPgP22NeJpU+WvOsdg9fdzcU/hG0apNEfvVLhJj6s1tzAwuMk7nbamRCEFhl6xkGTdT68roKnl7TuuQsIYGVzNmRt12yBNlWyL3kMkoMWFzowBCodi/YPbb4AIGTpUXoC0KJZlLaPVTW9BEYxXC2EVYU0EptwbPpAAfLkulyTy1cdp1KDRkU7OqiNUDigA9r10WtRRtmNIGEotNO2xIzOA9cR4m87lnX+u9gJm9jfR3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PkeusBbhxsp4HsskS2dvFJtDH+9p5eNbdMjwml+VItA=;
 b=JESQi3Chd+RAxSF3mg56YVSc0KuKMErGapUEYGoMlPHU17E1qxP2SmjlI0fZIJ6kqB6bj9bF4QAUDmONv4d0W7knO/UGAIbqpF7GWspj6/4pCIYOtLKp2/RR17gOt+15ffcB/jg2FKB8Rb5Jtw7jdrkeAu9Vv88I1rGaHkA3CKBjeoz3KOA69+CxzRAxP+ilfXMKLF+1OHHI1eLJC9HQy3cH4/jNxjfcMYLnv0SQYqr0iZDmwo+gDgP2xpIPi0RvGt9r5j/U+NpRzMCunmqr2HuadlmpUTfH38/87BsYkydF6LX2wD4Cm6f/CxqcGnXB/h9mtVW7LeqzVKceMyhNzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by BL1PR11MB5980.namprd11.prod.outlook.com (2603:10b6:208:387::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.21; Fri, 22 Dec
 2023 23:28:54 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b%4]) with mapi id 15.20.7113.019; Fri, 22 Dec 2023
 23:28:54 +0000
Date: Fri, 22 Dec 2023 17:28:51 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH RESEND v2] drm/xe/vm: Fix an error path
Message-ID: <ntxwx7tgoi2ki4o4fc7f5cynjo2h57mobleylwi2r4e4p76pax@dnqurhx7d53j>
References: <20231222175904.16732-1-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231222175904.16732-1-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: BYAPR01CA0055.prod.exchangelabs.com (2603:10b6:a03:94::32)
 To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|BL1PR11MB5980:EE_
X-MS-Office365-Filtering-Correlation-Id: 912bb8a3-db5f-4c79-7869-08dc0345c374
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sNWeMFK35TOulqqC7PrfHRDcYyQqpk6DS8FlutDc5pHcqeabpVeUCaxh/cvdeZP7u8TsfuE7aJc1rReoly05ISvkPf4Kfena5UEA++689lecJpea0f4DPhTU63yEnjkmfbiPHTmUxNkuwopx3f6iazd/4l8pCqSBTN6oDCBB0xMuyc6ZwcGh/AH4Yz7cesHiCfSBgWiVNIFSwQlTQNE/lOL4X4qbLezXcdcWS8UhHSTGVbS564hTvBkyWh4otcqe0st0/rqM79lXRIMa3aHRmtzxFKDMKBYaXL1Fre5KW8fyA3RvkHA4z12JE0deU+JjBj1RY2T/OKKiLrsgVVNpal5XV48F6eXdjcPPr4lR3YCsqoDb1A7pfPk6DSGyWj4STQmHwrQ+5ILyIovoWnCEvHNvrqovLbemdmMR17opk/VsY9huRuiaei7oe9R8KLoEiuqav2zY8GfldDBUoScFhTjyIbnAcDUSkSxSXSww/CTce2w0X2bEScvpp70qzODflXzprD56lcxmqfjqKWoubuZA4fknijcEeTCfXuTqzKM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(366004)(346002)(376002)(39860400002)(396003)(136003)(230922051799003)(1800799012)(451199024)(186009)(64100799003)(6512007)(6666004)(966005)(4326008)(38100700002)(6486002)(478600001)(82960400001)(5660300002)(66946007)(66556008)(66476007)(8676002)(6916009)(8936002)(316002)(26005)(66574015)(9686003)(83380400001)(41300700001)(86362001)(33716001)(6506007)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?f6ZhANuBhzlxwI3MchXZ/UEHYtBxGt3cDzcTjGyfSj4LJrUk8R+z+EB0w1?=
 =?iso-8859-1?Q?Q5hgKATddHs3e1NGmFvcQnVJiSggqjiQtfjck3qjKsBFOdDuxAkdqjtqW9?=
 =?iso-8859-1?Q?pyzNo61awBG0RrKhSdi49Ycm2oaHzY9mB4HMK/moyRl/PgYIttRrLJC3Ow?=
 =?iso-8859-1?Q?lQ5nOmefrRW1Qu8oZTvzFXIacbnHPcDV68pldbzlz8fsKFJodFH1UdwWVq?=
 =?iso-8859-1?Q?v5iupXe1/JJJqVmRBVbTUC7DLYJlmdEsQ5kYfW2dZN/gRkNMG4P/MFmLUY?=
 =?iso-8859-1?Q?3pJRH3XChmvnASyxwCoN+VzZrsMWm+IR5gSxr1ICKDTVjYx6oI0HACdqdx?=
 =?iso-8859-1?Q?lT4WbW/Mz/uPqoq3tRzXg5Th17h8Pxr72GclXjZNjeWlE9J5Qk/vcC7rZH?=
 =?iso-8859-1?Q?ZHc/eibNF0nvERF2vcA2xPj5Dh+h5Mq3/CLpT93UVAgUOAiSLyY3KeBf0b?=
 =?iso-8859-1?Q?ijSKaRMpONqavDnAIjOY5gU+8uYQTxtmFPEopm4VGZ9tiLsWU2OQSR4zdQ?=
 =?iso-8859-1?Q?5+n2LKukJv/sl3TfhJGgwmUISdYlQFPdkXwv95a4d30RYi6oetvp1bVdcx?=
 =?iso-8859-1?Q?V0cGzrp9uJsunlVsuo7HXAEZ8ZL7k+f6GipNI2R1RGW6Zir2f9SZm9Sj73?=
 =?iso-8859-1?Q?t0SA39d99tvrL4Jm9/xC7Czpb5MAB1lV+S0QecC73hTq0ObMExHlSqpO/x?=
 =?iso-8859-1?Q?NSKC7A2ZwnN6fpQPt4KotXa4ep9b/00tkEXpJCrpiWStkYRcSx3PEASwAg?=
 =?iso-8859-1?Q?/tflGx8RADQUx0zSVsi84QkxOr4yeUESguPLtV2bN4uCtaXMTX6/n5hJa0?=
 =?iso-8859-1?Q?w1MKO2Y3xhbjKhS3bidi86k/JeA4e0CR49m39YsPDk+N3b4XTXHUE2FjxH?=
 =?iso-8859-1?Q?aTvxaP0ngbBSb8vQGwQEwJ5gsrN4/RTWz8xA9L5qf6iLU+PzdftgqO0yVF?=
 =?iso-8859-1?Q?E17LSZvx9St3owljDL/Jb0Fl8oPoJUSTTjZZBQ4tISnrZwU38vnIKlcotC?=
 =?iso-8859-1?Q?Gt4WOprR4EFWfdY1kixPViJh055zIyRGnEAJH+2RcY4jX9scexiRtTK/QJ?=
 =?iso-8859-1?Q?pdx4zLkPoPWGvCOrlt45n6119ovOuXL/Ze3L48Tzzc9nT+MHbc8B8g6CZQ?=
 =?iso-8859-1?Q?/jhMpitf/B9mtzbAqHOYXlig/fk85Z25wtrrPsOD1P4m5G5YO5shxO8wDn?=
 =?iso-8859-1?Q?Qs8ZCMZlVQX7Zn+16R+6crOoUgYgQT+xonn8mgF7Zakjw80/CqBe9VRKWC?=
 =?iso-8859-1?Q?YqHD8liUiR09vCukJ5ZyduRtH8h0yZOpTMXZScbOMQWjNfiAezmWIiFBE4?=
 =?iso-8859-1?Q?IIU63wpBIkBRlVqVIOVB3TYGdDO89j1SFvA+PmKhn0QhWLuqb3lZ/LrpRs?=
 =?iso-8859-1?Q?/ziyjTWAUjRoGQVi9dv88dmoVBKGjapS1tTMG0L9WYbnWIZrCf/TPP0c+e?=
 =?iso-8859-1?Q?eXun7WEuOvD5L0OOO0VXpPoYq5cZfJr4OfMc/O9w4VWPbYttW3lyK0tgEn?=
 =?iso-8859-1?Q?yWEtDDxX8UrRf6ea3nWqduPEGTcnL7iCL8Gp64BhFyqAZzVOu6DMF8u4el?=
 =?iso-8859-1?Q?OtBnykueFj1yd5/MVOkjY662BcdDIlkZdvx77lmXUsgPLnrR69ODvrEUak?=
 =?iso-8859-1?Q?0/7hHRg7FXvDN5BVVpIla+DxshHefdtrT/cFglhFi1Gf6WJ5/wA5SPFQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 912bb8a3-db5f-4c79-7869-08dc0345c374
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2023 23:28:54.8866 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HGlIUHQcxCNCdK6hXkQe2uZJ7DETjSDN5C7/TzQpoH2p0KhaRvSzeTif4249GEjZsNLs6qU2KfjyJ7zLpgWmcdc34am60OGmoG0rxsAeOqc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5980
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
Cc: Dafna Hirschfeld <dhirschfeld@habana.ai>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Dec 22, 2023 at 06:59:04PM +0100, Thomas Hellström wrote:
>If using the VM_BIND_OP_UNMAP_ALL without any bound vmas for the
>vm, we will end up dereferencing an uninitialized variable and leak a
>bo lock. Fix this.
>
>v2:
>- Updated commit message (Lucas De Marchi)
>
>Reported-by: Dafna Hirschfeld <dhirschfeld@habana.ai>
>Closes: https://lore.kernel.org/intel-xe/jrwua7ckbiozfcaodx4gg2h4taiuxs53j5zlpf3qzvyhyiyl2d@pbs3plurokrj/
>Suggested-by: Dafna Hirschfeld <dhirschfeld@habana.ai>
>Fixes: 9f232f4ae249 ("drm/xe: Port Xe to GPUVA")
>Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>Acked-by: Lucas De Marchi <lucas.demarchi@intel.com>

you can change this to


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

>---
> drivers/gpu/drm/xe/xe_vm.c | 8 +++++---
> 1 file changed, 5 insertions(+), 3 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>index 1ca917b8315c..127842656a23 100644
>--- a/drivers/gpu/drm/xe/xe_vm.c
>+++ b/drivers/gpu/drm/xe/xe_vm.c
>@@ -2063,9 +2063,11 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
> 		if (err)
> 			return ERR_PTR(err);
>
>-		vm_bo = drm_gpuvm_bo_find(&vm->gpuvm, obj);
>-		if (!vm_bo)
>-			break;
>+		vm_bo = drm_gpuvm_bo_obtain(&vm->gpuvm, obj);
>+		if (IS_ERR(vm_bo)) {
>+			xe_bo_unlock(bo);
>+			return ERR_CAST(vm_bo);
>+		}
>
> 		ops = drm_gpuvm_bo_unmap_ops_create(vm_bo);
> 		drm_gpuvm_bo_put(vm_bo);
>-- 
>2.42.0
>
