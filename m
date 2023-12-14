Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12FBBC4332F
	for <intel-xe@archiver.kernel.org>; Thu, 14 Dec 2023 21:24:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67B9F10E209;
	Thu, 14 Dec 2023 21:24:06 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48A1F10E209
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Dec 2023 21:24:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702589043; x=1734125043;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=t+JQ40ZzrEppy1mbzNgz+7FVNE28BJ++ihu66fx0YWg=;
 b=Jut7E5aXEBe4QdirxG+0x4ZmyOfGMPFGDECF3OalvFvIflX18CvSRwlN
 rfcm1kpYsS8gEPAObmj6O06xk4dY8NsLiHh96W4cX8OhaGan2xwkMeQEe
 8W3NtubnFZbNj0cd36YbmZ7B80yjEXS1JK5ZbTeLOZ94VQWVKR65L+T8C
 53bzGx4ShOkP9d2EjTIP/A4+xQmDI+BU+WIdu3v0Kumhwy++Zsz5y+K6O
 Vd03oSxIEhN1BCmvdw9TyjDtVRBBxymO2xLqUf6Xt0YP1+CVfGMDm2+VJ
 JroJpht2l6xr8cgB0EkRVrKUX3egLu2Po1ugcEMmAHXV2Ze/ZbQyWbg75 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="16742294"
X-IronPort-AV: E=Sophos;i="6.04,276,1695711600"; d="scan'208";a="16742294"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2023 13:24:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,276,1695711600"; d="scan'208";a="22575849"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Dec 2023 13:24:03 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 14 Dec 2023 13:24:02 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 14 Dec 2023 13:24:01 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 14 Dec 2023 13:24:01 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 14 Dec 2023 13:24:01 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ak2lciP6BlTjw85HxbSwfNDphW4C2rTg4tkG9D+C52Kdzg3+SwWtGqaQbSPFaf0A38RPZuIpvGZrrc65pX5lNS3EMzigp80jSHsEvFj0cmH7rMVe4Wn99q7o/HoIF3LguNCN6VmfEwoyo4vJneNjFlMALuWDjvoX/Q4iaxC90dfFtJeKYqqHBegPv5inIkF8pCOwFhDrDdatPGTOZ9+F68r4/UIgKOlIC1jZVX9MPhvWc+DyZyiFec3WBJtSkCO+kttRkl1rjPVXDT7FE86Ye9F1WPJCO/M9zFrYGtY6IGkr6k8LTuc4qDxjenOTl2P63d4rimjc+xehF+fGkuaSDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t+JQ40ZzrEppy1mbzNgz+7FVNE28BJ++ihu66fx0YWg=;
 b=HArfYpLjOJvufKQicRPxBYr4G5gmSdF6XXeShYzxw7GvYuAtGX8vXh2TMWor3osnmbZgKbRO2pQ4ZF4Wk1bS3lZZe0uLYupysXI5K03QsZOn6kYd5AR7Sm12NUb7OcNtW8xJ7YbFS1bCnPFH/Zzsnu22LFTOxweWg4/cI44mV7etnjQIf8l9TkRgxuVcEvyf5NgSF4XDwDZpe9ops9XMETfNz4IMqLMXWmhLO/cvxQw0GcM5+fzQTGKMuxPiz9PUPXfAoyolSLyYzlZZNqgMcrOAaGLa44zRw6Re1W83t4cJ7/U3/ra/waR9vjHWXLcOP2v7vb/5JW6wEtj0jf1SRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by BN9PR11MB5466.namprd11.prod.outlook.com (2603:10b6:408:11f::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.28; Thu, 14 Dec
 2023 21:23:53 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b%4]) with mapi id 15.20.7091.028; Thu, 14 Dec 2023
 21:23:53 +0000
Date: Thu, 14 Dec 2023 15:23:49 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
Subject: Re: [PATCH v1 10/14] drm/xe/uapi: Document the memory_region bitmask
Message-ID: <jnw2xrysp6ymyoxperblb5jsgvziaen5cemudjbxrfvg6i6flv@hsonwn5hz6c2>
References: <20231207135009.7-1-francois.dugast@intel.com>
 <20231207135009.7-11-francois.dugast@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20231207135009.7-11-francois.dugast@intel.com>
