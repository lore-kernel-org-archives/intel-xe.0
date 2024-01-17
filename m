Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF66BC47422
	for <intel-xe@archiver.kernel.org>; Wed, 17 Jan 2024 07:45:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A69610E626;
	Wed, 17 Jan 2024 07:45:10 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9464810E626
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Jan 2024 07:45:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705477509; x=1737013509;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=s5Eqr3NjE6jIyZDc8mgwO1s5x5FBcgSeEwpIiT0imHI=;
 b=iTENg/3nbLAAK93pTnEIxlt6xgFg4N+i2CxxafLQrDZ8nsBgZP5f9l7G
 ZCouasgABK9eE0MiT9z6NrC69o3X0IAnbKsqjdLJczeKYVSwnqOy2UWG4
 fBbGcpUouzUlEnuZdlhKoU4AB53v2HPI3OnqtyZLW33Xm1d5Cwh0/KwxP
 4Pb5sDE636Sr5qhZZpZaHi+Z/TjD+hTIozTtYGmk6cW3YzE9tsQtE6lqv
 gLVLoaLjKgbAPntClytmingr0Jjv1Wd5hmUdsUf6IBBCCwMaklfmqwbO+
 4+NeLxlIiFEONmNbL1y/TcxZ36mo7S2d2zwNTa61XjXfeWVztXX1bvuq3 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="6855306"
X-IronPort-AV: E=Sophos;i="6.05,200,1701158400"; 
   d="scan'208";a="6855306"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2024 23:45:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="733891591"
X-IronPort-AV: E=Sophos;i="6.05,200,1701158400"; d="scan'208";a="733891591"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Jan 2024 23:45:06 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 16 Jan 2024 23:45:06 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 16 Jan 2024 23:45:05 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 16 Jan 2024 23:45:05 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 16 Jan 2024 23:45:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Nu0aIaz8hnUMbZnKkDf9oqH3tLkVXiCAwRf+inH9QpUstz56cQEPElaVjcL1p6IWswUbJa5TsezI74KpiEt6IDfpRycxiwMl+XPpwU5RUeHKS+TNVCCVcklC+Dr0//qb/4z7t697kQEkjxKELTXQTUHo9QGXu6B27i/AQOE+yVBvSjiBHat0lUNhcesrvvJrVoZT9DX+vL4ZEEHTa/Sz1kIDM6GsVUfWAHJZflXaGf+2IizTjg185MMnMwi7XV0JlXQjNcUBgvH7FA2fuLMSqCPYM3LA79Geo9jozbLNNmu/A+2FJ73kk3VXIfKi8P2kJsHs2tdCElJOcvtzWnY7DA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s5Eqr3NjE6jIyZDc8mgwO1s5x5FBcgSeEwpIiT0imHI=;
 b=bAPbYpboGPz59fNpDL+lk8R6rUzkMeZpGw8EG8GdVjLmtVujyDyUrrYQ80C7ZIvk5dDu5t+XFYG97d6hi/F0nIqwr5uA5Uh6yi2f/q56iCnAUv6VQMT+GNUZ4KUrcEkGBnqH4EX8TeWuFaK4OTTLMcDvJ1JcflQEF58JALBdht3sz4qVsUmxJCAfckHWCa/5COPN0Q5cikeIwbWVEuD9rofGqviM3N27N1AE5o883bY+smaUcQmGN5nLa+0pMK88xxemf+q2cMHrh13/8nijy1bCa/zXQepta0QvM2imTs38wKA1sH0p1W9jJc+k7Mr+zAadzdzum5dkRkSaHYYCaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6952.namprd11.prod.outlook.com (2603:10b6:510:224::13)
 by CYYPR11MB8386.namprd11.prod.outlook.com (2603:10b6:930:bf::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.30; Wed, 17 Jan
 2024 07:44:58 +0000
Received: from PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::f6ca:b25e:ebc1:10fd]) by PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::f6ca:b25e:ebc1:10fd%4]) with mapi id 15.20.7181.026; Wed, 17 Jan 2024
 07:44:58 +0000
Date: Tue, 16 Jan 2024 23:44:55 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [PATCH 2/3] drm/xe: Rename num_slices to num_cslices
Message-ID: <ZaeFd8SkLm7awM16@nvishwa1-DESK>
References: <20231216214120.7394-1-niranjana.vishwanathapura@intel.com>
 <20231216214120.7394-3-niranjana.vishwanathapura@intel.com>
 <kmp2gi76g5obllv5f5tnnybwhdg7m2elpbycfv3ireg7esfdre@ao6mt3z7og4u>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <kmp2gi76g5obllv5f5tnnybwhdg7m2elpbycfv3ireg7esfdre@ao6mt3z7og4u>
X-ClientProxiedBy: BYAPR04CA0014.namprd04.prod.outlook.com
 (2603:10b6:a03:40::27) To PH8PR11MB6952.namprd11.prod.outlook.com
 (2603:10b6:510:224::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6952:EE_|CYYPR11MB8386:EE_
X-MS-Office365-Filtering-Correlation-Id: 180f4e31-0966-4a31-f429-08dc17303450
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4ZcXAfyzbvInvQbxeN9VPgQoNYnM+xEFzcIzejJmhfhoey13TtyQx/cOVhks0IhtWvwmQe+6v+0iCH1DszPlZ3xAJt7Zr7BoKQKnnOhG75SFCHKbcQ91u9IvYG3QOTdwzsbW+DA9XtZy4WrlgN50ybQFtqfPJudMepiM34iefJNaqyOzEqewT/WRu2mge87o1PGAYrPTAXl4NxG8sIkUTfABb/fxOH0dzTQVA/nPGU21+Yl7rdcVVKajp8EbADgah333koh1JPW3KOv+4okvqcn5DZ94pIdXd5HMk2AJfNXQSOkyOFWYcSkUO9IDcIEkVAFwlpCmmvDvbwaA+KON8qCXKNLfSI88vb+CCdzR7vuZg0WXvJxSZxZyndfiPcf7KNXv86MaXT8orXQreRcnjkKSerXZii4GlmV5Ysg5Kz15tgGYyrRKrV/uCwNilIMm4RhoA16xCwcAMWdUgq1wmdff77oEQiKFiAHIyRb6QrR/vP0+i+WW7J0d8lY1Edhj5ncK4JY3/GejiVXXZ1qm4ihLm4ODn/Vn6IPmIWsn0qT20FXkFIj4fp63q/p7V+Ej
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6952.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(39860400002)(346002)(396003)(366004)(376002)(136003)(230922051799003)(1800799012)(64100799003)(186009)(451199024)(6666004)(6512007)(6506007)(9686003)(26005)(38100700002)(86362001)(82960400001)(2906002)(41300700001)(4744005)(33716001)(6862004)(4326008)(44832011)(6486002)(5660300002)(316002)(6636002)(478600001)(66946007)(66556008)(8936002)(8676002)(66476007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?W2MfVUnwpjsIM0cGcQZWQg24fRXiwmms51bu2DS4l0z3P5iwb4AmVjgmTbT/?=
 =?us-ascii?Q?QYDMVIDdkWwnNsN/8y6efWtQRD1fnGzjd8O83vFhaZ4aIPf1V/0myX9ifi2Z?=
 =?us-ascii?Q?vN0VduvlNZLdjC/imtYu2xlLfbxK7Ts9K8IlpsbBP4woeUyAMQy/k85FTrwd?=
 =?us-ascii?Q?xVPv4J3M+aiX4PeKMAmkfLJPUki4HRuh+6suGThmk3eDFf7PCHivfnH+IxP7?=
 =?us-ascii?Q?has3wC/hXdjIjOEzTxNuBH1gupWyYojCppnj9yxvU6Mrj2RmNfgeOOBelDNV?=
 =?us-ascii?Q?kIyE1mL6Vu2xCT5jDY9a8ydOSW5HrYHW+3nONqYz7bKxvFxONROexoEkffv6?=
 =?us-ascii?Q?kxEQIOky5xytAzfdBPv1LN9eIvLB773G9PE2MjFz6UC60f0hYLEfPYjfKiRc?=
 =?us-ascii?Q?6YHiGiyS14DPXZKuYta8MCZp7vb2bS+WXO0K/wXqp24UW7oDmxLEvMOfIDAr?=
 =?us-ascii?Q?u2odIYHM8X/YWlRoulvSeREf1gYVuyhjBy7dhu+cXIZ1nVM8r1Y4uEk79FU3?=
 =?us-ascii?Q?z5FiVlZWhnaNqZPtGENJxVfWdL5dZv0oFKrEID5i7RFziZdj+zNhRIVA4lXE?=
 =?us-ascii?Q?0QpIkkprits/XFS78CmOJr2eHdbxvXtgSEVdPqPwLnAoQI1fszCuW/IKqA7H?=
 =?us-ascii?Q?hNYJhAVJwL0CA2dPneoUNJtYb+wABLymbQkV9Ezfs23Fipq2VUC2w3JeeVtS?=
 =?us-ascii?Q?bzG3XDLLyLqzSKZ/uJmVN6lPVBQWrICBKfCZi5uJA5B7KRwkP0dgDG3+KNUy?=
 =?us-ascii?Q?xdkbQSdkk+A679vSLEEC7FkzT27vzMaubRXnIsWBHuw7vfqp1RYc5NboJXJt?=
 =?us-ascii?Q?vsfMktZo5VGe+WT5R57HgaMIEaT11kqYA8bhlFD9bWEx9cFAXPajWvHdWu6J?=
 =?us-ascii?Q?/ATilwcsmyXIV3ZcEKxtuOlhhfqO48YKzH3fgnq5SK7MPLRyAQ6edH8ky1O0?=
 =?us-ascii?Q?tmLGscb8DyRLIcT7KwIurEGYu1hSJ8lhtr6qvQNYcmpUQr4Lg9+xQzzI9iM5?=
 =?us-ascii?Q?CJ7hVne5oNFc6BnkAtAv1T4Ma5ZNhuPNxESReyuRTHdEm3PZsz5HadsKj2eW?=
 =?us-ascii?Q?W9e8Fp19KlEjB34eYOripzhoVkBNSj+gjBW4kezZAmkbxZuszpCQJl+TshM2?=
 =?us-ascii?Q?6Wza1TikcG8VGm96BapDBbKuUJpgXuvrhse0XAtHxuVgjfYCvpHsDKUeEEkC?=
 =?us-ascii?Q?h4/9DfQxBzYUE98XJsjpcL0oBuQQbbrOXW2k/6Tdq661JX45E3VvieHcAFbT?=
 =?us-ascii?Q?ZPjYgZbdH1XE2heyVaBO3VGRpF5h+LLV7QTL7HLZoBGFazP8W4+oNiSPm9CP?=
 =?us-ascii?Q?m5q2mBFFaPhL6js66eqpI7QTcM0MrzIdF91dbIun/1Opr2AEsyCwTFBe17dN?=
 =?us-ascii?Q?nZoB9k8koIEHodM5yHZqWBPeJl+TxhqGUiH1nmAk5ckL7PF4CoD33W+V12pV?=
 =?us-ascii?Q?0xp6R86b+CdCWVuDSeZEDo42akJDQthEYQolSflX0+/ATKyXXH61WI4e9uqJ?=
 =?us-ascii?Q?j44ISqjBt0X62jH/70hSU0DTaYTCVy9Au6PYQcsvTHLpj5dKy2xBo4H/OtOA?=
 =?us-ascii?Q?k1ql1ipF9v1w4Q/lwILxPuwXPW9wq6UnKnUE4hEfdxZIDjuBkuhfLcqd0vyN?=
 =?us-ascii?Q?vTFIXAidvpbmppRH3C7NanI=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 180f4e31-0966-4a31-f429-08dc17303450
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6952.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2024 07:44:58.4211 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kkjOF9M+2lEG8iIqbjH2SF06wbcNxi2u7/wyMSuDCR4vRzg5u70pC4JFirsa5PndjpDWgCangwwkDmk0PTMHI054IA4eE3aLaoUVS7Gvcl1ovcBwYsBWWogYcKmNHQ9R
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8386
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

On Tue, Jan 16, 2024 at 04:29:20PM -0600, Lucas De Marchi wrote:
>On Sat, Dec 16, 2023 at 01:41:17PM -0800, Niranjana Vishwanathapura wrote:
>>'cslice' indicates compute slice and removes any
>>ambiguity with 'gslice' used elsewhere in the driver.
>
>some of my comments on patch #1 actually apply to this one. After
>applying all 3 patches, there are still several places using "slice"
>rather than "cslice".
>

I think only comments has "slice/s" usage now. Most of it already says
"compute slice/s". I will change the remaining to "compute slices/s"
as well.

Thanks,
Niranajana

>
>Lucas De Marchi
