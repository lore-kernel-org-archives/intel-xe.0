Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40BF7C83F2F
	for <intel-xe@archiver.kernel.org>; Thu, 31 Aug 2023 18:34:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0162010E08C;
	Thu, 31 Aug 2023 18:34:41 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BE0E10E08C
 for <intel-xe@lists.freedesktop.org>; Thu, 31 Aug 2023 18:34:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693506879; x=1725042879;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=M5CPhlF+PPSAzlKoh5D+i+xHjzlGiOfj88RYl2Byqv0=;
 b=Tk8FEGWgoVNyAjLr/+/sqdd3Ntbx/w7STfqc2/fS0PG+Y7/p0Jp7q1T1
 DzZn9SwDYUs5z4K1o5zmUX2OETiIVsPjCAjKJhcJcxSRIQIjDwuXFM3tB
 ECCz92NJw3KZ1s2T82vYWdUSgfIMM6tfnPxeTMD4A0idk3+BHyfwqQZyn
 vF0NbkyQbE/+pwi+UH/zlK7WX4TKVU8wChSUcgmb8nJbS5zpJHlVt5pUs
 N9ClZdXDgrVvORZYO7evNj8E+yXpz3YPPZ+R++mYFq/BuLPgF62WauLV3
 4qQBQI+dqGmJyrmuY9LswScf7WUkV0fJrg8jZTVgNjiz7ruy+xsn3wUFL Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="407025463"
X-IronPort-AV: E=Sophos;i="6.02,217,1688454000"; d="scan'208";a="407025463"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2023 11:34:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="742819293"
X-IronPort-AV: E=Sophos;i="6.02,217,1688454000"; d="scan'208";a="742819293"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 31 Aug 2023 11:34:04 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 31 Aug 2023 11:34:04 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 31 Aug 2023 11:34:03 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 31 Aug 2023 11:34:03 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.174)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 31 Aug 2023 11:34:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FdOag0gA4+SDWrJtyy1bf8VCr9rBi22Jpnj2Y1FlqiviantuaxJ/0XG6ZHysE/XB9pOUOlZKHTETJZEPH2rQpFbxyguV/+F+4WdRiQG+4O9W+35bqjsPbgUTHyAFV4JslctC+WgTeDKRMprGujvPMwFARPKfhdt7fNTUqyZ24+d0DsffY5fGW9oH/wX3iwDHcZgl6UbkzlN94rJY6XJuhLTXbUVbV8iIci0ILn54uaWjBuQfhycDIhafE+s669pZOMsC3/fVKmIlP5OtumnqWBLU5Nd9iMiVKYpudKk6ZrpcfY1JNqvaZKiT5sxBkJtkqF8NKGjuIHtMN0V4MBTi/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7zRJXGNloYzQtPLrf03jLs2+W3cQ8cTN3tNwBB/76y0=;
 b=HOTmMShNBruzcPQvVpULX4G0Nr4kAaVJk3i40GOXulwK3cL+MZrWWJMHgcsur1pCbqri09AVgxVXGvzGxOsq3hYEuEJAdmJ463T6JhJrooCKeepOga7zX217mEZM9ht+EyWdMRZpY0TgbVhkfCPMCYg73lyW1gJmekokZC8elFKsYQd+vWMC3RFiSCMfMiAd9dHj3/vDUnCCBlEC6eTV99iqdGq20BWmt1sgkpHJVDe4zDLC60OYZ837RYBZ936OXCE9OJ3YfIA33DaW8XE50RCQ2bpcyPPHKiZeFj0pfeb1bNliQccYL1MqnCbGx9XPOivIQv5cLBJ/IBvk32jX4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by LV8PR11MB8723.namprd11.prod.outlook.com (2603:10b6:408:1f8::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.20; Thu, 31 Aug
 2023 18:34:02 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294%5]) with mapi id 15.20.6745.020; Thu, 31 Aug 2023
 18:34:02 +0000
Date: Thu, 31 Aug 2023 14:33:56 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Message-ID: <ZPDdFHCmB1TD2H+x@intel.com>
References: <20230831150048.1760018-1-matthew.brost@intel.com>
 <20230831150048.1760018-4-matthew.brost@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230831150048.1760018-4-matthew.brost@intel.com>
X-ClientProxiedBy: SJ0PR05CA0191.namprd05.prod.outlook.com
 (2603:10b6:a03:330::16) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|LV8PR11MB8723:EE_
