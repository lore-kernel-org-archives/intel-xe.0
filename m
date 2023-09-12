Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADB36CA0EEB
	for <intel-xe@archiver.kernel.org>; Tue, 12 Sep 2023 16:14:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D68A10E438;
	Tue, 12 Sep 2023 16:14:50 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C7B210E438
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Sep 2023 16:14:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694535287; x=1726071287;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=JKzOLFAusxOJxu096gntNFhNYs2vu5OHmuhjLsRG3Fg=;
 b=WF1BKXVpYblp79k/eEl7QA0bkdYBwzl2FyB+3UPopxkFP8SM3BHa8hal
 V6/3aYGSH62plr6J+lCGD9X/lxYBKMoIaQbJVORGwLJoIr6iBqKh1qKBh
 O5WB/gAMAkXjYdsiSAX6WuOOc/xlOdIE1qj5Eozn+TM03ThFlHqlveJzp
 wtwKteRDIv4zUhgAsqC5s9SBksNBcpWp6PFH8un0D9DbaYwtHalOjHjCg
 wv1hz90DeO0wPRVjGP/LGmOZRZXyerPHdggNps7Vj/UFncQMC1vUffGyW
 JgqC0rLo+wDYnl/ObhDQSBNzj1k8JjGVsm0gmTwpwkPkeG0g/pEMVyix1 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="378330489"
X-IronPort-AV: E=Sophos;i="6.02,139,1688454000"; d="scan'208";a="378330489"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2023 09:08:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="720477405"
X-IronPort-AV: E=Sophos;i="6.02,139,1688454000"; d="scan'208";a="720477405"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Sep 2023 09:08:51 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 12 Sep 2023 09:08:51 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 12 Sep 2023 09:08:50 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Tue, 12 Sep 2023 09:08:50 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.46) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Tue, 12 Sep 2023 09:08:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TSgVF6N0Dgmf90dEWK2V6enBWWlrP0pDYJXQrh7vYuO4OCA7FkSb0olwEPNDOHuHjCotbuxeh8VjrKRhK80gSKqIiWy3ytZEKPO3XSsYJNNLK3wyrGEpmjXCHHzqY4TAgddiDUj1Wy0u7xzPHcpQn/oGOxwE0tInmlFZ38dqt5Nda7LonECF76KejNzIZyoJxUvFXe3vtKLeKKkvdkbFAhmaYVFRlxTmL6S2kfDM8DelTO6Dwr8BA8sNW3+gg32xrf8snDQOuMaj4bmfwDUG55JPgHAuSg9PqiLo+M2+dsaUyoKvS57pknx0XAE+TcfPPf0O3doV01fXHTwI+hZ1QA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9ezD2+jg7z2HXvD5Xa86Mdlgde/zuwylnS58y6PnnCI=;
 b=BhcG4zp5CdaKdg+rLw4FPnTaHqVYKTlx+S2cdOIcyd+fjSNyfOsUG3YnKtZFLTxa0q72/XRIr8UaTXWhYQGdRTyIEipOgKq7pij5oPPOweSUdRIMCy7co3Vbz3UxeQGPEFRXKmKox0ENzA6dyZ0FzKYI5xnSBx+mDhowy7aVJPpboJH1+ithQQbtTJ7Yjm1PEvwxWbhQiLeNIGtFh1+hUtAOj1+H/dHdWlAUsl1GmzFXO/zrSNzW/xHU2+Bs8wK8Kg0/VixfEMNgoKlR1aH2l7bF7izkJBiCMJll4E2MvyQdLgWX+JfNHioEB9t7PSh4haNPFWp47davsURry6Lhaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DM4PR11MB5568.namprd11.prod.outlook.com (2603:10b6:5:388::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.37; Tue, 12 Sep
 2023 16:08:46 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294%5]) with mapi id 15.20.6745.034; Tue, 12 Sep 2023
 16:08:46 +0000
