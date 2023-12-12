Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FA20C4167B
	for <intel-xe@archiver.kernel.org>; Tue, 12 Dec 2023 14:05:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E68A510E1ED;
	Tue, 12 Dec 2023 14:05:03 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47D1310E1ED
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Dec 2023 14:05:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702389901; x=1733925901;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=5aGxmIXpSgrXXdu7H/LrQPe7C/9OgsxSKlTB7g/UnU8=;
 b=nEtMsF2HaX/bL6Zr5MDnRkH1JHz4Cq4AkI78IfGpOAAdgCqMZREFUCAf
 bVqtwlv09HvpgtK0S1UtqKgPbK9X3klpVAEsL97chclpmvGIraElwoLuF
 4V4ae71uTwUK/+29Ph3w1tOOC39Tpbj76eRBqI5weR7MgI+XDlh8S3gOT
 4bjS2E6Cl2fmVASFAlJDbU3YVFgWFxfYVFGJk0bFWhYExLj8jE2htqkOn
 2Ykp4aCKj2ErOvRAClBYA0zNR3oirHt2/OxxP7JIKNcr7UuKhNjkccUnG
 ER2XHogwo5ika56805POeIfJZxgPKHfcmI+tUKa/VC79/5s/0ovHlwVjS w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="374314292"
X-IronPort-AV: E=Sophos;i="6.04,270,1695711600"; d="scan'208";a="374314292"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2023 06:05:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="773555053"
X-IronPort-AV: E=Sophos;i="6.04,270,1695711600"; d="scan'208";a="773555053"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Dec 2023 06:05:00 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 12 Dec 2023 06:05:00 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 12 Dec 2023 06:04:59 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 12 Dec 2023 06:04:59 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HLM/XNv+Rnms679HDxd77gHlqgg+5pOne3vn1GjNE7mFRikix+nXbSQuBdW8AMqPCRdl5I/bk6xSE3IEe/zE0gueLv1u+/akPAqc2jzQ4l37StQNDN3iubpmfvRdZemoFeKKMzaVIferCTgyfTlh8BRBZZnSEKsOKAPYB52Pj1zXGf8MRF37uQBwn853ot8KRtLRmnULQ5Zs8WGuNzI/1RlyjK6eByo/ep5Wt4Hi32MoEyFpZ8GtkUUh9LDrnLSND/QvkdlKO91rVZK8UKAh0xN4OnBttZnxsM88N1XSAC5y/wl8jSX/GL2HsJ5vxCZhhVi7siD7BBs3G48f+t45+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xKb8gl51xdW/6FRTZpyPsW66arQie7UtfkydR07ol3o=;
 b=D4o6FhIc8+zQe0lp241RN5LBQfoEMysRgvSrTw9nWlFmHk/jxv2FyQagyfwQ1NWijHnGF3Mzw3qMe4acVh0o9uOkV18Mn/oAVNTuwRlcSMozC/R/SvMIruJYEg+jvsKZmJaX/LqbRcRQXcDURyWDaOXReLgGIsxFqqF1x9DUyHnCLMttPwmYz1jQtJAQ9Cl+vR2RjX/choebFwFPUGbsg1fLzPZ0r1cYjQQ8P8MrcRNFoCfwqR7Z0MT7KgM1a+G4UJcbFtnqg2rl9IrMbl2lmCnwKIsUqYgN1CEWE8L6NaQB2qZMsPNAWIJSnXMlY7b2hPcMtmJyj9qLwaV5la5+KQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ0PR11MB5583.namprd11.prod.outlook.com (2603:10b6:a03:3bb::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.26; Tue, 12 Dec
 2023 14:04:58 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b%4]) with mapi id 15.20.7068.031; Tue, 12 Dec 2023
 14:04:58 +0000
Date: Tue, 12 Dec 2023 08:04:56 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [PATCH 1/2] fixup! fixup! drm/xe: Introduce a new DRM driver for
 Intel GPUs
Message-ID: <fptj3hwp7vvmdgyewbmkhpdv7trhi5q5jwizkquhpxkzckw7tt@njmbgpvsfsxl>
References: <20231212031907.1120896-1-rodrigo.vivi@intel.com>
 <3dquhvnxk5xlmyei6374qmxnveshc62mh5vdemx62krqlqpacq@jrvgdlh6qzdc>
 <871qbryew3.fsf@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <871qbryew3.fsf@intel.com>