X-MS-Office365-Filtering-Correlation-Id: c1247810-a02b-470e-2490-08dbaa50d8f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: N0m+CGOkOT2iRngjMqnTIceXoP0rA5Lv69VeC9itJddXe6jKp0uq5/OdZJqzBmQifEcwqpx78Nl09bVNHw+Hge+HbnsnVj4WHLSHg6qXYvZ3fH0YfGTHwCeZYCR6tAoxiDU6ng/ScNuVWMVUi9/UFlfK/mJhXZJATPfB/oB96LUuru33ojhPVg/GNhS11XwVk2lPb5XBwzvHn2gq3ehf8yGkeFhoqEcZhhU3/5pWHy18LLS8Q6s7fDFSXoP5wrUru+1B2QVGlrocHhu8rlg1rwVIJLhK1vK4oq0WhQSiLaNr7A2niC9N0ggn0FlxQwN8lA6y3d34mK9oE1y0yAZAucPOtVou0Qsawsj2pMZ/tkCj5cPuYA5gIlkFVYUWSFizcjk/Gq/45oHLXBrXgAO8CxdF5SOWTd8pyCKjmRKSHrsBi8Z9QVSuwtpqXta0DT3XntbhZpGs3Of4DLun/5eODE6RMjUYKome0+ljfJ3QxQT5Kg/Qz730ZS4AldHs3SbpLRcJcNrb8N9JNK06gE4sV3IzmwJVLqhGeZwg1VeZ0Ekqg8DQhWLSps/k0Edtdllq2R6wa7lFvR0smka4ZA3Gcfd5kTsRzeW+pz876xXOZTg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(39860400002)(136003)(376002)(396003)(346002)(1800799009)(451199024)(186009)(38100700002)(478600001)(6636002)(37006003)(66556008)(66946007)(66476007)(82960400001)(316002)(2906002)(83380400001)(2616005)(41300700001)(8676002)(86362001)(8936002)(6862004)(5660300002)(4326008)(44832011)(6512007)(6486002)(6666004)(6506007)(26005)(36756003)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TyoCIXVwPST+6WlXuEG2hT8dEhe6aYnVIGOomLrdCROC8vz/syaZ14futy9L?=
 =?us-ascii?Q?wSm8yHxuJ8T13l0e5SuRquqH4uBDaz2+j+rie++we/FnQ0dKjizQsdR9v8bt?=
 =?us-ascii?Q?n0+G0lnCuLHSkcxfil921yn/CLE1H+WfeegyVrMJT+eFqrUti3AgBxW0DXD7?=
 =?us-ascii?Q?R//Vg2ruo5MSqmwhLpBZbFyi3yk7yu0TIyX54MlHM/3M4q6x0nyl+Mb30QSQ?=
 =?us-ascii?Q?9wscdytA4LS3/Jt8eXV5eeEzWrysWCuyfHr8IGhYyLSNsjzCgV66lOv0GX4Y?=
 =?us-ascii?Q?2N3jm4U10QUKHaGIIcFDBHWZTLaxsIo8t+ej1XEim51Ulqa5HIXEZxdneHxv?=
 =?us-ascii?Q?DqEmPQV3oXV+2W8QxvJyvToOW+X9cqzWoLF4ifo89N031WZY25BUHhWwU95O?=
 =?us-ascii?Q?eocMXMyr7bwmj0Df+2UmLtbmiFuYFL6cFWYR8UXGy/fBKCWmrueT1Kmq1WWL?=
 =?us-ascii?Q?KKbNJbevD27Ov1JY1Ngunm2iv8UGZq4jNSz1+tlzImG1d3YTR80winwPUWIN?=
 =?us-ascii?Q?3k4ojyNam0Gj5tvBm7HxRf1TSL35Zc2SafkOGsZ7ymLNkXX5qDBhZz6hT8ZT?=
 =?us-ascii?Q?Ayu4hQGnLqjJ/D6oKod4oUswq4BVJG2ivZkYFK5u7LcbIa961iUsrmZQiDZO?=
 =?us-ascii?Q?fR0jdbfTzKav39hg1AtX6sdzQA6Ig2zPfxWz2bpDES4cZdIT2fzSlk5UchPu?=
 =?us-ascii?Q?yUkxKB20fKe1EfPIEFXIJqvM9smcIBGeRzOo8EIu+TCaqwUeqPBFDwNDIPBt?=
 =?us-ascii?Q?WPRPiUwXA05WxKW72INVcbSssg09xMAXXmYqQosJw0PmLGvzTSCU4eCpmtqf?=
 =?us-ascii?Q?OSW7smtLlalbTw3Ub7hYsYDxSFUsZ750zLaLzO18bQEM03CoLbYJ9AF95ou+?=
 =?us-ascii?Q?5ePUYB/HT/FnGGIXGzsyHFe6fPr+3+FbTK+cs+R5Gt0yFqE6S6kKGaszzIvu?=
 =?us-ascii?Q?cKUx+QL9iqEsUR4LBi1lUD3eAJ4j9bIadSGruBgVMAswnWZJPV5uOSKa0dU+?=
 =?us-ascii?Q?QmHwxW21iTW8TBvLQhkccd357eN8EpSFyFx+2XdQqxCDQmpnMoJUb/Lf4CXp?=
 =?us-ascii?Q?0dP+R3I8ug3V5kltPnsZwG/0Pb88Az9omvEx1JUZBqqBGwAHfZ4Al27mfgJ6?=
 =?us-ascii?Q?dJ3yFEcFECWvn+GvYPfllc908r9QADWSQhUUaadFByhmdhGwaTPbZk2kgeH1?=
 =?us-ascii?Q?uvHkiwoZCleYmK/YTKqB264A51xXUBEKHewOGv/AS2VQDtJObkWtNgPB9o0S?=
 =?us-ascii?Q?J86p27R2h/URDVVXSzDHBKHdOZeaoB7c3H+hXiOZ7DXN++/vYG8JyQAyWL1f?=
 =?us-ascii?Q?BZo69n096LK1uzqKVckuPaqbyE98eONak3S87SOHHzUZ35ni8VO41dr/n+zw?=
 =?us-ascii?Q?T2wr5uw2qzfv7gPr1kVcDPRTIRc/mXdMEteLfI1Z/K+QvdqGL4shhrC4f8m9?=
 =?us-ascii?Q?p92w3WvR43yTTchnal8hXXBhT3ax+M+za9vGzUHiN4tchYasCpZKHV00Y78W?=
 =?us-ascii?Q?Y26Yn/5NHjMjcWB/E8Au2Ii4L/9tpJUVyYQ0QCOFSMD9Wz3d/EWb+x0b02Oy?=
 =?us-ascii?Q?fOg1lzX0sFaRSoJBL/Ormfyd/1TrUNu2WZuHf4XPWfSpm8kJPvG/lyynC755?=
 =?us-ascii?Q?hQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c1247810-a02b-470e-2490-08dbaa50d8f7
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2023 18:34:01.9947 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cPmcxfAkCZxY2GOQG1YGrD7GrDDDEUtV6nWtMd78cHlB515wHqUoZbS6GcmnnJ6ezSq/1Lk/5B3mxYUHr2VBHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8723
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 3/4] drm/gpuva: Add
 drm_gpuva_for_each_op_reverse
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

