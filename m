Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74E7DCA0EEB
	for <intel-xe@archiver.kernel.org>; Tue, 12 Sep 2023 15:47:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36D3110E080;
	Tue, 12 Sep 2023 15:47:06 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9478C10E080
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Sep 2023 15:47:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694533623; x=1726069623;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=EUViMglz6c/IvK/f3rzQsWaiGooqfIR6APx+XOHjn0g=;
 b=OcwelLgMb6KOW1zH6AhdAH1cyOeqkPUDCN3wkoI7lj2bG9Y5P5n2C6Qa
 6sCANwOvMaWNw01T1627aFispzWMWgp97709384KWKbAnWYrwBQ2hjIda
 klQyAiDPBf98T/ew9IGqBZ4ZRjpRlUaKvSsuZngyjziIDufoRI0IJ3sZ1
 3i8zSZR1Pff1WdIDJy39keSN2eLAUt1mPEcPc29/gETt/m8ZitgqJW0TY
 TMnxVcberT2GsH4GbDNBIhe6XqBkrifKTKGoIt62LHTihRo6WLwcYo9R+
 zAtM7g3G3AnJhKzu7+Hgm0yDf0k394SKfJNixd2z0DiPfJgtq6cT17bba A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="357846119"
X-IronPort-AV: E=Sophos;i="6.02,139,1688454000"; d="scan'208";a="357846119"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2023 08:46:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="743763242"
X-IronPort-AV: E=Sophos;i="6.02,139,1688454000"; d="scan'208";a="743763242"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Sep 2023 08:46:40 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 12 Sep 2023 08:46:39 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Tue, 12 Sep 2023 08:46:39 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Tue, 12 Sep 2023 08:46:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b9LEDXnxYYKicBTp5ZMcDU9Owg+xpd5tyutc8PNC7OKXLz24eGUGT8lTthQlmgEh1l7NAaqy4yYGFIKkRLKas6Kba/93qTI9BZrMxJP9z9vJ56AHDQv21J4vJLzsbB70O2In7HwUbP5YpE+3e7RE8Q70hiHo1UBTS9dRke7ScvcqT5DzVOv14LCi9PeCTTOwCf0fAXzVL2GQ8ZEVeCUyFtOAnWHwR7kZvmzc7hCooRorWdGOyBHR16jF0o7XVdoyuYofzBsv2ZyPh7xFScTvTemNMeEQRgN45H68mXX/QPlRR2sD2HUIrjK4sitfmWMJt+E6BE0ZhbkkoCitm9iuFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x1mbRwlkoD1kpP1iiMrjm8J0AlcQwFk6D874KGK5D1I=;
 b=aRhlqGaUVrAoteM/pHEBPLg7/C2bJVOHTB2Yrqb6gGo78L8icBX+DKsIdFW91ECmX57JtsjZeMr6xbaoiJVvllaN1EL0twXlhxdd4X/0giJnJP8aedbc8U3dK9GTMiXiWTAiLs9WKR7+y8vlNdlFQ6rr+WqFKNnm+i5rhGFlsHcIC+I8CZww0iDcCKWO6puj5/DvY74YtwSOietEZ2WDNlh3Ebc7QoDX4l4oFiWlpgGCEXl9o6UC+lDv2nLy0J8OmicttMuJ6SlvVWWzxsnRix1UnPVW3r5U+lBSo55TVMk/ypiozfjwGc6BXRWD3O1U9+EGrVivUSgQsSYRB9g1Aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 PH8PR11MB7141.namprd11.prod.outlook.com (2603:10b6:510:22f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.30; Tue, 12 Sep
 2023 15:46:37 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::48d9:4c34:35b:f66]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::48d9:4c34:35b:f66%4]) with mapi id 15.20.6768.029; Tue, 12 Sep 2023
 15:46:37 +0000
Date: Tue, 12 Sep 2023 08:46:33 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Message-ID: <20230912154633.GF6080@mdroper-desk1.amr.corp.intel.com>
References: <20230912083635.7-1-francois.dugast@intel.com>
 <20230912083635.7-3-francois.dugast@intel.com>
 <87pm2nd3p1.fsf@intel.com>
 <b9a8df25-d070-9339-fdb7-2b4cd9d66fb3@intel.com>
 <871qf3y0qa.fsf@intel.com>
 <268cacb5-2feb-b43f-325f-5aef9cf8951f@intel.com>
 <ZQBz0Mk3O71oebl+@intel.com>
 <85abfd0d-0eef-b90d-37d2-297cfb53db1e@intel.com>
 <ZQCGNl3RjgSYs4Sa@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZQCGNl3RjgSYs4Sa@intel.com>
X-ClientProxiedBy: SJ0PR03CA0153.namprd03.prod.outlook.com
 (2603:10b6:a03:338::8) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|PH8PR11MB7141:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ea50574-83f1-4876-f745-08dbb3a772e3
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mJwrWN3Br4wreN5x5VAlTHG41ckEqp+ojJA7Z+WDqs36lkdxjqicjRXMdBXlu1yJmXCJSt9qcjqzQYcPFbEdNM5BdhQylg2m/pkPfBKSt4wv6Z6M0xQa/3gt24x3XNePPku6/TJYVx9N+OFlfccIR1D2j5nZIm1a7rqTeDGCV9TYu2aZLm+JqHI5l6L7Hjb6WjMPr4JqRgJJsdmzxe25k/mYgUHReBFZIHYp9uS8EL/Uv5kNYvlp4hwZZAOWg46MrxepuBIrhQhwn0MJSN14T5AVvTOxLeDKrXcuDlp2L8s5lEvB2fwDsl31pk0esxg/+hTASq1FocfcxCHKGdlnkGsaWJK5oCmFEcEFr9T8lmzCMOLbDgqVrsjqiQiwCMTuG2qr0iNwRd8cr7dJ9flIK+2THMp1Xjxz7Qcd1RZtrajXclltqG4RKtlwVI+6n5esBLIHBGBC/6aBj6EZ4dSPzkMGXUsev5gpSTiZceHHHWAO/y8vQXJqNTV2uhBJYJsZhl8YReuwWFkZzl0lrjrb6OquHGbbrxvQmJP7TRBQvBs+5Hl7E0YEEKOwf89yX6fJ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(376002)(346002)(366004)(39860400002)(136003)(451199024)(186009)(1800799009)(66899024)(5660300002)(26005)(4326008)(6862004)(107886003)(1076003)(8936002)(82960400001)(8676002)(33656002)(2906002)(83380400001)(30864003)(86362001)(38100700002)(66476007)(53546011)(6486002)(6506007)(66946007)(66556008)(54906003)(316002)(6636002)(478600001)(6666004)(41300700001)(6512007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?AUynVV0e+nWjStM6/wc0tO4TliCuge5tBLc4wWM4I8Nvxp/zUvCqnwTfvN?=
 =?iso-8859-1?Q?VCVu9TGVUf9nFZaspTFjaJkVGx7/2DINnOdTzIuZEiVZDtp/U3bR15Vtl/?=
 =?iso-8859-1?Q?+CN432Gwl+jGpJub2pePUfzaM6dwF/fRMpLXCk/VH66attvo07LEliYzJk?=
 =?iso-8859-1?Q?bsCvqqo0qKY89JZV5FDlMCDWVWJDIjNne7Bt0/YqjDA4fYPmXE7U+GibE7?=
 =?iso-8859-1?Q?pziJad3+ZeGanVFWT158/g3/YNYdPGBnesB+1R8XYBp1Vo1JVUXd7Qc5CF?=
 =?iso-8859-1?Q?PgjB28xtUGDw0fQ7im6kh+A7NxnGaZvb97DSD5v6jOTfe3TAX5JL9as0mc?=
 =?iso-8859-1?Q?u62G8IaeU3w+hnp+aOtJf98B7LELS2yXcZl9UhqYCMinP2yv1rm7PyxWa7?=
 =?iso-8859-1?Q?7XXB9KFds5DemqC4jkJ6my9zqmQ0qrg9k7UipK40GB7c/I0fMamPLs+H5Z?=
 =?iso-8859-1?Q?T5AiDJUpRRvEo0+9xMBzFoGPlt5rZZWE8PR7lt+G62IRxyIIQEm2iE78Xh?=
 =?iso-8859-1?Q?uRMskKulb7wxH0xA4Mv8mH7mm8eg1Vb9PZWggDzxBQ7KzBoEgVzTUxtS0y?=
 =?iso-8859-1?Q?A6ouE2ln1iCWQBAg1NycJUvBv3YDiDgmCLpAgi0HWzwaAasrDsKzOSsblQ?=
 =?iso-8859-1?Q?vlqyqcU0kz5bnCgKFftvCd15Wfk6j74Hx76UV0v/NqNoc7dYvGGYyOMU7F?=
 =?iso-8859-1?Q?ArfrLy/r3AR5U5FVwIKFEMa8gFDScXsIREfuMCJ77MFa+8qEtVBFB2QVht?=
 =?iso-8859-1?Q?clz6CLXeDhscovo1JsF8NjmObk9NUSrD6yvQhctEqN/6ztjRQS0SgtZOKd?=
 =?iso-8859-1?Q?2wpdvCuADRpx9kTRDq0r5nYOY2iXDS1o0TMzus6l41kr7L3zkdC9kEaKOl?=
 =?iso-8859-1?Q?CJ+Z2d3xaQbT5uZWkabyzYzMh3HHg/OZto4EzvfDb9v+idqIsy9eYgvsIy?=
 =?iso-8859-1?Q?g5yyd/4Izqv0tdUwVo6bFywxErkqdLG8oxE3mazwPoS9te2VwH+waACflB?=
 =?iso-8859-1?Q?3lJrwn5cJAfM2qz4U2vU9ADlxOnGfoXGnEryF1hn8WGf5j+FlT2OCzKXQl?=
 =?iso-8859-1?Q?IEiu+14rq1kvrHepilB6jaoMZnCrxMRL/Brn6rjHWuk2yR5bjLV2TIYBn8?=
 =?iso-8859-1?Q?aKtIrB4oftCT543MxtLvmUP6Rzz6cRt6VMMURolpr1XnMYk+BMdSLBNmj8?=
 =?iso-8859-1?Q?YsX3oEsgwqZBHY9VdpbfWj0GQnU26Joilodmgy3jEZAtu/szx9nAbOUQp9?=
 =?iso-8859-1?Q?B5MNtfFcxWKEjN+GWwsgT1BLlv7FdFR8ttqKbhWqruOAHyBH1NYCtv8T3L?=
 =?iso-8859-1?Q?0wvmReCDVZtIlDMUpa3WKekkG++rdSVLVLJxfj5IDpDXGl7/5izm9H4isC?=
 =?iso-8859-1?Q?1gMGOSBUJqXX6Q6LRGEj6rCE0vMdov7btARwNSSVPHtb24Ty0NHK7gkMAQ?=
 =?iso-8859-1?Q?n9ld9pI6gCrNHkcqkISh+rSTzbKdpCKNmlC9uSXHf/MUTwTA3iUHYXijze?=
 =?iso-8859-1?Q?o7O8DANiRTEdhrY72reMGohCLGr5SHwQ30QgYZOIZ91TyO6o6ObNQGfINX?=
 =?iso-8859-1?Q?Xw8Y2+ggYyOpp7WK9MbJ+ABSAot2laz6fVmn8sWwVPqYWB0IYgUGTAuvIN?=
 =?iso-8859-1?Q?KEVx1lOayXRmSIOfCouSgZdcGe+Izs82S2CD6TaggGGc7wKURkKhQl8Q?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ea50574-83f1-4876-f745-08dbb3a772e3
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2023 15:46:37.3101 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ANLP6SeGfb5UV6LESMQqdrR1n1MG2/52fQJU2kgjWGOIiyK+Oqz6OhTN6jlP8ftLi6P1SuLQjav/CG2nvw/GYCWzZ0yLb236TLrM3NJce0Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7141
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
 Francois Dugast <francois.dugast@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Sep 12, 2023 at 11:39:34AM -0400, Rodrigo Vivi wrote:
> On Tue, Sep 12, 2023 at 05:11:13PM +0200, Michal Wajdeczko wrote:
> > 
> > 
> > On 12.09.2023 16:21, Rodrigo Vivi wrote:
> > > On Tue, Sep 12, 2023 at 03:48:01PM +0200, Michal Wajdeczko wrote:
> > >>
> > >>
> > >> On 12.09.2023 15:34, Jani Nikula wrote:
> > >>> On Tue, 12 Sep 2023, Michal Wajdeczko <michal.wajdeczko@intel.com> wrote:
> > >>>> On 12.09.2023 13:35, Jani Nikula wrote:
> > >>>>> On Tue, 12 Sep 2023, Francois Dugast <francois.dugast@intel.com> wrote:
> > >>>>>> From: Michal Wajdeczko <michal.wajdeczko@intel.com>
> > >>>>>>
> > >>>>>> As we are moving away from the controversial XE_BUG_ON macro,
> > >>>>>> relying just on WARN_ON or drm_err does not cover the cases
> > >>>>>> where we want to annotate functions with additional detailed
> > >>>>>> debug checks to assert that all prerequisites are satisfied,
> > >>>>>> without paying footprint or performance penalty on non-debug
> > >>>>>> builds, where all misuses introduced during code integration
> > >>>>>> were already fixed.
> > >>>>>>
> > >>>>>> Introduce family of Xe assert macros that try to follow classic
> > >>>>>> assert() utility and can be compiled out on non-debug builds.
> > >>>>>>
> > >>>>>> Macros are based on drm_WARN, but unlikely to origin, disallow
> > >>>>>> use in expressions since we will compile that code out.
> > >>>>>>
> > >>>>>> As we are operating on the xe pointers, we can print additional
> > >>>>>> information about the device, like tile or GT identifier, that
> > >>>>>> is not available from generic WARN report:
> > >>>>>>
> > >>>>>> [ ] xe 0000:00:02.0: [drm] Assertion `true == false` failed!
> > >>>>>>     platform: 1 subplatform: 1
> > >>>>>>     graphics: Xe_LP 12.00 step B0
> > >>>>>>     media: Xe_M 12.00 step B0
> > >>>>>>     display: enabled step D0
> > >>>>>>     tile: 0 VRAM 0 B
> > >>>>>>     GT: 0 type 1
> > >>>>>>
> > >>>>>> [ ] xe 0000:b3:00.0: [drm] Assertion `true == false` failed!
> > >>>>>>     platform: 7 subplatform: 3
> > >>>>>>     graphics: Xe_HPG 12.55 step A1
> > >>>>>>     media: Xe_HPM 12.55 step A1
> > >>>>>>     display: disabled step **
> > >>>>>>     tile: 0 VRAM 14.0 GiB
> > >>>>>>     GT: 0 type 1
> > >>>>>>
> > >>>>>> [ ] WARNING: CPU: 0 PID: 2687 at drivers/gpu/drm/xe/xe_device.c:281 xe_device_probe+0x374/0x520 [xe]
> > >>>>>> [ ] RIP: 0010:xe_device_probe+0x374/0x520 [xe]
> > >>>>>> [ ] Call Trace:
> > >>>>>> [ ]  ? __warn+0x7b/0x160
> > >>>>>> [ ]  ? xe_device_probe+0x374/0x520 [xe]
> > >>>>>> [ ]  ? report_bug+0x1c3/0x1d0
> > >>>>>> [ ]  ? handle_bug+0x42/0x70
> > >>>>>> [ ]  ? exc_invalid_op+0x14/0x70
> > >>>>>> [ ]  ? asm_exc_invalid_op+0x16/0x20
> > >>>>>> [ ]  ? xe_device_probe+0x374/0x520 [xe]
> > >>>>>> [ ]  ? xe_device_probe+0x374/0x520 [xe]
> > >>>>>> [ ]  xe_pci_probe+0x6e3/0x950 [xe]
> > >>>>>> [ ]  ? lockdep_hardirqs_on+0xc7/0x140
> > >>>>>> [ ]  pci_device_probe+0x9e/0x160
> > >>>>>> [ ]  really_probe+0x19d/0x400
> > >>>>>>
> > >>>>>> v2: use lowercase names
> > >>>>>> v3: apply xe coding style
> > >>>>>>
> > >>>>>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> > >>>>>> Cc: Oded Gabbay <ogabbay@kernel.org>
> > >>>>>> Cc: Jani Nikula <jani.nikula@intel.com>
> > >>>>>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > >>>>>> Cc: Matthew Brost <matthew.brost@intel.com>
> > >>>>>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> > >>>>>> Cc: Matt Roper <matthew.d.roper@intel.com>
> > >>>>>> Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
> > >>>>>> Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > >>>>>> ---
> > >>>>>>  drivers/gpu/drm/xe/xe_assert.h | 177 +++++++++++++++++++++++++++++++++
> > >>>>>>  1 file changed, 177 insertions(+)
> > >>>>>>  create mode 100644 drivers/gpu/drm/xe/xe_assert.h
> > >>>>>>
> > >>>>>> diff --git a/drivers/gpu/drm/xe/xe_assert.h b/drivers/gpu/drm/xe/xe_assert.h
> > >>>>>> new file mode 100644
> > >>>>>> index 000000000000..b2d3c9b82b31
> > >>>>>> --- /dev/null
> > >>>>>> +++ b/drivers/gpu/drm/xe/xe_assert.h
> > >>>>>> @@ -0,0 +1,177 @@
> > >>>>>> +/* SPDX-License-Identifier: MIT */
> > >>>>>> +/*
> > >>>>>> + * Copyright © 2023 Intel Corporation
> > >>>>>> + */
> > >>>>>> +
> > >>>>>> +#ifndef _XE_ASSERT_H_
> > >>>>>> +#define _XE_ASSERT_H_
> > >>>>>> +
> > >>>>>> +#include <linux/string_helpers.h>
> > >>>>>> +
> > >>>>>> +#include <drm/drm_print.h>
> > >>>>>> +
> > >>>>>> +#include "xe_device_types.h"
> > >>>>>> +#include "xe_step.h"
> > >>>>>> +
> > >>>>>> +/**
> > >>>>>> + * DOC: Xe ASSERTs
> > >>>>>> + *
> > >>>>>> + * While Xe driver aims to be simpler than legacy i915 driver it is still
> > >>>>>> + * complex enough that some changes introduced while adding new functionality
> > >>>>>> + * could break the existing code.
> > >>>>>> + *
> > >>>>>> + * Adding &drm_WARN or &drm_err to catch unwanted programming usage could lead
> > >>>>>> + * to undesired increased driver footprint and may impact production driver
> > >>>>>> + * performance as this additional code will be always present.
> > >>>>>> + *
> > >>>>>> + * To allow annotate functions with additional detailed debug checks to assert
> > >>>>>> + * that all prerequisites are satisfied, without worrying about footprint or
> > >>>>>> + * performance penalty on production builds where all potential misuses
> > >>>>>> + * introduced during code integration were already fixed, we introduce family
> > >>>>>> + * of Xe assert macros that try to follow classic assert() utility:
> > >>>>>> + *
> > >>>>>> + *  * &xe_assert
> > >>>>>> + *  * &xe_tile_assert
> > >>>>>> + *  * &xe_gt_assert
> > >>>>>> + *
> > >>>>>> + * These macros are implemented on top of &drm_WARN, but unlikely to the origin,
> > >>>>>> + * warning is triggered when provided condition is false. Additionally all above
> > >>>>>> + * assert macros cannot be used in expressions or as a condition, since
> > >>>>>> + * underlying code will be compiled out on non-debug builds.
> > >>>>>> + *
> > >>>>>> + * Note that these macros are not intended for use to cover known gaps in the
> > >>>>>> + * implementation; for such cases use regular &drm_WARN or &drm_err and provide
> > >>>>>> + * valid safe fallback.
> > >>>>>> + *
> > >>>>>> + * Also in cases where performance or footprint is not an issue, developers
> > >>>>>> + * should continue to use the regular &drm_WARN or &drm_err to ensure that bug
> > >>>>>> + * reports from production builds will contain meagningful diagnostics data.
> > >>>>>> + *
> > >>>>>> + * Below code shows how asserts could help in debug to catch unplanned use::
> > >>>>>> + *
> > >>>>>> + *	static void one_igfx(struct xe_device *xe)
> > >>>>>> + *	{
> > >>>>>> + *		xe_assert(xe, xe->info.is_dgfx == false);
> > >>>>>> + *		xe_assert(xe, xe->info.tile_count == 1);
> > >>>>>> + *	}
> > >>>>>> + *
> > >>>>>> + *	static void two_dgfx(struct xe_device *xe)
> > >>>>>> + *	{
> > >>>>>> + *		xe_assert(xe, xe->info.is_dgfx);
> > >>>>>> + *		xe_assert(xe, xe->info.tile_count == 2);
> > >>>>>> + *	}
> > >>>>>> + *
> > >>>>>> + *	void foo(struct xe_device *xe)
> > >>>>>> + *	{
> > >>>>>> + *		if (xe->info.dgfx)
> > >>>>>> + *			return two_dgfx(xe);
> > >>>>>> + *		return one_igfx(xe);
> > >>>>>> + *	}
> > >>>>>> + *
> > >>>>>> + *	void bar(struct xe_device *xe)
> > >>>>>> + *	{
> > >>>>>> + *		if (drm_WARN_ON(xe->drm, xe->info.tile_count > 2))
> > >>>>>> + *			return;
> > >>>>>> + *
> > >>>>>> + *		if (xe->info.tile_count == 2)
> > >>>>>> + *			return two_dgfx(xe);
> > >>>>>> + *		return one_igfx(xe);
> > >>>>>> + *	}
> > >>>>>> + */
> > >>>>>> +
> > >>>>>> +#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
> > >>>>>> +#define __xe_assert_msg(xe, condition, msg, arg...) ({						\
> > >>>>>> +	(void)drm_WARN(&(xe)->drm, !(condition), "[" DRM_NAME "] Assertion `%s` failed!\n" msg,	\
> > >>>>>> +		       __stringify(condition), ## arg);						\
> > >>>>>> +})
> > >>>>>> +#else
> > >>>>>> +#define __xe_assert_msg(xe, condition, msg, arg...) ({						\
> > >>>>>> +	typecheck(struct xe_device *, xe);							\
> > >>>>>> +	BUILD_BUG_ON_INVALID(condition);							\
> > >>>>>> +})
> > >>>>>> +#endif
> > >>>>>> +
> > >>>>>> +/**
> > >>>>>> + * xe_assert - warn if condition is false when debugging.
> > >>>>>> + * @xe: the &struct xe_device pointer to which &condition applies
> > >>>>>> + * @condition: condition to check
> > >>>>>> + *
> > >>>>>> + * xe_assert() uses &drm_WARN to emit a warning and print additional information
> > >>>>>> + * that could be read from the &xe pointer if provided &condition is false.
> > >>>>>> + *
> > >>>>>> + * Contrary to &drm_WARN, xe_assert() is effective only on debug builds
> > >>>>>> + * (&CONFIG_DRM_XE_DEBUG must be enabled) and cannot be used in expressions
> > >>>>>> + * or as a condition.
> > >>>>>> + *
> > >>>>>> + * See `Xe ASSERTs`_ for general usage guidelines.
> > >>>>>> + */
> > >>>>>> +#define xe_assert(xe, condition) xe_assert_msg((xe), condition, "")
> > >>>>>> +#define xe_assert_msg(xe, condition, msg, arg...) ({						\
> > >>>>>> +	struct xe_device *__xe = (xe);								\
> > >>>>>> +	__xe_assert_msg(__xe, condition,							\
> > >>>>>> +			"platform: %d subplatform: %d\n"					\
> > >>>>>> +			"graphics: %s %u.%02u step %s\n"					\
> > >>>>>> +			"media: %s %u.%02u step %s\n"						\
> > >>>>>> +			"display: %s step %s\n"							\
> > >>>>>> +			msg,									\
> > >>>>>> +			__xe->info.platform, __xe->info.subplatform,				\
> > >>>>>> +			__xe->info.graphics_name,						\
> > >>>>>> +			__xe->info.graphics_verx100 / 100,					\
> > >>>>>> +			__xe->info.graphics_verx100 % 100,					\
> > >>>>>> +			xe_step_name(__xe->info.step.graphics),					\
> > >>>>>> +			__xe->info.media_name,							\
> > >>>>>> +			__xe->info.media_verx100 / 100,						\
> > >>>>>> +			__xe->info.media_verx100 % 100,						\
> > >>>>>> +			xe_step_name(__xe->info.step.media),					\
> > >>>>>> +			str_enabled_disabled(__xe->info.enable_display),			\
> > >>>>>> +			xe_step_name(__xe->info.step.display),					\
> > >>>>>> +			## arg);								\
> > >>>>>> +})
> > >>>>>
> > >>>>> I guess I have missed this huge splat all along... Why is it necessary?
> > >>>>> If you print the device id, all the information should be there already,
> > >>>>> right?
> > >>>>
> > >>>> somewhere in the dmesg (if someone/CI was clever enough) maybe yes
> > >>>>
> > >>>> but in bug reports usually only the WARN is included, so exposing some
> > >>>> basic info here for quicker triage
> > >>>
> > >>> I just think it's unnecessary duplication. 
> > >>
> > >> but what if assert() fires before driver print welcome messages ;)
> > >>
> > >> IMO we should try to collect whatever is possible and comes almost at no
> > >> extra cost (you don't need to type anything, macro takes care of that)
> > >>
> > >>> Most likely this will only be
> > >>> enabled in CI only anyway.
> > >>
> > >> I assume asserts will fire mostly during pre-merge testing (either on CI
> > >> or on tested manually on DUT machines)
> > > 
> > > I'm with Jani here. In all of these cases you already know the PCI ID of
> > > that specific machine, so all this extra information should already be known.
> > > 
> > > The only benefit would be to get user reports when we get just that debug
> > > msg. But also asking for a lspci -nn | grep VGA was never that complicated.
> > 
> > but lspci will not show you the GMDID, so how you will know IP version?
> 
> if you know the PCI DEVICE ID you know the GMDID. Just read the spec.

A big part of the motivation for GMD_ID is that you won't be able to
rely on PCI ID going forward.  At the moment it may still be true that
you can always figure it out since we only have two platforms and three
possible IP versions, but eventually there's going to be cases where
multiple possible IP versions map to the same PCI device.


Matt

> 
> > likely same problem with VRAM size as you will see just BAR size, no?
> 
> I don't understand this comment since I don't see vram info above.
> we are talking about the GMDID info.
> 
> > and in the near future how to distinguish between native and PF mode?
> 
> afaik, PF or VF, the PCI ID and the hardware version underneath won't
> change.
> 
> > 
> > > 
> > > My recommendation is to remove the duplication of this information here.
> > 
> > honestly I don't understand why are we aiming to have totally silent
> > driver that makes any debug just harder and clueless - maybe it's time
> > to help early adopters and feature enablers by providing more, even if
> > duplicated, data which is still better than nothing - like in case when
> > the driver decides to fail the probe ... you may just start guessing why
> 
> are we talking about early adopters that cannot read the spec and cannot
> map the PCI DEVICE ID to the GMDID? Interesting...
> 
> > 
> > > But this is not a blocker in my opinion and we could go with this patch as is.
> 
> But again ^
> 
> > > 
> > > Jani, do you see this as a blocker and a new version needed?
> > > 
> > > maybe a follow-up later so we don't block this entire series?
> > > 
> > > Thanks,
> > > Rodrigo.
> > > 
> > >>
> > >>>
> > >>>>
> > >>>>>
> > >>>>> This also makes it impossible to use xe_assert() with a NULL xe device
> > >>>>> pointer in contexts where you don't have the device available.
> > >>>>
> > >>>> there was no such requirement (but we can add that if needed)
> > >>>>
> > >>>> note that code is based on drm_WARN() which also doesn't work with NULL
> > >>>
> > >>> Ah, true. The drm_dbg and friends do.
> > >>
> > >> true, so do you want xe_assert() and family to also accept NULL ?
> > >>
> > >>>
> > >>>>
> > >>>> Michal
> > >>>>
> > >>>>>
> > >>>>> BR,
> > >>>>> Jani.
> > >>>>>
> > >>>>>
> > >>>>>> +
> > >>>>>> +/**
> > >>>>>> + * xe_tile_assert - warn if condition is false when debugging.
> > >>>>>> + * @tile: the &struct xe_tile pointer to which &condition applies
> > >>>>>> + * @condition: condition to check
> > >>>>>> + *
> > >>>>>> + * xe_tile_assert() uses &drm_WARN to emit a warning and print additional
> > >>>>>> + * information that could be read from the &tile pointer if provided &condition
> > >>>>>> + * is false.
> > >>>>>> + *
> > >>>>>> + * Contrary to &drm_WARN, xe_tile_assert() is effective only on debug builds
> > >>>>>> + * (&CONFIG_DRM_XE_DEBUG must be enabled) and cannot be used in expressions
> > >>>>>> + * or as a condition.
> > >>>>>> + *
> > >>>>>> + * See `Xe ASSERTs`_ for general usage guidelines.
> > >>>>>> + */
> > >>>>>> +#define xe_tile_assert(tile, condition) xe_tile_assert_msg((tile), condition, "")
> > >>>>>> +#define xe_tile_assert_msg(tile, condition, msg, arg...) ({					\
> > >>>>>> +	struct xe_tile *__tile = (tile);							\
> > >>>>>> +	char __buf[10];										\
> > >>>>>> +	xe_assert_msg(tile_to_xe(__tile), condition, "tile: %u VRAM %s\n" msg,			\
> > >>>>>> +		      __tile->id, ({ string_get_size(__tile->mem.vram.actual_physical_size, 1,	\
> > >>>>>> +				     STRING_UNITS_2, __buf, sizeof(__buf)); __buf; }), ## arg);	\
> > >>>>>> +})
> > >>>>>> +
> > >>>>>> +/**
> > >>>>>> + * xe_gt_assert - warn if condition is false when debugging.
> > >>>>>> + * @gt: the &struct xe_gt pointer to which &condition applies
> > >>>>>> + * @condition: condition to check
> > >>>>>> + *
> > >>>>>> + * xe_gt_assert() uses &drm_WARN to emit a warning and print additional
> > >>>>>> + * information that could be safetely read from the &gt pointer if provided
> > >>>>>> + * &condition is false.
> > >>>>>> + *
> > >>>>>> + * Contrary to &drm_WARN, xe_gt_assert() is effective only on debug builds
> > >>>>>> + * (&CONFIG_DRM_XE_DEBUG must be enabled) and cannot be used in expressions
> > >>>>>> + * or as a condition.
> > >>>>>> + *
> > >>>>>> + * See `Xe ASSERTs`_ for general usage guidelines.
> > >>>>>> + */
> > >>>>>> +#define xe_gt_assert(gt, condition) xe_gt_assert_msg((gt), condition, "")
> > >>>>>> +#define xe_gt_assert_msg(gt, condition, msg, arg...) ({						\
> > >>>>>> +	struct xe_gt *__gt = (gt);								\
> > >>>>>> +	xe_tile_assert_msg(gt_to_tile(__gt), condition, "GT: %u type %d\n" msg,			\
> > >>>>>> +			   __gt->info.id, __gt->info.type, ## arg);				\
> > >>>>>> +})
> > >>>>>> +
> > >>>>>> +#endif
> > >>>>>
> > >>>

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
