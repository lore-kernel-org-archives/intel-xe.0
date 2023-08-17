Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EE21C3063E
	for <intel-xe@archiver.kernel.org>; Thu, 17 Aug 2023 15:16:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 306E510E066;
	Thu, 17 Aug 2023 15:16:02 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9107710E066
 for <intel-xe@lists.freedesktop.org>; Thu, 17 Aug 2023 15:15:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692285359; x=1723821359;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=7Ypkk6os3WCMErmb+lUDoVtpX24pYtdo7TTuE2/CzSw=;
 b=TLyKXNtbkmEWkbmI7O47PR2C9U6ac+1TyRoo9a/iAie1wt8QtXkDirj6
 bzjUvoY64Za60ole/NIfOTiFgb3dWFRvB9wB9NaANKdCB30uSw64/3H8p
 S1vYDHOg2NsQqLz1oM9YZtoHMJb6EH+KN/dBLX1chb5JJwdRytPP3OGer
 iNt8pHrmeBcwqDI4qg90Nq5QI/0XyBBBk+K6cG3cHZSstwu6qDzjo1XbE
 dhFJH5/J8J8ZL1mCuhodZERIW54kC5jeMJmkhqNdeFrfqa5eg1LqJQF5e
 q8C9c4tSPjVcseiNMOUhZ+Je+g04apqQi3cZreS8xkCutiI63352TT1UJ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="403821498"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; d="scan'208";a="403821498"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2023 08:15:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="769693713"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; d="scan'208";a="769693713"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga001.jf.intel.com with ESMTP; 17 Aug 2023 08:15:58 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 17 Aug 2023 08:15:57 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 17 Aug 2023 08:15:57 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.47) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 17 Aug 2023 08:15:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KlRNHVCrr7zerX8jfIjz5opIAKaOfNZjcWuU3zWLU2ux2xWQiqCSqIMUgG4ynxPiREcdbFiw8Eqgh8k9fA/iATNLbtoUxtWHgpskhGHHXHMdBH7syCFPfjo+jspM1YfPwB8m+2kjwGYvOdwl0raywq/IR77dMOcvd87g9P+E94zwxF0+QLZM7+JQF8Bn699M63Num4E2GQP8fskS90/jjlT2dhFHk4Gt1J2VGtKNgPdDunORyoAo406aBFcUQby1DbyV2qnf1qTIxfCbdPmSIoBR2nXjTtCC/Mi/rgVhGyPogtbSLKk3t6uWy3+us0PQ2Me19Ysx1dQkqmxPZGHsRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7Ypkk6os3WCMErmb+lUDoVtpX24pYtdo7TTuE2/CzSw=;
 b=oBj0Ut8n3VIH2MMbQB8n5Uyo7zipmDgZnqXxY6NBUDxyBV5x9vOsyawb/aV74yD76QxHONe80WA0nPhvtnsTK15lfBweQP09jUEywwhKRwqNo19UU1dC8qmm4Bgi1eDDiuidV3SD9pxOgHbvlYgYIWEz5+8XfRhHuXvXjaFtCdwo3m3fM6yN3IJl9bq2aQNpRPsd3HX6uGHC029d5stJSagQNo9uovtOOKVix7ylqeGBaZAz+GUJj0yiAynfwJN4/qxOF3+FUO2MSk/VGAU4HjFfx0tW533B0A+lKwyBil/xJREZ+9j6bDJnydEYLGHVBP5e+9JvqKw+XCpy+3x7PA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by MW4PR11MB7101.namprd11.prod.outlook.com (2603:10b6:303:219::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.26; Thu, 17 Aug
 2023 15:15:56 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::cc12:ab15:1d0:af79]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::cc12:ab15:1d0:af79%5]) with mapi id 15.20.6678.031; Thu, 17 Aug 2023
 15:15:56 +0000
Date: Thu, 17 Aug 2023 08:15:41 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <f3dqprpomg24atkzbnqucvzyasslsmwyzvp6o5gzlhr5sejvvk@xq4mvhuq76fj>
References: <20230811160618.477297-1-lucas.demarchi@intel.com>
 <20230811160618.477297-14-lucas.demarchi@intel.com>
 <20230811162347.GH3375865@mdroper-desk1.amr.corp.intel.com>
 <ezrst2rq54kbpo4qjdsu7t5r2mzuuvh6ek4yexjw7hqw4sqhjn@tdipjfziretp>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <ezrst2rq54kbpo4qjdsu7t5r2mzuuvh6ek4yexjw7hqw4sqhjn@tdipjfziretp>