On Thu, Aug 31, 2023 at 08:00:47AM -0700, Matthew Brost wrote:
> Xe will make use of this, add helper to walk op list in reverse when
> unwinding GPUVA operations.

I'm no native, but I got confused here. Would it be better if we
change the order like:

Add a helper to walk op list in reverse. Xe will make use of this
when unwinding GPUVA operations.

with the msg changed:
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

This is a patch that is likely better to be propagated with
Xe and not earlier with drm-misc. We will need an explicit ack
from Dave/Daniel on this.

> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  include/drm/drm_gpuva_mgr.h | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/include/drm/drm_gpuva_mgr.h b/include/drm/drm_gpuva_mgr.h
> index ed8d50200cc3..b2024ae19fd4 100644
> --- a/include/drm/drm_gpuva_mgr.h
> +++ b/include/drm/drm_gpuva_mgr.h
> @@ -557,6 +557,16 @@ struct drm_gpuva_ops {
>  #define drm_gpuva_for_each_op_from_reverse(op, ops) \
>  	list_for_each_entry_from_reverse(op, &(ops)->list, entry)
>  
> +/**
> + * drm_gpuva_for_each_op_reverse - iterator to walk over &drm_gpuva_ops in reverse
> + * @op: &drm_gpuva_op to assign in each iteration step
> + * @ops: &drm_gpuva_ops to walk
> + *
> + * This iterator walks over all ops within a given list of operations in reverse
> + */
> +#define drm_gpuva_for_each_op_reverse(op, ops) \
> +	list_for_each_entry_reverse(op, &(ops)->list, entry)
> +
>  /**
>   * drm_gpuva_first_op() - returns the first &drm_gpuva_op from &drm_gpuva_ops
>   * @ops: the &drm_gpuva_ops to get the fist &drm_gpuva_op from
> -- 
> 2.34.1
> 
