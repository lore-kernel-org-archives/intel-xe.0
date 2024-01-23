Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C663C47258
	for <intel-xe@archiver.kernel.org>; Tue, 23 Jan 2024 15:24:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3997010EB21;
	Tue, 23 Jan 2024 15:24:53 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE02F10EB21
 for <intel-xe@lists.freedesktop.org>; Tue, 23 Jan 2024 15:24:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706023491; x=1737559491;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=xZ8WKMVMgZavRDR6Jlraqp7zGZ+SD2cc9EVlorepyCQ=;
 b=f+yIASr6xjxjs349tZWcuZtaiUTwtc2eWOLi3HUY5xrkITOelfkoi6OP
 8ZqfQnRV4W9r6BGmIMV3MB47o6wKWPbV726VYVEKDtbnb2vW8LyQ4IwZn
 JKBG/2kaoRpSlFmui7IrzBzMQexJ+mAV/qBWZguC9JXYkQ2jFkvgl1ddn
 jm0p74+7wlr6XHls6b1vX+vja/77igrBL0sHzizuc7XJ5ljtV5+NSCawE
 JMWs4A4XDi1/aoM506EweS2dJkq7VD8PEKnheTvsucmC7nZ6u6eq7m9bX
 ApaaHJZw7idTGZ4nlJf3siYdVu0FFH/dm8Z4BmBDojXt8Yk/VtksD2pGj g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="14907145"
X-IronPort-AV: E=Sophos;i="6.05,214,1701158400"; d="scan'208";a="14907145"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2024 07:24:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="909322874"
X-IronPort-AV: E=Sophos;i="6.05,214,1701158400"; d="scan'208";a="909322874"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Jan 2024 07:24:46 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 23 Jan 2024 07:24:45 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 23 Jan 2024 07:24:44 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.41) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 23 Jan 2024 07:24:44 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FOeP+GMdHvF2nwMpY+IUWW1LjMU7Ejji8XHIaPqsrr9/2dNigGRJ8GmI+H3A+LMAC4iN7ylz0mmVkqvu+MZs83Nt+K0ZEDdI+lmH81xUNSzL3AeTLzcplHyXIp4Pr2sjt5v6zzTfG0wF7XJAZokomLoNrqmXmMu5hWqq9Yxr9glivs6aonsgqtCamSKxPlIihq48w2rSnPRYcJA/lEjQ4/8WJkvZBvWm1xWyPxXm4tcAZ8pGj4wzb9rJ7kYAadA4XkzYaLN9Y96QbLTBuLB5lrdZPKNWHp+zyukoBQrLKEVGXtwSXqB/NnPjauc7vAx+hjiMrEjLmv856MLqwBz2TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3GzqSIRcBmkiV9q1hxqg9rdHqM3Ju7VfFbq0HsL3OeA=;
 b=PKYxhUNnWr+V1PiUTMGW2ZwHXuWcYR515gvQP0QAFHRUIRvxEpbiltFOUcZSO1kp2CT4nK7rdh+HOh/Z+JK+0epaYd8EInZ5qYKT9aIZOqv5eBKBtW6Beq9akkcvvLwPMYFYhrcA3+Xwvsspctl7xCAbu4gDYIBMA1zgJ1sqjDik/YuAkQjA5iRSvyN3GpG8gYx2Ti3KmMWOg5fQ8ThUETXKyZUgAnXV5gYk9NMnkRc7iIROcaLlOeMsTq2sg5AExyC86DvswpaJz7ftKX/VuuoLDxNCxJRKZ3cEiWUp6iZrRdqFo/OY9vXG6bvjiM5MN0/wlDIdw/VuU+hwyua9Pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DS7PR11MB7833.namprd11.prod.outlook.com (2603:10b6:8:ea::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.34; Tue, 23 Jan
 2024 15:24:42 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954%7]) with mapi id 15.20.7202.035; Tue, 23 Jan 2024
 15:24:42 +0000
Date: Tue, 23 Jan 2024 09:24:39 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v2] drm/xe: Document nested struct members according to
 guidelines
Message-ID: <sikedk2l73idxkddxmpe53gefdbovbtbto5jtlfvn7rkuu5e67@ghihexhcyw7h>
References: <20240123130000.13559-1-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240123130000.13559-1-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: SJ0PR05CA0139.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::24) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DS7PR11MB7833:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ccd3e07-268d-4e96-193f-08dc1c276bfe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VkyqtwYm+XODet2Zetr6EByRZVj7/10zKsjxfygkQnv7UNp//O6/RM9TW6JdqoKSfIDNJfVJuGAg8AiJPbSDl6PgHXzi7h2M7XUjGy7h7pVBmeSXmPaV/C+rHETxrNoSuBxCzU59Qgm46lqsR+kV3PEnlrZEgXNz+dRN1EElPbMoUzOCGqNi1N63+ys3G3T/PpVJaNvwf8lCTc2fgA8JHpx37Dld8JoMzJJW76+Iy3+HkAEZCchI71pch2vkFxuhtMO5doGGYphd7vOhqJcIvRt8G2+ozK/88mjIL9WkFfv8a25dmCVDFriGIn3OdRyjb1bvONqmfz1Xr1CBSlXBfC6LjUSJ95xnCblOscbxyFGVC5twAAg9oB36rMFkvxYxhgNvQCvB9xYLxAgG5gscAw0W0ZW6Se5fPXp1d//Lo2L4/wIkuU5Bz7XVi7fgqpabkpbsbRPUY1PwVxpVlK4ofa5LvOdVtmI5aZLKlTiMoMvDVoh0vxaJ7UA/RgsJ34QFjSXzTEnB3LtzdGnh3QJjWpC/dmkhbBKL7AjqcKAROOddj32jraTIBBbWfOKqz44sDXBAwLJw5wRHc0v1t4NvacDptQlonJQCGY7Dlh6ld2jfpgqS17POByWMCa6Tu0ba
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(366004)(396003)(346002)(39860400002)(136003)(376002)(230173577357003)(230273577357003)(230922051799003)(186009)(451199024)(64100799003)(1800799012)(9686003)(6506007)(478600001)(66476007)(6512007)(6916009)(66556008)(6666004)(66946007)(8936002)(8676002)(316002)(6486002)(33716001)(26005)(66574015)(83380400001)(2906002)(5660300002)(4326008)(4744005)(41300700001)(82960400001)(38100700002)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?/y+pFgIlpIhi2D/6hJz4Azr9YkMeCO6KacZTsyjvOO26A/DuJdBtyFqIuB?=
 =?iso-8859-1?Q?sa2H6fnLsXMcO5SWm1FY+XoIf7bWoKDPEQNGZ3mQ5GGy92Y8C3tjokm+SA?=
 =?iso-8859-1?Q?/aE5tlyoh2ir+rNhF1hCPM81yXOZDfux1XmTYYSZNI3caKJvMGK+yOhtQq?=
 =?iso-8859-1?Q?9rVXNBtrgm+HFMgup9NHaJtpB+TALnD+Nd/gSEAoUw3Kc+6A4HqIO9D2pe?=
 =?iso-8859-1?Q?WkKel99cbW4jkrvJ5rpyHY2NDquG+F2ura0DsfVccnFns51HgovUIQw+uI?=
 =?iso-8859-1?Q?maTbsgOmTJ4A2SljM4hmeGaZUXd3ngG9VKnyMJPygzRSBvrLP22awkVMkP?=
 =?iso-8859-1?Q?PeuFIbk+jQB+cVhAnWOm2Wp5Q3qvI0n7nVLBfNmQ/8oZeXBII5wfkdW3Su?=
 =?iso-8859-1?Q?umysDSKfRC4P1PVEZ2U8va3ALBfgSevgpLbDVnGofhRY986YR4ZUgjgyxD?=
 =?iso-8859-1?Q?sbBOQBR6Huirk3fhz/gs0jQtVuCgv7F+DHJ/JpF4Ac0D85eVtIECY976kk?=
 =?iso-8859-1?Q?CA70ozZvqEk1L4E/xaWvWFbqky3PBngSHXIso26HT7Z4BNFrzWV9zIuOsO?=
 =?iso-8859-1?Q?mNtN9IL+w3lmRzDv81FXQILo4GU/HpeB6JUctY/GfveHbtMx4g5JQbGq4z?=
 =?iso-8859-1?Q?R401UlMAgSDxob8fSON92Xv0Ni9QEgo5BJqT3ZSuvad8JaFtqoP8rYhIfP?=
 =?iso-8859-1?Q?vrRPXa7BTUjtW/l49p8lGST0dQZRMMGRx3IrtU7zYOraZEMKJ9YcjQU3mw?=
 =?iso-8859-1?Q?0ObUbVvnHE51eoGplfzJfPHggau5SrxVJQvrbQkdd2R+t3/DScmD0oYtq0?=
 =?iso-8859-1?Q?9NfwFFYTOx9c6jHolRhdYHdeV4h2rGb597EHwkEn3moHWYnecKbYiOxex6?=
 =?iso-8859-1?Q?n78bLM8UMshUQyDGswlcyh8Q1dvCSi5swWmPNyR8OyMC4iq/+rnM41cLms?=
 =?iso-8859-1?Q?wtSArN//hQVNBW7P1mg2jO0HW92CcLPZIFT5DH5nnDv7HZSCvGYGDuVnbG?=
 =?iso-8859-1?Q?Av/gu1/d8BvWAhULWRd2ZLEC33UHoxtuqCfiV36E8bybdsi6w8cAmOmlEt?=
 =?iso-8859-1?Q?75UgqOxfBLLBA9LOI70Zi2Rfg3F3SZ5d+cm3gjOjZ/VJuqwB6bogPEUAPT?=
 =?iso-8859-1?Q?KO11jQfbqlVMlQRzdJxtCPIMjKHk7m4f2IBofQ8Yz+tuAWQ//tqDAaRTDH?=
 =?iso-8859-1?Q?jt3zddpLs16ehPOVkRotudpGZgpI8IpV9NLH74DP0dcXIrcuZDu3gVvOZV?=
 =?iso-8859-1?Q?YTCTiqW7rFTPtntJvFPEofhBVvX3xKMn4yYYVv/voIu8FeUgOheCLGwY7Q?=
 =?iso-8859-1?Q?rPp8L0zzTzLvZyut9F+0WwrdbRaF+Xv+8pU+0pRcIAZYN0CQSLyuTTOSio?=
 =?iso-8859-1?Q?Gwgf9iUdLEMpFL5+mIF9q4+4IKSrFwQEdLMc0LxwFyX7YSG1EGUfs6DAO/?=
 =?iso-8859-1?Q?E+Dp14NoKhAGE2C7mcYDI0Do+eyRuBzJIC02aH2/hc/0RJ9Gz3DVC3Cg3Z?=
 =?iso-8859-1?Q?jjPzVPqc0LJeLl/sEn33M7+8pgiGGaJhlkT4p7gkI+rb4PKJSXiWLdM8RZ?=
 =?iso-8859-1?Q?qWZKvGwsxq5lm31Kz1PXqONeAXiJ4bXU6GR8EEyt9BaluAlE30U0p8Ifg4?=
 =?iso-8859-1?Q?IkxoVqScQTg4qJDUq3TI7qpfNA73/JW/kmwmC+HQegOw5Pl4v/KfF2yQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ccd3e07-268d-4e96-193f-08dc1c276bfe
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2024 15:24:42.3655 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: clkXM1oBOHMGnhcz3EU2R20iFwU3dNlWFKwcA+oyJVs2D4LyYj5F/N7pLR9w4fn6nKTzx/ejVnszjswZkKrc4TgihxtoH9NANCmtzsZ5Czo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7833
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

On Tue, Jan 23, 2024 at 02:00:00PM +0100, Thomas Hellström wrote:
>Document nested struct members with full names as described in
>Documentation/doc-guide/kernel-doc.rst.
>
>For this documentation we allow a column with of to make
>it more readable.
>
>This fixes warnings similar to:
>drivers/gpu/drm/xe/xe_lrc_types.h:45: warning: Excess struct member 'size' description in 'xe_lrc'
>
>v2: Only change the documentation, not the member.

I replied in the wrong version. Feel free to carry the r-b here.

Lucas De Marchi