X-ClientProxiedBy: BYAPR06CA0064.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::41) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|MW4PR11MB7101:EE_
X-MS-Office365-Filtering-Correlation-Id: 483744af-c85c-435e-4317-08db9f34da66
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UIgMh1NLvUEWMBYAEQPPC+KMblFCg9B52PWwDGexpfOynnnfeLrcDLDPcVooVyBJOkmUpvXTQ/zjrAL02eEy9Qn6PzEyna6WDcOZ4JAzB8tmTAxUXhkoeLRG1IU4HVcf/DSj5t/+d/e1aBfWD3Wv4oGIJ/O5btVeg6cpWF0SRhIW66hulNWKNKZuV+MT//gxQeiKHvA/zxdassAkAiGD42mpJhcOfx/8p64hPvP8uP/S1MP0ehVpmrJOLWy0JgXWTrG0l1hO0qLQtEf5xPMHO3r6+cb+qcFxdKbFJ2jJLcgthuukoCZjElart3r4ioExB2Fh734XltbHsFGONArCCQib3zjGZfqIkq9k3RzO1ElodTEDpSw85zRwtxpvLF9djD8YmYeEMoLjokP2HLI3/Fjd6x4iVxszWTAGADFFkiFUXbmZlvjyE7M4s8URqwrvYo7WuHPF7B6FS4rN5SbZVs8dFqQZdaRDYPKssUipyhd906aD04d4wclf4W3eZ3E7q3rGbauCKF2Hl0TqiT2a+Xa0LteHCdfhraD4KCD+Re/m/YZZS2PQaTuEBHvT+Gr1
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(366004)(376002)(136003)(346002)(39860400002)(396003)(186009)(451199024)(1800799009)(2906002)(83380400001)(4744005)(26005)(86362001)(478600001)(6506007)(6666004)(6486002)(6512007)(9686003)(5660300002)(41300700001)(6636002)(316002)(66946007)(66476007)(66556008)(4326008)(6862004)(8676002)(8936002)(82960400001)(33716001)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SOphMASsvudH8twmTxQ4fwfmQ3AMZO6sqAm7goPFUDN4e13/VoJ4c6yf1PgX?=
 =?us-ascii?Q?NdSwDUL1UcPSFSlc4G9UOAJ+l0kmXewH4DwVgNLXwm+tedXwXER8FYQuDkJ6?=
 =?us-ascii?Q?IYJg7zM9tZklaDXz6Ue1NcS+yRlp9BIItrzcAoWzxpfw/cszIs88An5gXE7p?=
 =?us-ascii?Q?Yx1bu8p2vtq74m6fXG0W9S1e8Jqy0cBoRFl7s+18Tn/4KDZrx61KpE9S5itG?=
 =?us-ascii?Q?ynJYKpUlbm2xK/6cF7R05FId0CiTwtV8PQTU8vSoYvt9VrP5Bs/GifFriCxM?=
 =?us-ascii?Q?jIMnDfSE3ZCEzRo8Kq+W7XoHlLk87CRmN5E/54VrUEQ6SzljFn217RDVRcDr?=
 =?us-ascii?Q?t07NvGMA5Tzf5oqwpe0xX2dOdNvIR7qPkb2iOwbRBaLRHtkvZMRW3VZ7bBbN?=
 =?us-ascii?Q?DAwLRhL49u1+86USAnIFMrsZ6XoDWWpoL6D0EpNdE28YIFpgw6vL0z7Y3lpN?=
 =?us-ascii?Q?kzgtT2OTtkfU7gpLOqhU8/K5WhTB+Qalyx2IAtfwpImWZuRQPXwlsMw5AcYc?=
 =?us-ascii?Q?BOIWgEIUObHLj2+qtorZHvCoOL3u+CsuhBSZbXwMoYnILLgyQgsAmGwYiUXR?=
 =?us-ascii?Q?EWr6pjTIWsc45JzZtNB0rqfHEZHqYu3prbU8ZPLbRcLWL1bKQojr5bAATXJ3?=
 =?us-ascii?Q?mYbM/hYMO33V3wpgCzJGdUa3AeCM/x3a4LSPJLC9o7QScCYXy5ditMLaMwvI?=
 =?us-ascii?Q?iSznU7Z/7A2Yb1rv0q4zrvjknCr5TMl3rN1WZsin5hop9mHKIqVxH+7pnXBQ?=
 =?us-ascii?Q?kOS74bwSGYnyCGOmir09bYoD0RP1PLqGonimQoEofNGbQD+ZaWRl1vAffCQc?=
 =?us-ascii?Q?baS5saZnQyIFFBZQueS7zElopnFQ2YtBg6kFXTpMoQOAwkoo+3d0phc7mrbO?=
 =?us-ascii?Q?X6LRaznhSdY7TW3x3lpK0d9r4oxI328yS7gLGxKPwAyqa7upaOtYN3KIVZW/?=
 =?us-ascii?Q?5lXRF82SSr3GNQ7lVYpZ9NUn2n8mj3ostSgs21A2QFId6tep4qhkmn1D1BUY?=
 =?us-ascii?Q?cpAcsQEp+C1zU1FMHnA4f2ZhBgVcpFwZipXxkqjYeu9ZUPrcjOu0zDgB//hC?=
 =?us-ascii?Q?HjlGPayrw8UMROqoDevQ99YfND+Vi82d2g6kG8KoC6nBivchodOpLyN4ogp+?=
 =?us-ascii?Q?TEqAwWvSk+UytKDKgGgQvBYDrgbZCB0OOWlLf3S1Ja5Vw87H3w5O0e5XImeU?=
 =?us-ascii?Q?wn7e3fqIrrk/BInorUqljjpefYA5kBRdd2uQ9XwggvgAUcABpNB+UPAxPMtq?=
 =?us-ascii?Q?mRj9F3jynz06MLDJCtD5EyZm1oHsDE20yiCESVN8VjMhPfxocHOk5Midb25L?=
 =?us-ascii?Q?YXdqmwzfRK+UTF5dlRqNB3Nm30gKUAolgOl/Ew3ex7fQ9F6Xnq+DDeiPHorR?=
 =?us-ascii?Q?w6+t1cXIhwhm8i1+FiltWN/XpBrb62LZZhJ7NfRN2wW3bxCayB9nVnzvHFeR?=
 =?us-ascii?Q?rBdbgMJ3TxJjmc34YvgCVgNYXlwvGYZQ2yEW8nitY2RGZhpHjBLW6uGGhso+?=
 =?us-ascii?Q?qxhc4PXqadcje/4+07uViV+L8ho4mvjlf0Lstb2OUj1flz832c8CoLMyrLG8?=
 =?us-ascii?Q?gGqQGsJg//G709O/f4WDQxU9yV2h+q4+kX/HfGefWHsIxM53rdw4FvXCqIun?=
 =?us-ascii?Q?LA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 483744af-c85c-435e-4317-08db9f34da66
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2023 15:15:56.2557 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZmHTMPCX49eDvdTTaWtLeyJvaJlV42BkUyRmnXGIZ9lJFVxkF9hMUEirI0lLg8UY/ZuLaxfFCnKL6uYvia9+oISQ5IhxzwC8ze4HFPlO3Ic=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7101
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 13/15] drm/xe/lnl: Add LNL platform definition
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

On Fri, Aug 11, 2023 at 09:42:49AM -0700, Lucas De Marchi wrote:
>On Fri, Aug 11, 2023 at 09:23:47AM -0700, Matt Roper wrote:
>>On Fri, Aug 11, 2023 at 09:06:16AM -0700, Lucas De Marchi wrote:
>>>From: Matt Roper <matthew.d.roper@intel.com>
>>>
>>>LNL is an integrated GPU based on the Xe2 architecture.
>>>
>>>Bspec: 70821
>>>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>>>Reviewed-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
>>
>>Since this patch is just being posted for the first time, was this
>>supposed to be a Cc: rather than an r-b?
>
>
>yes, it was supposed to be a Cc. Thanks for catching that.

since Bala confirmed his r-b, I will just keep it as is on the v2.

Lucas De Marchi
