Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62D35CA0EEB
	for <intel-xe@archiver.kernel.org>; Tue, 12 Sep 2023 15:39:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E15910E431;
	Tue, 12 Sep 2023 15:39:47 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01F7710E431
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Sep 2023 15:39:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694533185; x=1726069185;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=F+3o2Y3LiyiL98SAChFNhVwi2ymYQtrCDCjeQE1kCLk=;
 b=g1Tt8KwVrht/XXWtbvK6+B5g6qoQNOl8f6JaKQ3FOuJbE1LmXfqjkFS2
 2uZWewEvMRDYg/N/49kyWaSZPUwR9GKk88HohqSJ1zx8BcCr35QsOMySH
 Rxp4G1e9AhHFZOte+aNPbwxiPzENok1By0dw/JV2pW34PMLho+RG7ykiG
 dKL5NhHu7fWWVC7YYy7ljkLGT8/pdriA1xfNKiv61C9TSA/n3o41VamrY
 kU3BSB/WvU7pP/qlKlz5+mTFVqqK3Drz30tT+5bGqAZVEdkekpIsmnfy4
 SJW6EQk5bWNJp6OvCeyaGO/qxOCkLXgwt84HyIZlz7aGhp0ltfKMY3rwo A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="375741460"
X-IronPort-AV: E=Sophos;i="6.02,139,1688454000"; d="scan'208";a="375741460"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2023 08:39:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="746934810"
X-IronPort-AV: E=Sophos;i="6.02,139,1688454000"; d="scan'208";a="746934810"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Sep 2023 08:39:43 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 12 Sep 2023 08:39:43 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 12 Sep 2023 08:39:42 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Tue, 12 Sep 2023 08:39:42 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.177)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Tue, 12 Sep 2023 08:39:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y5bJEaNZUHxgRdnhc9SkpMINW52E7vMis97J0GLMiOdcQC+2dy/XErYRRRHuSdoRGonog0ruoCjJZIJvXYgvEQvYpfzFL0sjXdHy/yiOBTiZR4OsyhTTOIiGN0nONW4SczaHUAYdknLEyEOZDfzFAaI4NB07Mm7wlNX1/F0EgwvYrVwVjfQPMAh0xTzLdpqutRM0hz/EdR+pqs25+BI8GppCZprfpbg+85zEH/B0Slx6chjwnxk4yGPtc6n1ivvMimr5F8SR2VM7T/508wh7OfhC8qgIS5u3zcvmqk6WBEX/XZ0KyozVLiIPrphcAffBAhNbjfP5yvfWuvO7sEV03Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ut7Xwt4LvRJdsdTe6X4yHRy7zOvSbpJNqzVm/FdmEjk=;
 b=MTgTMgZJuYY70GMrjqcSsEq5aQiNf+3JUAZ3J79mCyH8leVGUcytEHV3J5VJ95UqRfRdi1R4Ztfdq16AUjzyuOYTIoy3Tf1Ne4XYXtsofM/GCEzK1imQcx2MC4yzt3HhYMmUpR1JmYVJeescuq04VsicYp8quYwKGz7x4eT6DIUErYP7ftHOH7sunxQWVtUoNDp4gTMaBC+F53Vz6lOhjzJ7j0uVqRVjgIlIi2CZitiaz0fM9kYq1FWeE6vwLUyXhjP/zVctWMvO/4H6Rtd3Zi3IMTC17cR3cA7zo3wvdN679aKC3Wn9zXAG7kMa2bVGEjQKrJdi993FWDw0MPY5XA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CH0PR11MB5316.namprd11.prod.outlook.com (2603:10b6:610:bf::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.35; Tue, 12 Sep
 2023 15:39:40 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294%5]) with mapi id 15.20.6745.034; Tue, 12 Sep 2023
 15:39:40 +0000
Date: Tue, 12 Sep 2023 11:39:34 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Message-ID: <ZQCGNl3RjgSYs4Sa@intel.com>
References: <20230912083635.7-1-francois.dugast@intel.com>
 <20230912083635.7-3-francois.dugast@intel.com>
 <87pm2nd3p1.fsf@intel.com>
 <b9a8df25-d070-9339-fdb7-2b4cd9d66fb3@intel.com>
 <871qf3y0qa.fsf@intel.com>
 <268cacb5-2feb-b43f-325f-5aef9cf8951f@intel.com>
 <ZQBz0Mk3O71oebl+@intel.com>
 <85abfd0d-0eef-b90d-37d2-297cfb53db1e@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <85abfd0d-0eef-b90d-37d2-297cfb53db1e@intel.com>
X-ClientProxiedBy: MW4PR04CA0258.namprd04.prod.outlook.com
 (2603:10b6:303:88::23) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CH0PR11MB5316:EE_
X-MS-Office365-Filtering-Correlation-Id: ba606c6a-b2ff-4d24-9e10-08dbb3a67a33
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: j7bq8RWTMvHT22rF5v4WcEG4stCI8h0mrr02u43eR/1b6YNLf6tfUfA8azgfmnlaHLiC884WImxr3MxSg62ASh84gB+gRpTkLkxjhjvDjUPnbymlgiK4RQW4ypRDIOMcBUxLFSpDnjKr4PehUJLPMANLwcHhchHmUHOGoNagsWfkV8vEYZZoElro0f0Lh7G9YomF6soMxpbl289v5TkGBuj4U58fDDawlNbyzTr8Kbsv/mtwqyvN4lAT3zoMczf9BizCFK9Os5+t/g7hJvlNK3tW3mXcz0oAEyXYqpoXxuowKGLUBmplDALg4fjNJfcf2JAzQcDhrbXkEJfySqimd8h3NLctQZbq5iMQBthVRFjLz6m/+zd3+92rIUtpq3nBnWiqmuXBFGuE6o+lHdva0vpfNuXz197AFIdtgt2gJ5VJ/CCUFpim6xIlMZQdhCfWOgysTfi669JGNXhfEYOc7rMKjNxAw1zH/r8XSMet4/M7yrhWFJ7SVITiKmwEgSCFvz6YgI8mh4coBbjLM1MkUtSVXRpB4Cx3E4iwU+S6F+vXuXzMyAeR1+6EPGutZYCy
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(366004)(396003)(136003)(39860400002)(346002)(1800799009)(186009)(451199024)(83380400001)(6486002)(53546011)(6666004)(6506007)(6512007)(478600001)(2616005)(2906002)(30864003)(41300700001)(66476007)(37006003)(44832011)(66556008)(54906003)(66946007)(316002)(26005)(4326008)(107886003)(8676002)(6636002)(8936002)(6862004)(5660300002)(36756003)(82960400001)(86362001)(38100700002)(66899024);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?ZJIXVYMUjO4BH8HzV4wipzbinxJMK42ravzszHqhgocmj8Qivq4Bv1xY/J?=
 =?iso-8859-1?Q?1syEtUugDeKKRmxtd55JcJxS3HF0ptS1Myg68ozzj+J9ffJwHkfYdkw2xd?=
 =?iso-8859-1?Q?+4TYbAqgs3nGwplgByG/J/OlB0bJETmBIGLGK5lHPIRbCJmBxfLI+/nmQO?=
 =?iso-8859-1?Q?TMK7alm5nelP5WvNNKVzoWAK1QM1wsBOqqtwg8qc/vMaaTVOZURrHOEwE+?=
 =?iso-8859-1?Q?wJ23kbTZRzyJ8C3oPelkjsbBbfPP+fCK1Ww4qNFOiGguRlpjcJcHYGllQZ?=
 =?iso-8859-1?Q?X6uIuc0OYr8wocDH0xxavkJtz0j9GpLoo9kagdVG7opGUQbR7KpdZsA6Z3?=
 =?iso-8859-1?Q?5t5GuZ0OhdIkT2Sefir7kv/l4yHEPoWwHpuQGylV9qkzj/aosB54BpUzzV?=
 =?iso-8859-1?Q?vkMTowkzXl1beJD9CmtOwnOI3/gYOsXzSro13mzEkB3jh4g8lXsHx4grVu?=
 =?iso-8859-1?Q?j0btqeYr+M8YBEfBuW+05ZwgWTOO/iXhHMOqC/tPY6PRlsWDxmtu05Hm6a?=
 =?iso-8859-1?Q?Ol2RjFb5FwiQnnt32ZeObCRJZuRm6cvrJJXdTOCP9xBfNVg5qpLIshgbhn?=
 =?iso-8859-1?Q?Ie6M0fZopQKbeWPiqNAShfWJMxYMLwOUbsWVqjSLBT4YGEpzKvd9b6F7IC?=
 =?iso-8859-1?Q?TTNqJQy51e/rSJhOGXCA4MfTGLe4J+E/4COMC9bItmEakQFGowJ+EhDBMR?=
 =?iso-8859-1?Q?5XQixucWBPfyR6w3WsBbIV7DXPU+0cMXlzO0TokGMZLg83jhh6zKEljuDa?=
 =?iso-8859-1?Q?eURpdMzlXYL3+FnSnv2Yh47/AqR+J00pkV2cbjIKQ+/35DTAR0lMx1lZrY?=
 =?iso-8859-1?Q?COK777digsQuUuREr1Y98L100h4nbPL4Ba1EvV9potHW1nHTzBSt5tVIJz?=
 =?iso-8859-1?Q?/CYTPO7j7zEndPuptXZ+hx+Vv0BctLPw7eZQfyGpsALJ2m2ndiE3iQMGlH?=
 =?iso-8859-1?Q?nw65A2nqKBWMNBlZW2taO6q7FG/x2iQPzfZ2N7KfrEWwbPKgTCJMAFoCYj?=
 =?iso-8859-1?Q?AiVvOGNcWuioCDPJKyWN9FnPXXbXsdRIiN8w2+xlNTzzZj11o2N3cZZXE0?=
 =?iso-8859-1?Q?HHxmGI5rffUDJAfTDuSZv3G/52ugEuBRRZyaPacsNpjJdFoRtvzgUYMYj7?=
 =?iso-8859-1?Q?sck6mVvfgHq6sjO8kQYTF6AfKzFfU+f9eBp0p7JF/rG9oHQhxMDLTk8qwE?=
 =?iso-8859-1?Q?/VGMOqkCSNhProWU+CJmvYMxci9Eon+7Kvbbe5/iQnSS4bErBzmiwnaHu3?=
 =?iso-8859-1?Q?5bpzMRVb9xoN8okvbRXHBPdhIi8ITjdz47h+u2b2G3m8NI4B4IkPghmcSx?=
 =?iso-8859-1?Q?3jBSN4X5oMJ09YND4Ozp+KNEDcsMRcsqzWnUj1qu+/5RTR6bI2V4sCfd55?=
 =?iso-8859-1?Q?1L3fF0XTF18zsJ/gvFRz6F39iA6mw28K0PZ1q6BLbCI6Wp9QkRM8/ZFblm?=
 =?iso-8859-1?Q?EpFFB7N9dNAwplxCugtKlUZsSnFUmBCCYXT2IPNbQPUXt/rqhOwVgH4Gm6?=
 =?iso-8859-1?Q?Ow4ZDcK9bHa5DYkT7V3pD49v+dxjI0teKMAzHQco44lcWs6DopuHE1kWnE?=
 =?iso-8859-1?Q?S4h2MpWH0H0T+bHNaMghQiitW1xK2ZGjZl4YnVD0X+COGwOau4qNGFckbm?=
 =?iso-8859-1?Q?dhrOFIT3MDWnvYfP5ECTEiT5cTMrpL4MmE?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ba606c6a-b2ff-4d24-9e10-08dbb3a67a33
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2023 15:39:40.2570 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DUlp8RpkqXfpGbWcPGfdLQ/u3RV2JuLUL2JXBGXT0h2pMbtqu6rWbbMt/AbljVNVBzGEmZFso32pyurpyBFdoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5316
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v4 2/3] drm/xe: Introduce Xe assert macros
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
Cc: Jani Nikula <jani.nikula@intel.com>,
 Francois Dugast <francois.dugast@intel.com>, Lucas De
 Marchi <lucas.demarchi@intel.com>, Matt Roper <matthew.d.roper@intel.com>,
 intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Sep 12, 2023 at 05:11:13PM +0200, Michal Wajdeczko wrote:
> 
> 
> On 12.09.2023 16:21, Rodrigo Vivi wrote:
> > On Tue, Sep 12, 2023 at 03:48:01PM +0200, Michal Wajdeczko wrote:
> >>
> >>
> >> On 12.09.2023 15:34, Jani Nikula wrote:
> >>> On Tue, 12 Sep 2023, Michal Wajdeczko <michal.wajdeczko@intel.com> wrote:
> >>>> On 12.09.2023 13:35, Jani Nikula wrote:
> >>>>> On Tue, 12 Sep 2023, Francois Dugast <francois.dugast@intel.com> wrote:
> >>>>>> From: Michal Wajdeczko <michal.wajdeczko@intel.com>
> >>>>>>
> >>>>>> As we are moving away from the controversial XE_BUG_ON macro,
> >>>>>> relying just on WARN_ON or drm_err does not cover the cases
> >>>>>> where we want to annotate functions with additional detailed
> >>>>>> debug checks to assert that all prerequisites are satisfied,
> >>>>>> without paying footprint or performance penalty on non-debug
> >>>>>> builds, where all misuses introduced during code integration
> >>>>>> were already fixed.
> >>>>>>
> >>>>>> Introduce family of Xe assert macros that try to follow classic
> >>>>>> assert() utility and can be compiled out on non-debug builds.
> >>>>>>
> >>>>>> Macros are based on drm_WARN, but unlikely to origin, disallow
> >>>>>> use in expressions since we will compile that code out.
> >>>>>>
> >>>>>> As we are operating on the xe pointers, we can print additional
> >>>>>> information about the device, like tile or GT identifier, that
> >>>>>> is not available from generic WARN report:
> >>>>>>
> >>>>>> [ ] xe 0000:00:02.0: [drm] Assertion `true == false` failed!
> >>>>>>     platform: 1 subplatform: 1
> >>>>>>     graphics: Xe_LP 12.00 step B0
> >>>>>>     media: Xe_M 12.00 step B0
> >>>>>>     display: enabled step D0
> >>>>>>     tile: 0 VRAM 0 B
> >>>>>>     GT: 0 type 1
> >>>>>>
> >>>>>> [ ] xe 0000:b3:00.0: [drm] Assertion `true == false` failed!
> >>>>>>     platform: 7 subplatform: 3
> >>>>>>     graphics: Xe_HPG 12.55 step A1
> >>>>>>     media: Xe_HPM 12.55 step A1
> >>>>>>     display: disabled step **
> >>>>>>     tile: 0 VRAM 14.0 GiB
> >>>>>>     GT: 0 type 1
> >>>>>>
> >>>>>> [ ] WARNING: CPU: 0 PID: 2687 at drivers/gpu/drm/xe/xe_device.c:281 xe_device_probe+0x374/0x520 [xe]
> >>>>>> [ ] RIP: 0010:xe_device_probe+0x374/0x520 [xe]
> >>>>>> [ ] Call Trace:
> >>>>>> [ ]  ? __warn+0x7b/0x160
> >>>>>> [ ]  ? xe_device_probe+0x374/0x520 [xe]
> >>>>>> [ ]  ? report_bug+0x1c3/0x1d0
> >>>>>> [ ]  ? handle_bug+0x42/0x70
> >>>>>> [ ]  ? exc_invalid_op+0x14/0x70
> >>>>>> [ ]  ? asm_exc_invalid_op+0x16/0x20
> >>>>>> [ ]  ? xe_device_probe+0x374/0x520 [xe]
> >>>>>> [ ]  ? xe_device_probe+0x374/0x520 [xe]
> >>>>>> [ ]  xe_pci_probe+0x6e3/0x950 [xe]
> >>>>>> [ ]  ? lockdep_hardirqs_on+0xc7/0x140
> >>>>>> [ ]  pci_device_probe+0x9e/0x160
> >>>>>> [ ]  really_probe+0x19d/0x400
> >>>>>>
> >>>>>> v2: use lowercase names
> >>>>>> v3: apply xe coding style
> >>>>>>
> >>>>>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> >>>>>> Cc: Oded Gabbay <ogabbay@kernel.org>
> >>>>>> Cc: Jani Nikula <jani.nikula@intel.com>
> >>>>>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> >>>>>> Cc: Matthew Brost <matthew.brost@intel.com>
> >>>>>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> >>>>>> Cc: Matt Roper <matthew.d.roper@intel.com>
> >>>>>> Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
> >>>>>> Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> >>>>>> ---
> >>>>>>  drivers/gpu/drm/xe/xe_assert.h | 177 +++++++++++++++++++++++++++++++++
> >>>>>>  1 file changed, 177 insertions(+)
> >>>>>>  create mode 100644 drivers/gpu/drm/xe/xe_assert.h
> >>>>>>
> >>>>>> diff --git a/drivers/gpu/drm/xe/xe_assert.h b/drivers/gpu/drm/xe/xe_assert.h
> >>>>>> new file mode 100644
> >>>>>> index 000000000000..b2d3c9b82b31
> >>>>>> --- /dev/null
> >>>>>> +++ b/drivers/gpu/drm/xe/xe_assert.h
> >>>>>> @@ -0,0 +1,177 @@
> >>>>>> +/* SPDX-License-Identifier: MIT */
> >>>>>> +/*
> >>>>>> + * Copyright © 2023 Intel Corporation
> >>>>>> + */
> >>>>>> +
> >>>>>> +#ifndef _XE_ASSERT_H_
> >>>>>> +#define _XE_ASSERT_H_
> >>>>>> +
> >>>>>> +#include <linux/string_helpers.h>
> >>>>>> +
> >>>>>> +#include <drm/drm_print.h>
> >>>>>> +
> >>>>>> +#include "xe_device_types.h"
> >>>>>> +#include "xe_step.h"
> >>>>>> +
> >>>>>> +/**
> >>>>>> + * DOC: Xe ASSERTs
> >>>>>> + *
> >>>>>> + * While Xe driver aims to be simpler than legacy i915 driver it is still
> >>>>>> + * complex enough that some changes introduced while adding new functionality
> >>>>>> + * could break the existing code.
> >>>>>> + *
> >>>>>> + * Adding &drm_WARN or &drm_err to catch unwanted programming usage could lead
> >>>>>> + * to undesired increased driver footprint and may impact production driver
> >>>>>> + * performance as this additional code will be always present.
> >>>>>> + *
> >>>>>> + * To allow annotate functions with additional detailed debug checks to assert
> >>>>>> + * that all prerequisites are satisfied, without worrying about footprint or
> >>>>>> + * performance penalty on production builds where all potential misuses
> >>>>>> + * introduced during code integration were already fixed, we introduce family
> >>>>>> + * of Xe assert macros that try to follow classic assert() utility:
> >>>>>> + *
> >>>>>> + *  * &xe_assert
> >>>>>> + *  * &xe_tile_assert
> >>>>>> + *  * &xe_gt_assert
> >>>>>> + *
> >>>>>> + * These macros are implemented on top of &drm_WARN, but unlikely to the origin,
> >>>>>> + * warning is triggered when provided condition is false. Additionally all above
> >>>>>> + * assert macros cannot be used in expressions or as a condition, since
> >>>>>> + * underlying code will be compiled out on non-debug builds.
> >>>>>> + *
> >>>>>> + * Note that these macros are not intended for use to cover known gaps in the
> >>>>>> + * implementation; for such cases use regular &drm_WARN or &drm_err and provide
> >>>>>> + * valid safe fallback.
> >>>>>> + *
> >>>>>> + * Also in cases where performance or footprint is not an issue, developers
> >>>>>> + * should continue to use the regular &drm_WARN or &drm_err to ensure that bug
> >>>>>> + * reports from production builds will contain meagningful diagnostics data.
> >>>>>> + *
> >>>>>> + * Below code shows how asserts could help in debug to catch unplanned use::
> >>>>>> + *
> >>>>>> + *	static void one_igfx(struct xe_device *xe)
> >>>>>> + *	{
> >>>>>> + *		xe_assert(xe, xe->info.is_dgfx == false);
> >>>>>> + *		xe_assert(xe, xe->info.tile_count == 1);
> >>>>>> + *	}
> >>>>>> + *
> >>>>>> + *	static void two_dgfx(struct xe_device *xe)
> >>>>>> + *	{
> >>>>>> + *		xe_assert(xe, xe->info.is_dgfx);
> >>>>>> + *		xe_assert(xe, xe->info.tile_count == 2);
> >>>>>> + *	}
> >>>>>> + *
> >>>>>> + *	void foo(struct xe_device *xe)
> >>>>>> + *	{
> >>>>>> + *		if (xe->info.dgfx)
> >>>>>> + *			return two_dgfx(xe);
> >>>>>> + *		return one_igfx(xe);
> >>>>>> + *	}
> >>>>>> + *
> >>>>>> + *	void bar(struct xe_device *xe)
> >>>>>> + *	{
> >>>>>> + *		if (drm_WARN_ON(xe->drm, xe->info.tile_count > 2))
> >>>>>> + *			return;
> >>>>>> + *
> >>>>>> + *		if (xe->info.tile_count == 2)
> >>>>>> + *			return two_dgfx(xe);
> >>>>>> + *		return one_igfx(xe);
> >>>>>> + *	}
> >>>>>> + */
> >>>>>> +
> >>>>>> +#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
> >>>>>> +#define __xe_assert_msg(xe, condition, msg, arg...) ({						\
> >>>>>> +	(void)drm_WARN(&(xe)->drm, !(condition), "[" DRM_NAME "] Assertion `%s` failed!\n" msg,	\
> >>>>>> +		       __stringify(condition), ## arg);						\
> >>>>>> +})
> >>>>>> +#else
> >>>>>> +#define __xe_assert_msg(xe, condition, msg, arg...) ({						\
> >>>>>> +	typecheck(struct xe_device *, xe);							\
> >>>>>> +	BUILD_BUG_ON_INVALID(condition);							\
> >>>>>> +})
> >>>>>> +#endif
> >>>>>> +
> >>>>>> +/**
> >>>>>> + * xe_assert - warn if condition is false when debugging.
> >>>>>> + * @xe: the &struct xe_device pointer to which &condition applies
> >>>>>> + * @condition: condition to check
> >>>>>> + *
> >>>>>> + * xe_assert() uses &drm_WARN to emit a warning and print additional information
> >>>>>> + * that could be read from the &xe pointer if provided &condition is false.
> >>>>>> + *
> >>>>>> + * Contrary to &drm_WARN, xe_assert() is effective only on debug builds
> >>>>>> + * (&CONFIG_DRM_XE_DEBUG must be enabled) and cannot be used in expressions
> >>>>>> + * or as a condition.
> >>>>>> + *
> >>>>>> + * See `Xe ASSERTs`_ for general usage guidelines.
> >>>>>> + */
> >>>>>> +#define xe_assert(xe, condition) xe_assert_msg((xe), condition, "")
> >>>>>> +#define xe_assert_msg(xe, condition, msg, arg...) ({						\
> >>>>>> +	struct xe_device *__xe = (xe);								\
> >>>>>> +	__xe_assert_msg(__xe, condition,							\
> >>>>>> +			"platform: %d subplatform: %d\n"					\
> >>>>>> +			"graphics: %s %u.%02u step %s\n"					\
> >>>>>> +			"media: %s %u.%02u step %s\n"						\
> >>>>>> +			"display: %s step %s\n"							\
> >>>>>> +			msg,									\
> >>>>>> +			__xe->info.platform, __xe->info.subplatform,				\
> >>>>>> +			__xe->info.graphics_name,						\
> >>>>>> +			__xe->info.graphics_verx100 / 100,					\
> >>>>>> +			__xe->info.graphics_verx100 % 100,					\
> >>>>>> +			xe_step_name(__xe->info.step.graphics),					\
> >>>>>> +			__xe->info.media_name,							\
> >>>>>> +			__xe->info.media_verx100 / 100,						\
> >>>>>> +			__xe->info.media_verx100 % 100,						\
> >>>>>> +			xe_step_name(__xe->info.step.media),					\
> >>>>>> +			str_enabled_disabled(__xe->info.enable_display),			\
> >>>>>> +			xe_step_name(__xe->info.step.display),					\
> >>>>>> +			## arg);								\
> >>>>>> +})
> >>>>>
> >>>>> I guess I have missed this huge splat all along... Why is it necessary?
> >>>>> If you print the device id, all the information should be there already,
> >>>>> right?
> >>>>
> >>>> somewhere in the dmesg (if someone/CI was clever enough) maybe yes
> >>>>
> >>>> but in bug reports usually only the WARN is included, so exposing some
> >>>> basic info here for quicker triage
> >>>
> >>> I just think it's unnecessary duplication. 
> >>
> >> but what if assert() fires before driver print welcome messages ;)
> >>
> >> IMO we should try to collect whatever is possible and comes almost at no
> >> extra cost (you don't need to type anything, macro takes care of that)
> >>
> >>> Most likely this will only be
> >>> enabled in CI only anyway.
> >>
> >> I assume asserts will fire mostly during pre-merge testing (either on CI
> >> or on tested manually on DUT machines)
> > 
> > I'm with Jani here. In all of these cases you already know the PCI ID of
> > that specific machine, so all this extra information should already be known.
> > 
> > The only benefit would be to get user reports when we get just that debug
> > msg. But also asking for a lspci -nn | grep VGA was never that complicated.
> 
> but lspci will not show you the GMDID, so how you will know IP version?

if you know the PCI DEVICE ID you know the GMDID. Just read the spec.

> likely same problem with VRAM size as you will see just BAR size, no?

I don't understand this comment since I don't see vram info above.
we are talking about the GMDID info.

> and in the near future how to distinguish between native and PF mode?

afaik, PF or VF, the PCI ID and the hardware version underneath won't
change.

> 
> > 
> > My recommendation is to remove the duplication of this information here.
> 
> honestly I don't understand why are we aiming to have totally silent
> driver that makes any debug just harder and clueless - maybe it's time
> to help early adopters and feature enablers by providing more, even if
> duplicated, data which is still better than nothing - like in case when
> the driver decides to fail the probe ... you may just start guessing why

are we talking about early adopters that cannot read the spec and cannot
map the PCI DEVICE ID to the GMDID? Interesting...

> 
> > But this is not a blocker in my opinion and we could go with this patch as is.

But again ^

> > 
> > Jani, do you see this as a blocker and a new version needed?
> > 
> > maybe a follow-up later so we don't block this entire series?
> > 
> > Thanks,
> > Rodrigo.
> > 
> >>
> >>>
> >>>>
> >>>>>
> >>>>> This also makes it impossible to use xe_assert() with a NULL xe device
> >>>>> pointer in contexts where you don't have the device available.
> >>>>
> >>>> there was no such requirement (but we can add that if needed)
> >>>>
> >>>> note that code is based on drm_WARN() which also doesn't work with NULL
> >>>
> >>> Ah, true. The drm_dbg and friends do.
> >>
> >> true, so do you want xe_assert() and family to also accept NULL ?
> >>
> >>>
> >>>>
> >>>> Michal
> >>>>
> >>>>>
> >>>>> BR,
> >>>>> Jani.
> >>>>>
> >>>>>
> >>>>>> +
> >>>>>> +/**
> >>>>>> + * xe_tile_assert - warn if condition is false when debugging.
> >>>>>> + * @tile: the &struct xe_tile pointer to which &condition applies
> >>>>>> + * @condition: condition to check
> >>>>>> + *
> >>>>>> + * xe_tile_assert() uses &drm_WARN to emit a warning and print additional
> >>>>>> + * information that could be read from the &tile pointer if provided &condition
> >>>>>> + * is false.
> >>>>>> + *
> >>>>>> + * Contrary to &drm_WARN, xe_tile_assert() is effective only on debug builds
> >>>>>> + * (&CONFIG_DRM_XE_DEBUG must be enabled) and cannot be used in expressions
> >>>>>> + * or as a condition.
> >>>>>> + *
> >>>>>> + * See `Xe ASSERTs`_ for general usage guidelines.
> >>>>>> + */
> >>>>>> +#define xe_tile_assert(tile, condition) xe_tile_assert_msg((tile), condition, "")
> >>>>>> +#define xe_tile_assert_msg(tile, condition, msg, arg...) ({					\
> >>>>>> +	struct xe_tile *__tile = (tile);							\
> >>>>>> +	char __buf[10];										\
> >>>>>> +	xe_assert_msg(tile_to_xe(__tile), condition, "tile: %u VRAM %s\n" msg,			\
> >>>>>> +		      __tile->id, ({ string_get_size(__tile->mem.vram.actual_physical_size, 1,	\
> >>>>>> +				     STRING_UNITS_2, __buf, sizeof(__buf)); __buf; }), ## arg);	\
> >>>>>> +})
> >>>>>> +
> >>>>>> +/**
> >>>>>> + * xe_gt_assert - warn if condition is false when debugging.
> >>>>>> + * @gt: the &struct xe_gt pointer to which &condition applies
> >>>>>> + * @condition: condition to check
> >>>>>> + *
> >>>>>> + * xe_gt_assert() uses &drm_WARN to emit a warning and print additional
> >>>>>> + * information that could be safetely read from the &gt pointer if provided
> >>>>>> + * &condition is false.
> >>>>>> + *
> >>>>>> + * Contrary to &drm_WARN, xe_gt_assert() is effective only on debug builds
> >>>>>> + * (&CONFIG_DRM_XE_DEBUG must be enabled) and cannot be used in expressions
> >>>>>> + * or as a condition.
> >>>>>> + *
> >>>>>> + * See `Xe ASSERTs`_ for general usage guidelines.
> >>>>>> + */
> >>>>>> +#define xe_gt_assert(gt, condition) xe_gt_assert_msg((gt), condition, "")
> >>>>>> +#define xe_gt_assert_msg(gt, condition, msg, arg...) ({						\
> >>>>>> +	struct xe_gt *__gt = (gt);								\
> >>>>>> +	xe_tile_assert_msg(gt_to_tile(__gt), condition, "GT: %u type %d\n" msg,			\
> >>>>>> +			   __gt->info.id, __gt->info.type, ## arg);				\
> >>>>>> +})
> >>>>>> +
> >>>>>> +#endif
> >>>>>
> >>>