X-ClientProxiedBy: SJ0PR13CA0217.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::12) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ0PR11MB5583:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a9c0958-2fe4-47df-a229-08dbfb1b5360
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Yh39Wx7zfpWuNDIOLw4iEK9qxqM9bwvTXb2gXczxgxhyCZGWKdC/Dq5rKqoTe0KHm+hZhFXyiOkfqrOD7bw8Pad37f/NsedyXxnNoFHdQnpBZyYef9Z3xVOTV/T6003I72wOfrkTsy3rHegf4X8bjbfxXMAd8mBwTKkH2qByKGMynOY9U53dN/p3C/Jij0M+suyX8OZg+N5DR2Ka/opV8UUCd7jecvN14C/3shaTqzBiUdH46K/qzqPxWJJ84c6Xt9kpmGvO/2HmmSpGYFMfsEfcBM3OPLxBkbzIiHirFL8Zwcyfj64CBDCVBudWcwpTd/5GhlLYJa8V67t33fpHlc2qdWcO7GkpsHewbbaBxSLLnHjryQfRsm/N8hjESVd4lIQ608OZXzuXoDsOfD5Fd90VzGvvNeEBh8GKeuXJI26V0NLcyakhVdOKjhmLZ/tz7QrJA87Kff0eG8rFUVqCtJ2D7euVqpg1dYyPLFuq9yDFv6Bhwv4NmZEabX9Rc/d1C4+WISXYIUaYQE0g6yTVVvh3tODUrrA0YF4o+amJR+VcswgxIUs5TmmsdWVpbCgLrhQHRUK9wRvEBU2nQu60MIe1DzPRfy8tnrOiTjXlGHZlgK7zgzyvvFqSWa+OALvGjKG7oU8R9g1Nbgy65FMmQ0dR7X53mD1ud1KrTpJvcLI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(376002)(136003)(346002)(366004)(396003)(39860400002)(230922051799003)(230273577357003)(230173577357003)(186009)(1800799012)(64100799003)(451199024)(8936002)(8676002)(4326008)(2906002)(4744005)(6916009)(316002)(5660300002)(66476007)(66556008)(66946007)(478600001)(6486002)(26005)(6506007)(6512007)(41300700001)(9686003)(82960400001)(33716001)(83380400001)(86362001)(38100700002)(27256005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DPu8sxrsl0PgZTkGlpxiYOk6YNnqb06QM1TYJf6O364ClRbkF1k/q0kl4MB/?=
 =?us-ascii?Q?H5+sCiyapw0ZNdjRahkomFzDqKPuRUGQX9a2EcGB47xKHMGP7cR+R23B+nII?=
 =?us-ascii?Q?0qej4lzeshPb9/oEy5DhIQ+KLEZieDMhrrhEnzen2/8XqMRASa2ROdEE0TUu?=
 =?us-ascii?Q?GDYhffyDFkBj2oQei1nkzAVLIud4/oFfdHrd86cwG3Sd71M5D2mxciXWqthX?=
 =?us-ascii?Q?t+BMt9Qn72cgaWsQkB4a7GAzawAJK0LlnYkfJivVNg3/G3LWmTGBTNMBUNEl?=
 =?us-ascii?Q?CgCHxPiUsyHudy8H+/kgUaiXkKaXJOymoCbvvZaY1qFvL+zksoKwMtS5qLpk?=
 =?us-ascii?Q?dtjckgHBEWsD6NjBXFlA6fkfSyJnH7BCTSy3KBmJ0ttUkLXhxWwH2t+kxvtF?=
 =?us-ascii?Q?31ymRGuWKCd7CXO8t8bOtJMeVjiKkZ0OtrEh6WJDUQP2czsRJ7KotqezfULT?=
 =?us-ascii?Q?xf88J9WlmgNlWgooIrWb+RdEyaMNYIFgoyIH2VzcNnb8RmfGgkLXS4Sr3Q9M?=
 =?us-ascii?Q?+U415b168CrdnNlyQD7j8FJIZbA9k3ry7gWg2r4uiZeApdIdYM17pZZ+/mYI?=
 =?us-ascii?Q?4/xBC5jnOfp6IatadYF3B7ESEggs2+ha0FZeXkyOqhizD0SgGdpcBdAreR5A?=
 =?us-ascii?Q?5202f80hLDRrnbXEVMd/0pbH5Qw9hNzEFZHYXt2coHOmcb3bwcAGIgcp2yzn?=
 =?us-ascii?Q?Uw5UTM4ilto3YPvU+BxqjVC/qPB2JBPRDcqsAYWbZ2KzqkakcBaekM0hErHX?=
 =?us-ascii?Q?80WZT9PWAJ2l91H5o8+4Hix/l3RvuqP56BgK8wDXau0lCpPiKQCZJQm1bnjR?=
 =?us-ascii?Q?CvFlth9KIrYX64h48+JMezdUHKWIW9Md/HCqR3VeTw/4roge6PbGMt/rmlmG?=
 =?us-ascii?Q?kbEGAH8cSIInyCoF1wIBNjroPhFtTOAAQzGrWlZ1KDpZ774+vXRnIFOmalBC?=
 =?us-ascii?Q?F3GNsqlYQJAprPaVAMpxUSZ6oiEbEih2oJ8laiW69R9bJm7UDJWVNZu6GeBO?=
 =?us-ascii?Q?x+Fsh+mXXcQV1agje7fDguA4/M8j/AWTgwCc9N0Ko0Q03WDlX/SrYzbihy6m?=
 =?us-ascii?Q?5vP+TvbBh1aJ7B7XFlddRnRLJYpDXKZf6dnx+F4y87x7avlMjMA1iv2qWfu8?=
 =?us-ascii?Q?Mf0EGnC4VrkyzIgsKLHHxBH+6VLp8sFUDQtXBQ3cbB1uc0GS03s+w51n0yzl?=
 =?us-ascii?Q?QVUgnBb/ePULcdPmqdm6inO9kSTYaTc+H8gBPiNEnwuICvCScW4qGewFR76k?=
 =?us-ascii?Q?9Q3uaImH1gHkiqeC/qM3wQJt68V+l53uWzxBczUynrjuxhXnIWItEGzsWcn1?=
 =?us-ascii?Q?wTcGUYBylLMh/M77W/PKrx1JUbOOexoAf8qWJDhMSDztZgLL4LeiIARsDpTU?=
 =?us-ascii?Q?9ESmysZtOoYIju2WlmFjQg/8YFt0CcR6KPlw2hWSRQI8WocYEJWJJzJoEiuL?=
 =?us-ascii?Q?cTvBLr2giCJvsdypNxpuz6FqFiFgTgYKC3tmPlGDsoRxKNXutx9va+2fXWY0?=
 =?us-ascii?Q?gFO9ZiR5BqxK+VktLA+wepzq7khUq2fllhLqSDf59MREGq3deOYvpa0jNy9c?=
 =?us-ascii?Q?uOsSB2LxMxQ7zGjSXSGJuqT/HjX2mV3byTefIh/7JHvHSXPieytDOG3/gOpy?=
 =?us-ascii?Q?8g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a9c0958-2fe4-47df-a229-08dbfb1b5360
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2023 14:04:58.6423 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aPWVW9F+GX31WDkKjH4L8Wsj7RmujP3t8fO7dkN3iQckLOcq6zcUTCV+gLMEexQSVgqMzaVFKwmPfDnKpShfvd+XjmmPYLirK98eL41/10E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5583
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

On Tue, Dec 12, 2023 at 11:00:12AM +0200, Jani Nikula wrote:
>On Tue, 12 Dec 2023, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
>> On Mon, Dec 11, 2023 at 10:19:06PM -0500, Rodrigo Vivi wrote:
>> Since you are removing the only user, you will need a __maybe_unused in
>> pvc_desc, otherwise it fails to build with W=1. With that added (and
>> removed in the next fixup patch),
>
>The xe Makefile should enable W=1 warnings locally; have they fallen
>behind?

We don't enable it automatically. For a long time we kept it enabled in
CI, manually disabling display since it would give several warnings. Now
things are clean and we are warning (on CI) with display enabled.
Next step is to set it by default in the Makefile.

Lucas De Marchi

>
>BR,
>Jani.
>
>
>-- 
>Jani Nikula, Intel