Date: Tue, 12 Sep 2023 12:08:41 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <ZQCNCbo7x3wohmDy@intel.com>
References: <20230912083635.7-1-francois.dugast@intel.com>
 <20230912083635.7-3-francois.dugast@intel.com>
 <87pm2nd3p1.fsf@intel.com>
 <b9a8df25-d070-9339-fdb7-2b4cd9d66fb3@intel.com>
 <871qf3y0qa.fsf@intel.com>
 <268cacb5-2feb-b43f-325f-5aef9cf8951f@intel.com>
 <ZQBz0Mk3O71oebl+@intel.com>
 <85abfd0d-0eef-b90d-37d2-297cfb53db1e@intel.com>
 <ZQCGNl3RjgSYs4Sa@intel.com>
 <20230912154633.GF6080@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230912154633.GF6080@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: MW4PR04CA0115.namprd04.prod.outlook.com
 (2603:10b6:303:83::30) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|DM4PR11MB5568:EE_
X-MS-Office365-Filtering-Correlation-Id: ebf3e731-972b-4758-6df5-08dbb3aa8b40
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: K90u8tCHedNg696sZBZ5wXroLQbaKCZ4DKjn+YhTs6jDpnJbQxkdSIJYY9fl2z6NGPvXBH1KOjCRkIJejwOW1DKoy2qHuL3GEBlBXnM6w1j0bqzBvXFoVkFnQh5Vwnkw5f3kpGBBF7b1D+5Gzxj8c6eBHfo2vqMLOUjC1QJuL7SE6Otn5fXlYT3iMpmUVCGMl09GtGxkYUrLSTIMfMo7++cQHGU7OzQLMjS1RU8v2T0nAr6kG6fH2GHH8FFRUZCJxteqeTjQU6b0ifLQdDnU8ZXhBzEnh/Jr8AQzHZ00uwEtc4nMEJTZGMN5ngJQNIo5XoCAyG4DKU7/9af437cy383ObF8m6IjjnZzgTwkLhWCzdg7GbsjjHqmhFwVfesSAOyaJV2qLzYyzxD4Uzuo8wwCnV4I5pNYWeAROpNRC/PEgUfuHbB7bEUr7VxvdQG97mdxPGJdbdHFexgx9QJvKyq/F4wWfbn4wSqkAiX0hKrOY4NeDjumpHwWlnale9zm/aMLhatXkUVmpy83qxaBfFYzF8kXYogEgCLO3Wpz2+1Vt/bPA/Kq0KE6bMgBR5Pb9
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(396003)(346002)(39860400002)(136003)(376002)(186009)(451199024)(1800799009)(54906003)(316002)(66946007)(6636002)(37006003)(66556008)(41300700001)(66899024)(66476007)(478600001)(38100700002)(82960400001)(30864003)(86362001)(36756003)(2906002)(4326008)(44832011)(5660300002)(6862004)(8676002)(8936002)(26005)(107886003)(2616005)(53546011)(6666004)(83380400001)(6486002)(6506007)(6512007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?irkdqdUaM/x5hzoFeoCQTEltExdhIEx+TnBUyV4fBrKIoGr295nFop5QHl?=
 =?iso-8859-1?Q?IFUkssmWcb8HV4yWeGHXPuxX+ORu/s+bapBriX9EmmKDHzcF9sCfjYzUrJ?=
 =?iso-8859-1?Q?PpGxOi8SShxuXSex3d19fksxijzHvpAjZ8FHcDVtdjWTQhv8DmO5lf5Imi?=
 =?iso-8859-1?Q?yrPtlF2tDGOiOdEf16SfeUkmv67fKAxYraonDJIiOw/AUlHogeuK3h1CNz?=
 =?iso-8859-1?Q?KaHAB1Jbt5EM1mrRId2pbla5S9JW46YbmDMqHv9RSQL1I3zvVAbtrFYrJg?=
 =?iso-8859-1?Q?tNLSbo1V4IHqalRMKBF7a1QLT4M1LCOL3aULnSo4eT0Opiq/JnENx8qNSD?=
 =?iso-8859-1?Q?vFejYQ1wDa+sAV6oEPqBvTNQzjuPgkrh3wH0mo1zvBjDoJi9+THUyRyNqC?=
 =?iso-8859-1?Q?Z9bxmRg9oPqScx+v5/3VdreNeGM5qYvY//V0wVxPejaG9tr7yTY0FKd98D?=
 =?iso-8859-1?Q?VkrF0r5BTgHKEX6JJfdtL37V2QFpUrqQq3SysQehFbKU91kJziwJ29q7Fr?=
 =?iso-8859-1?Q?HNgjfmXaqFyNyB7VHUrRQp4weCcWCwaQL++wggdFcQp6DVDQCh/hjguDYI?=
 =?iso-8859-1?Q?pCIluuySazOTXsDALEmJBD1zwK/abAI4LzONZDHBuibnR8GL8pAmHkNHmi?=
 =?iso-8859-1?Q?iM3LV7P+DeNOuOBxq42Zuy6sZ+3OXGVeZORlm+OpxPDyLQaeTNCobqu42F?=
 =?iso-8859-1?Q?YVQlSJxubvNS0jKgn4Qr2oDGNNbAxHqFAV8dSnmMMcwKrnsu4E00EC6stI?=
 =?iso-8859-1?Q?TsOlwQQtl/pOtzg8XdU0UOqrIftAeZfCf94dvSoir9jVPaHQywvQDdV6RZ?=
 =?iso-8859-1?Q?PXGNjEdMagFILjcG/M7p7TciD0U1livnqpFAgjEgZ7oeHcPGRrhY5IBJ2S?=
 =?iso-8859-1?Q?Pn9Y8dwp2cZrvfcG73MueijGCfX2XLPsUbaFGyf7FzG5r/tcM61vL+fPk6?=
 =?iso-8859-1?Q?w3RBTbTYMGpAD5BGai7JQZbwWcPQMD98qbSvrLAnLsQeYZuFl5YK3A9Yib?=
 =?iso-8859-1?Q?r0BlBd02CdC6p7lvb7mhc6y7jcLpgdGrvYdos6lUb6vsEoSXCFp6KmoLCk?=
 =?iso-8859-1?Q?hHgvBVNA8L22uWiguAUF0jHrKsl1o1C0oiVHK9cUOyWbpvYP6ZHcaUWsJ1?=
 =?iso-8859-1?Q?o3nHchtGbuJews+hwLZs4Ag743QMhVU+lYolCqIXuMxEl0XrH5SnL6K00g?=
 =?iso-8859-1?Q?APTesdRdHcemW9vVKkJLr/vkE3o+QZInYnscucG8jXemSzmtvFxw2VYKHY?=
 =?iso-8859-1?Q?tSglEkbrqhIXvH7WKXRrt5i0S5nxvG4jNwAqQkXZY8r7zgn7oM3x36QvcV?=
 =?iso-8859-1?Q?gVSCwEeWQIiDn3r5WCWgyx2bndMUhw97w0InrOT8rt4dJC+VVAMRS+xRiG?=
 =?iso-8859-1?Q?zgtPgXQ1WGSN0SGziLzU9TsnjpPvuihTSxV0w4ebMXtY72w6PDP6Af7CUX?=
 =?iso-8859-1?Q?Y16BxH5CXYm98NbWez6xAaNHMF20fy8oY2eAPTKug+E8gGTf4z5ZbhPHoo?=
 =?iso-8859-1?Q?cD/zn+9xj128jk/WNZeP8uiGNDde83xbUnMmtV+cCIOsLCf4WLCRwSx6wH?=
 =?iso-8859-1?Q?c0lIgGatCRPcVDixLFQ+OFSpHuIq7atb5mM5mGLpoX5ThZFub4fKnKl9SU?=
 =?iso-8859-1?Q?A3EXGck7yj7nM+XctZ1x+rHzZ3OoSnQnce?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ebf3e731-972b-4758-6df5-08dbb3aa8b40
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2023 16:08:46.7854 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 488iXYh87ncCF3gzjrOG18yKwKpuGKsrNQcQUQgsXmB/jV5QKswYnr+mE4MZWKNZwABPBQBikS10Gzj3TUalAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5568
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

On Tue, Sep 12, 2023 at 08:46:33AM -0700, Matt Roper wrote:
> On Tue, Sep 12, 2023 at 11:39:34AM -0400, Rodrigo Vivi wrote:
> > On Tue, Sep 12, 2023 at 05:11:13PM +0200, Michal Wajdeczko wrote:
> > > 
> > > 
> > > On 12.09.2023 16:21, Rodrigo Vivi wrote:
> > > > On Tue, Sep 12, 2023 at 03:48:01PM +0200, Michal Wajdeczko wrote:
> > > >>
> > > >>
> > > >> On 12.09.2023 15:34, Jani Nikula wrote:
> > > >>> On Tue, 12 Sep 2023, Michal Wajdeczko <michal.wajdeczko@intel.com> wrote:
> > > >>>> On 12.09.2023 13:35, Jani Nikula wrote:
> > > >>>>> On Tue, 12 Sep 2023, Francois Dugast <francois.dugast@intel.com> wrote:
> > > >>>>>> From: Michal Wajdeczko <michal.wajdeczko@intel.com>
> > > >>>>>>
> > > >>>>>> As we are moving away from the controversial XE_BUG_ON macro,
> > > >>>>>> relying just on WARN_ON or drm_err does not cover the cases
> > > >>>>>> where we want to annotate functions with additional detailed
> > > >>>>>> debug checks to assert that all prerequisites are satisfied,
> > > >>>>>> without paying footprint or performance penalty on non-debug
> > > >>>>>> builds, where all misuses introduced during code integration
> > > >>>>>> were already fixed.
> > > >>>>>>
> > > >>>>>> Introduce family of Xe assert macros that try to follow classic
> > > >>>>>> assert() utility and can be compiled out on non-debug builds.
> > > >>>>>>
> > > >>>>>> Macros are based on drm_WARN, but unlikely to origin, disallow
> > > >>>>>> use in expressions since we will compile that code out.
> > > >>>>>>
> > > >>>>>> As we are operating on the xe pointers, we can print additional
> > > >>>>>> information about the device, like tile or GT identifier, that
> > > >>>>>> is not available from generic WARN report:
> > > >>>>>>
> > > >>>>>> [ ] xe 0000:00:02.0: [drm] Assertion `true == false` failed!
> > > >>>>>>     platform: 1 subplatform: 1
> > > >>>>>>     graphics: Xe_LP 12.00 step B0
> > > >>>>>>     media: Xe_M 12.00 step B0
> > > >>>>>>     display: enabled step D0
> > > >>>>>>     tile: 0 VRAM 0 B
> > > >>>>>>     GT: 0 type 1
> > > >>>>>>
> > > >>>>>> [ ] xe 0000:b3:00.0: [drm] Assertion `true == false` failed!
> > > >>>>>>     platform: 7 subplatform: 3
> > > >>>>>>     graphics: Xe_HPG 12.55 step A1
> > > >>>>>>     media: Xe_HPM 12.55 step A1
> > > >>>>>>     display: disabled step **
> > > >>>>>>     tile: 0 VRAM 14.0 GiB
> > > >>>>>>     GT: 0 type 1
> > > >>>>>>
> > > >>>>>> [ ] WARNING: CPU: 0 PID: 2687 at drivers/gpu/drm/xe/xe_device.c:281 xe_device_probe+0x374/0x520 [xe]
> > > >>>>>> [ ] RIP: 0010:xe_device_probe+0x374/0x520 [xe]
> > > >>>>>> [ ] Call Trace:
> > > >>>>>> [ ]  ? __warn+0x7b/0x160
> > > >>>>>> [ ]  ? xe_device_probe+0x374/0x520 [xe]
> > > >>>>>> [ ]  ? report_bug+0x1c3/0x1d0
> > > >>>>>> [ ]  ? handle_bug+0x42/0x70
> > > >>>>>> [ ]  ? exc_invalid_op+0x14/0x70
> > > >>>>>> [ ]  ? asm_exc_invalid_op+0x16/0x20
> > > >>>>>> [ ]  ? xe_device_probe+0x374/0x520 [xe]
> > > >>>>>> [ ]  ? xe_device_probe+0x374/0x520 [xe]
> > > >>>>>> [ ]  xe_pci_probe+0x6e3/0x950 [xe]
> > > >>>>>> [ ]  ? lockdep_hardirqs_on+0xc7/0x140
> > > >>>>>> [ ]  pci_device_probe+0x9e/0x160
> > > >>>>>> [ ]  really_probe+0x19d/0x400
> > > >>>>>>
> > > >>>>>> v2: use lowercase names
> > > >>>>>> v3: apply xe coding style
> > > >>>>>>
> > > >>>>>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> > > >>>>>> Cc: Oded Gabbay <ogabbay@kernel.org>
> > > >>>>>> Cc: Jani Nikula <jani.nikula@intel.com>
> > > >>>>>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > >>>>>> Cc: Matthew Brost <matthew.brost@intel.com>
> > > >>>>>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> > > >>>>>> Cc: Matt Roper <matthew.d.roper@intel.com>
> > > >>>>>> Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
> > > >>>>>> Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > >>>>>> ---
> > > >>>>>>  drivers/gpu/drm/xe/xe_assert.h | 177 +++++++++++++++++++++++++++++++++
> > > >>>>>>  1 file changed, 177 insertions(+)
> > > >>>>>>  create mode 100644 drivers/gpu/drm/xe/xe_assert.h
> > > >>>>>>
> > > >>>>>> diff --git a/drivers/gpu/drm/xe/xe_assert.h b/drivers/gpu/drm/xe/xe_assert.h
> > > >>>>>> new file mode 100644
> > > >>>>>> index 000000000000..b2d3c9b82b31
> > > >>>>>> --- /dev/null
> > > >>>>>> +++ b/drivers/gpu/drm/xe/xe_assert.h
> > > >>>>>> @@ -0,0 +1,177 @@
> > > >>>>>> +/* SPDX-License-Identifier: MIT */
> > > >>>>>> +/*
> > > >>>>>> + * Copyright © 2023 Intel Corporation
> > > >>>>>> + */
> > > >>>>>> +
> > > >>>>>> +#ifndef _XE_ASSERT_H_
> > > >>>>>> +#define _XE_ASSERT_H_
> > > >>>>>> +
> > > >>>>>> +#include <linux/string_helpers.h>
> > > >>>>>> +
> > > >>>>>> +#include <drm/drm_print.h>
> > > >>>>>> +
> > > >>>>>> +#include "xe_device_types.h"
> > > >>>>>> +#include "xe_step.h"
> > > >>>>>> +
> > > >>>>>> +/**
> > > >>>>>> + * DOC: Xe ASSERTs
> > > >>>>>> + *
> > > >>>>>> + * While Xe driver aims to be simpler than legacy i915 driver it is still
> > > >>>>>> + * complex enough that some changes introduced while adding new functionality
> > > >>>>>> + * could break the existing code.
> > > >>>>>> + *
> > > >>>>>> + * Adding &drm_WARN or &drm_err to catch unwanted programming usage could lead
> > > >>>>>> + * to undesired increased driver footprint and may impact production driver
> > > >>>>>> + * performance as this additional code will be always present.
> > > >>>>>> + *
> > > >>>>>> + * To allow annotate functions with additional detailed debug checks to assert
> > > >>>>>> + * that all prerequisites are satisfied, without worrying about footprint or
> > > >>>>>> + * performance penalty on production builds where all potential misuses
> > > >>>>>> + * introduced during code integration were already fixed, we introduce family
> > > >>>>>> + * of Xe assert macros that try to follow classic assert() utility:
> > > >>>>>> + *
> > > >>>>>> + *  * &xe_assert
> > > >>>>>> + *  * &xe_tile_assert
> > > >>>>>> + *  * &xe_gt_assert
> > > >>>>>> + *
> > > >>>>>> + * These macros are implemented on top of &drm_WARN, but unlikely to the origin,
> > > >>>>>> + * warning is triggered when provided condition is false. Additionally all above
> > > >>>>>> + * assert macros cannot be used in expressions or as a condition, since
> > > >>>>>> + * underlying code will be compiled out on non-debug builds.
> > > >>>>>> + *
> > > >>>>>> + * Note that these macros are not intended for use to cover known gaps in the
> > > >>>>>> + * implementation; for such cases use regular &drm_WARN or &drm_err and provide
> > > >>>>>> + * valid safe fallback.
> > > >>>>>> + *
> > > >>>>>> + * Also in cases where performance or footprint is not an issue, developers
> > > >>>>>> + * should continue to use the regular &drm_WARN or &drm_err to ensure that bug
> > > >>>>>> + * reports from production builds will contain meagningful diagnostics data.
> > > >>>>>> + *
> > > >>>>>> + * Below code shows how asserts could help in debug to catch unplanned use::
> > > >>>>>> + *
> > > >>>>>> + *	static void one_igfx(struct xe_device *xe)
> > > >>>>>> + *	{
> > > >>>>>> + *		xe_assert(xe, xe->info.is_dgfx == false);
> > > >>>>>> + *		xe_assert(xe, xe->info.tile_count == 1);
> > > >>>>>> + *	}
> > > >>>>>> + *
> > > >>>>>> + *	static void two_dgfx(struct xe_device *xe)
> > > >>>>>> + *	{
> > > >>>>>> + *		xe_assert(xe, xe->info.is_dgfx);
> > > >>>>>> + *		xe_assert(xe, xe->info.tile_count == 2);
> > > >>>>>> + *	}
> > > >>>>>> + *
> > > >>>>>> + *	void foo(struct xe_device *xe)
> > > >>>>>> + *	{
> > > >>>>>> + *		if (xe->info.dgfx)
> > > >>>>>> + *			return two_dgfx(xe);
> > > >>>>>> + *		return one_igfx(xe);
> > > >>>>>> + *	}
> > > >>>>>> + *
> > > >>>>>> + *	void bar(struct xe_device *xe)
> > > >>>>>> + *	{
> > > >>>>>> + *		if (drm_WARN_ON(xe->drm, xe->info.tile_count > 2))
> > > >>>>>> + *			return;
> > > >>>>>> + *
> > > >>>>>> + *		if (xe->info.tile_count == 2)
> > > >>>>>> + *			return two_dgfx(xe);
> > > >>>>>> + *		return one_igfx(xe);
> > > >>>>>> + *	}
> > > >>>>>> + */
> > > >>>>>> +
> > > >>>>>> +#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
> > > >>>>>> +#define __xe_assert_msg(xe, condition, msg, arg...) ({						\
> > > >>>>>> +	(void)drm_WARN(&(xe)->drm, !(condition), "[" DRM_NAME "] Assertion `%s` failed!\n" msg,	\
> > > >>>>>> +		       __stringify(condition), ## arg);						\
> > > >>>>>> +})
> > > >>>>>> +#else
> > > >>>>>> +#define __xe_assert_msg(xe, condition, msg, arg...) ({						\
> > > >>>>>> +	typecheck(struct xe_device *, xe);							\
> > > >>>>>> +	BUILD_BUG_ON_INVALID(condition);							\
> > > >>>>>> +})
> > > >>>>>> +#endif
> > > >>>>>> +
> > > >>>>>> +/**
> > > >>>>>> + * xe_assert - warn if condition is false when debugging.
> > > >>>>>> + * @xe: the &struct xe_device pointer to which &condition applies
> > > >>>>>> + * @condition: condition to check
> > > >>>>>> + *
> > > >>>>>> + * xe_assert() uses &drm_WARN to emit a warning and print additional information
> > > >>>>>> + * that could be read from the &xe pointer if provided &condition is false.
> > > >>>>>> + *
> > > >>>>>> + * Contrary to &drm_WARN, xe_assert() is effective only on debug builds
> > > >>>>>> + * (&CONFIG_DRM_XE_DEBUG must be enabled) and cannot be used in expressions
> > > >>>>>> + * or as a condition.
> > > >>>>>> + *
> > > >>>>>> + * See `Xe ASSERTs`_ for general usage guidelines.
> > > >>>>>> + */
> > > >>>>>> +#define xe_assert(xe, condition) xe_assert_msg((xe), condition, "")
> > > >>>>>> +#define xe_assert_msg(xe, condition, msg, arg...) ({						\
> > > >>>>>> +	struct xe_device *__xe = (xe);								\
> > > >>>>>> +	__xe_assert_msg(__xe, condition,							\
> > > >>>>>> +			"platform: %d subplatform: %d\n"					\
> > > >>>>>> +			"graphics: %s %u.%02u step %s\n"					\
> > > >>>>>> +			"media: %s %u.%02u step %s\n"						\
> > > >>>>>> +			"display: %s step %s\n"							\
> > > >>>>>> +			msg,									\
> > > >>>>>> +			__xe->info.platform, __xe->info.subplatform,				\
> > > >>>>>> +			__xe->info.graphics_name,						\
> > > >>>>>> +			__xe->info.graphics_verx100 / 100,					\
> > > >>>>>> +			__xe->info.graphics_verx100 % 100,					\
> > > >>>>>> +			xe_step_name(__xe->info.step.graphics),					\
> > > >>>>>> +			__xe->info.media_name,							\
> > > >>>>>> +			__xe->info.media_verx100 / 100,						\
> > > >>>>>> +			__xe->info.media_verx100 % 100,						\
> > > >>>>>> +			xe_step_name(__xe->info.step.media),					\
> > > >>>>>> +			str_enabled_disabled(__xe->info.enable_display),			\
> > > >>>>>> +			xe_step_name(__xe->info.step.display),					\
> > > >>>>>> +			## arg);								\
> > > >>>>>> +})
> > > >>>>>
> > > >>>>> I guess I have missed this huge splat all along... Why is it necessary?
> > > >>>>> If you print the device id, all the information should be there already,
> > > >>>>> right?
> > > >>>>
> > > >>>> somewhere in the dmesg (if someone/CI was clever enough) maybe yes
> > > >>>>
> > > >>>> but in bug reports usually only the WARN is included, so exposing some
> > > >>>> basic info here for quicker triage
> > > >>>
> > > >>> I just think it's unnecessary duplication. 
> > > >>
> > > >> but what if assert() fires before driver print welcome messages ;)
> > > >>
> > > >> IMO we should try to collect whatever is possible and comes almost at no
> > > >> extra cost (you don't need to type anything, macro takes care of that)
> > > >>
> > > >>> Most likely this will only be
> > > >>> enabled in CI only anyway.
> > > >>
> > > >> I assume asserts will fire mostly during pre-merge testing (either on CI
> > > >> or on tested manually on DUT machines)
> > > > 
> > > > I'm with Jani here. In all of these cases you already know the PCI ID of
> > > > that specific machine, so all this extra information should already be known.
> > > > 
> > > > The only benefit would be to get user reports when we get just that debug
> > > > msg. But also asking for a lspci -nn | grep VGA was never that complicated.
> > > 
> > > but lspci will not show you the GMDID, so how you will know IP version?
> > 
> > if you know the PCI DEVICE ID you know the GMDID. Just read the spec.
> 
> A big part of the motivation for GMD_ID is that you won't be able to
> rely on PCI ID going forward.  At the moment it may still be true that
> you can always figure it out since we only have two platforms and three
> possible IP versions, but eventually there's going to be cases where
> multiple possible IP versions map to the same PCI device.

more specifically to the pre-production step id. We should never have a pci id
mapping to different SKU versions. Nor even to different *production* stepping.
We always need a different unique PCI ID.

But okay, the pre-production steppings and with different workarounds per
step I believe we have a very good case for going with this debug info in here.

Francois, let's just go ahead and push this version as is. Any further discussion
around this topic can be a follow-up.

> 
> 
> Matt
> 
> > 
> > > likely same problem with VRAM size as you will see just BAR size, no?
> > 
> > I don't understand this comment since I don't see vram info above.
> > we are talking about the GMDID info.
> > 
> > > and in the near future how to distinguish between native and PF mode?
> > 
> > afaik, PF or VF, the PCI ID and the hardware version underneath won't
> > change.
> > 
> > > 
> > > > 
> > > > My recommendation is to remove the duplication of this information here.
> > > 
> > > honestly I don't understand why are we aiming to have totally silent
> > > driver that makes any debug just harder and clueless - maybe it's time
> > > to help early adopters and feature enablers by providing more, even if
> > > duplicated, data which is still better than nothing - like in case when
> > > the driver decides to fail the probe ... you may just start guessing why
> > 
> > are we talking about early adopters that cannot read the spec and cannot
> > map the PCI DEVICE ID to the GMDID? Interesting...
> > 
> > > 
> > > > But this is not a blocker in my opinion and we could go with this patch as is.
> > 
> > But again ^
> > 
> > > > 
> > > > Jani, do you see this as a blocker and a new version needed?
> > > > 
> > > > maybe a follow-up later so we don't block this entire series?
> > > > 
> > > > Thanks,
> > > > Rodrigo.
> > > > 
> > > >>
> > > >>>
> > > >>>>
> > > >>>>>
> > > >>>>> This also makes it impossible to use xe_assert() with a NULL xe device
> > > >>>>> pointer in contexts where you don't have the device available.
> > > >>>>
> > > >>>> there was no such requirement (but we can add that if needed)
> > > >>>>
> > > >>>> note that code is based on drm_WARN() which also doesn't work with NULL
> > > >>>
> > > >>> Ah, true. The drm_dbg and friends do.
> > > >>
> > > >> true, so do you want xe_assert() and family to also accept NULL ?
> > > >>
> > > >>>
> > > >>>>
> > > >>>> Michal
> > > >>>>
> > > >>>>>
> > > >>>>> BR,
> > > >>>>> Jani.
> > > >>>>>
> > > >>>>>
> > > >>>>>> +
> > > >>>>>> +/**
> > > >>>>>> + * xe_tile_assert - warn if condition is false when debugging.
> > > >>>>>> + * @tile: the &struct xe_tile pointer to which &condition applies
> > > >>>>>> + * @condition: condition to check
> > > >>>>>> + *
> > > >>>>>> + * xe_tile_assert() uses &drm_WARN to emit a warning and print additional
> > > >>>>>> + * information that could be read from the &tile pointer if provided &condition
> > > >>>>>> + * is false.
> > > >>>>>> + *
> > > >>>>>> + * Contrary to &drm_WARN, xe_tile_assert() is effective only on debug builds
> > > >>>>>> + * (&CONFIG_DRM_XE_DEBUG must be enabled) and cannot be used in expressions
> > > >>>>>> + * or as a condition.
> > > >>>>>> + *
> > > >>>>>> + * See `Xe ASSERTs`_ for general usage guidelines.
> > > >>>>>> + */
> > > >>>>>> +#define xe_tile_assert(tile, condition) xe_tile_assert_msg((tile), condition, "")
> > > >>>>>> +#define xe_tile_assert_msg(tile, condition, msg, arg...) ({					\
> > > >>>>>> +	struct xe_tile *__tile = (tile);							\
> > > >>>>>> +	char __buf[10];										\
> > > >>>>>> +	xe_assert_msg(tile_to_xe(__tile), condition, "tile: %u VRAM %s\n" msg,			\
> > > >>>>>> +		      __tile->id, ({ string_get_size(__tile->mem.vram.actual_physical_size, 1,	\
> > > >>>>>> +				     STRING_UNITS_2, __buf, sizeof(__buf)); __buf; }), ## arg);	\
> > > >>>>>> +})
> > > >>>>>> +
> > > >>>>>> +/**
> > > >>>>>> + * xe_gt_assert - warn if condition is false when debugging.
> > > >>>>>> + * @gt: the &struct xe_gt pointer to which &condition applies
> > > >>>>>> + * @condition: condition to check
> > > >>>>>> + *
> > > >>>>>> + * xe_gt_assert() uses &drm_WARN to emit a warning and print additional
> > > >>>>>> + * information that could be safetely read from the &gt pointer if provided
> > > >>>>>> + * &condition is false.
> > > >>>>>> + *
> > > >>>>>> + * Contrary to &drm_WARN, xe_gt_assert() is effective only on debug builds
> > > >>>>>> + * (&CONFIG_DRM_XE_DEBUG must be enabled) and cannot be used in expressions
> > > >>>>>> + * or as a condition.
> > > >>>>>> + *
> > > >>>>>> + * See `Xe ASSERTs`_ for general usage guidelines.
> > > >>>>>> + */
> > > >>>>>> +#define xe_gt_assert(gt, condition) xe_gt_assert_msg((gt), condition, "")
> > > >>>>>> +#define xe_gt_assert_msg(gt, condition, msg, arg...) ({						\
> > > >>>>>> +	struct xe_gt *__gt = (gt);								\
> > > >>>>>> +	xe_tile_assert_msg(gt_to_tile(__gt), condition, "GT: %u type %d\n" msg,			\
> > > >>>>>> +			   __gt->info.id, __gt->info.type, ## arg);				\
> > > >>>>>> +})
> > > >>>>>> +
> > > >>>>>> +#endif
> > > >>>>>
> > > >>>
> 
> -- 
> Matt Roper
> Graphics Software Engineer
> Linux GPU Platform Enablement
> Intel Corporation