X-ClientProxiedBy: BYAPR04CA0033.namprd04.prod.outlook.com
 (2603:10b6:a03:40::46) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|BN9PR11MB5466:EE_
X-MS-Office365-Filtering-Correlation-Id: 724dcf94-b40d-4f58-cb45-08dbfceaf8da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kZq5RnxLuO8xOSvshXFD+6Pue0d5xoReY/TBRL6HttNGKb2fL3L0r8BIVIQvS95c5PC+KOhHxUbhAjvokNmfdsdee5oMGa0SoXN7yJSxmAjoA8obQocEg9RYVpgMKKzwBEKipsdjrcgui/vofiAfQ7m0WaAUQgAOxK4r4BNXjDfyyG8EjJwwibd77oXxXy/x3QVlTuekTXzQ7nESjTmYKVKmHOHVFSFYo509hh9ua7hK5x4/31ve8epzrf1kP7DURprK7nkD2HC9GjWljczQo7Bwu5AWJ9107FDucMzGgSaz4ROHQeTnhyMMDhjaGliktXtPPBWGxBd1satU9zhKNMO7O3lxfleCpB+KG6EaL9Enu1v+GFSD0RJvQLEonltQjag5Tzqfthi6VUMGzoWrLvo26E+VLQJt0D857dwVsridLJhBQsQ5tkRs2SRepT7OIkID5foOojMteXMTqNM1dR9r0WYTWig+RLXWHVt7eY9skgEQznq1mvzVz3+lyBjBAwgSdWawrDILdV4ShyFmxZ98ByJ0IJlejKRSdf68RLzhYy0YnqyGD9kdR66iUgY6
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(136003)(39860400002)(346002)(376002)(396003)(366004)(230922051799003)(1800799012)(64100799003)(186009)(451199024)(38100700002)(86362001)(82960400001)(6506007)(478600001)(6666004)(26005)(6486002)(6636002)(66556008)(4326008)(66946007)(66476007)(107886003)(6512007)(9686003)(316002)(6862004)(8936002)(8676002)(41300700001)(33716001)(5660300002)(4744005)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hZgiobAck3JROyIEzeMz3ODq+RXLZRRC+rqUKnc6Jghimf/KW2/3WMVt1nBg?=
 =?us-ascii?Q?Meg68DaeBbsuqXenYpA/pGRN/iN3njWHwgTvkA4khpJ7/guqtyp0EldCBYpm?=
 =?us-ascii?Q?u2tFMBoJCKsKKbU+bBK+YcvIpAjzW6pfjkgjTUB1kcoSvERnsaQgNqoIzat0?=
 =?us-ascii?Q?MZD+W+2nNtG+Xd5LxKS9ZRmR6EfzZJjWSrEBg1hmqNuJpCb6ITrkHe3WQdOG?=
 =?us-ascii?Q?fYiXPEX+x63fMF1DTlsT8L026fMOuL9RZKCqISU3qyX8nlaoxu57MdQxc2fI?=
 =?us-ascii?Q?+NpSxtjsh5Xzp5q3R5YrnLXhbic+xibua7rjXsRPG1Ew4Uuyb6x/7xGfHr4B?=
 =?us-ascii?Q?ZAoVb+cAtlKQtKulJchaAnNC8U21BgrFSgshwFp4L9xP1nBC4dxby5qzAahw?=
 =?us-ascii?Q?BbNz6b5nkS1vWotjIzoUxuOV96emPSnZAQxt09bFoHdFc6a50PoDM6Vw3iJ/?=
 =?us-ascii?Q?yMyn6yLruu1OzOTF5UVTCSVmynsbZzqI+ozLXVCgJwNi9hlJHCE0BYIqlbcj?=
 =?us-ascii?Q?QGKipEomR63Z22g2mxSkJHWE3bEmPe0DK3WjpJuPAIFfE419iJ3L9W8x0pJr?=
 =?us-ascii?Q?zum71VhJiRvSNIfcdGciOj/5cqJKIoD36u4JHbgX0aMmTh3K6yMAKkDbAKib?=
 =?us-ascii?Q?V7rTt651dVfeZCj5EVx7vjkzpDrZnnCeAdptkoe5dQ2oh5eBTfsiA5mx4C9M?=
 =?us-ascii?Q?KM7YyXwkSGBEv/F/4BGBgpYi7KPtVHpR4ZUQfK1jWfFE/nEN3YDdILw22IQn?=
 =?us-ascii?Q?n1LF/NZvwfNxxkg96PWuyazVjlli72q/boXvGn0WKAN1IFBuPVzrb70p499U?=
 =?us-ascii?Q?qeUXcnaGGS/SzVPi6yi+tGuvjXioprSnHMmLaOj+XdXu8wmsopfV2mE8D6HM?=
 =?us-ascii?Q?kas7C5yG83wmAZjKZ1bWEgXHk43tccllvYVK3nhDUaEkCF9/a5UVg4hSDVmi?=
 =?us-ascii?Q?VSrO3PuFNd6FEC4N2EOM73AyvI7QG8/0iJPmrTmLzZ1qAhsgo7Qt0NgrBerx?=
 =?us-ascii?Q?RQr/slCHDy20DpyK4/M2LpZwsq5XVvEikvaOtsd3ZsbixVsvvk8DAbQ/tP3H?=
 =?us-ascii?Q?oPeVuqyeMD78O+F3WJuTVI+6g//+cRln3aqlK5O8/gCp04MWEVy+XwzGIWdz?=
 =?us-ascii?Q?7z4AiPLHeEFbTEkbiBej8a1uX05stwr2cmTlIilb44DxnE8aPKmCNqWSACb+?=
 =?us-ascii?Q?StZSm/aVghYkRDWbh6ld1Te04NR9eQpXk+94otDL+WeLxybrwD7jq3rzRkfZ?=
 =?us-ascii?Q?NGfz0d0ubKOf66dlco3Ft1PsYGUGrsDFhgKyBULVWfTCYLHuzMI4UUPfI/qo?=
 =?us-ascii?Q?9bSZQxXj5KDa+tfGIj0KgbrGpCScMn4Iw7R9Ff7jiyDakH2NPHzD4YviGLfv?=
 =?us-ascii?Q?qLpoxTI3cL6hwx2RUorkyhZrJAUUf3dBCL8ODRyxhvatGDvcH3KUTAKMpUrp?=
 =?us-ascii?Q?6tm16yVIfHNJde7ZomNraKlsjUmbkH6X3SXkXZuax5C5YCUzOxQN5wbvF2Y4?=
 =?us-ascii?Q?c7RsLXp27BAZsmLcoeiaBU4AEvPpCEiU6mQFy3SNcQJguyvfMZYI+vx1T/bp?=
 =?us-ascii?Q?/p7SLXFDEkX4krzfoIDoCijCTvmea+q+mcotSeQzmh2QdQHrq8X6a0ksRPCX?=
 =?us-ascii?Q?jw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 724dcf94-b40d-4f58-cb45-08dbfceaf8da
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2023 21:23:53.2770 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HhSvMtG7tuVGUeRiRzmzlmGEqxaU4C7zF0EfLSFjy+2trOA5rHPz3bg1wEdQJV2u6NfbT8IQ8T/3CNe7hucCIKz07kvEQAr5SEFf1i970ns=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5466
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
Cc: intel-xe@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Dec 07, 2023 at 01:50:05PM +0000, Francois Dugast wrote:
>From: Rodrigo Vivi <rodrigo.vivi@intel.com>
>
>The uAPI should stay generic in regarding to the bitmask. It is
>the userspace responsibility to check for the type/class of the
>memory, without any assumption.
>
>Also add comments inside the code to explain how it is actually
>constructed so we don't accidentally change the assignment of
>the instance and the masks.
>
>No functional change in this patch. It only explains and document
>the memory_region masks. A further follow-up work with the
>organization of all memory regions around struct xe_mem_regions
>is desired, but not part of this patch.
>
>Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>Signed-off-by: Francois Dugast <francois.dugast@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi
