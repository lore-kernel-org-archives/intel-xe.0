Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 918C6EE14D0
	for <intel-xe@archiver.kernel.org>; Wed,  6 Sep 2023 19:59:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3026E10E704;
	Wed,  6 Sep 2023 19:59:58 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA25710E704
 for <intel-xe@lists.freedesktop.org>; Wed,  6 Sep 2023 19:59:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694030395; x=1725566395;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=ky7sRVxdrq2b/O1sDOgh7UYRa+IxGi3G+PS2wXZDJZo=;
 b=mD780WWjpRpHPKXwrMpRA1a/DntM2FBT5tefV+6Zaua04X60fd0HC45M
 mhfAqEPfgBAAkUXXpD0Rdy3KLOBEr/DTtC95rc672OKJgsjKOU9tI9mke
 kKel/pLfNSJuAimyspXYU8OEXmo21GzuV2kM2eR3KZXtHlOxHcTkl4pcn
 l2tuAkiMYEll1uT9NbMqG3bbjV1eAcTwOGOJA3++YD6kPQ4ooyv3ghta0
 BG59lTlSW4MQcdJYbHxNmX/bVlwt466ZvW5AY7sgRVmqqMOp1WLZtcznY
 gnn3bY8HSDrmeZ7sOAxalUyQ2N+l9IfMXa7/0WAtZKl8I9zWO8aZKNZMa g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="443556647"
X-IronPort-AV: E=Sophos;i="6.02,233,1688454000"; d="scan'208";a="443556647"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2023 12:59:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="1072516425"
X-IronPort-AV: E=Sophos;i="6.02,233,1688454000"; d="scan'208";a="1072516425"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Sep 2023 12:59:54 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 6 Sep 2023 12:59:54 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 6 Sep 2023 12:59:53 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.105)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 6 Sep 2023 12:59:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lnrFIq/XTRXOqhWQBgOyqCB+LoT54+C9HWMEvm3bWEQ+W4Yzl+l+4wV+vbxMmTV2NQQaA65ccBBsmJnvM4M3//WLrRiOjcD7vSaz529VLqoly9p3UVajIp3uTPIpjZWXpvSCMP2Ud7k72H1oSExU6YqDCejRrR8aJoB1/M66DWrrQg5x+knI+n+Au7f2dOIbLgB5T+GgM3CJmyUmXc9Hza4uvrhLhsQciIvmUapQyXiKt9eBfWURq43SY3z0GlaJh2kAg1HHgIjUT/fP9oJobn9AwAvSamWBjPaGDPadIu1jNjHOEBsif/zbDVcYosN0KtkuTwZTgkrsW8CA0LNTVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AU0aHiwAhWJ/rfY3SE71lm5f4wvoddDu8rhUav9hN5g=;
 b=YKO7M56BOpbHV5b7uCcO2Z/B3UiqTaExMLlVcId0fBxsnV2POrMsVVHCfKiE2xn0Ii/GNjC9NSWPlVlagDZTovJh7TXYoVw4i/Nb89+2kzl4HYb7segUH2hxt9aL4Gs5sslrop+dwpys33uwpZ2aGBf2Gsahp9rEC2LfF/+y3QW8fJJO66lSqAYZ31s5SabrWo0JygvL83cfdrxvjrmKxmCqex0zyVIWtMWColR5wRKaB2Fg/2mzVUjh0PDWcAmMbS0ZhJozd3BiluKLrhUlMwUAxJqBYWkvxesm30V07rQaYIK8VGxTCh2DcY9fBmXRKJUo0xLLx9q0iVvcSFWbAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN8PR11MB3556.namprd11.prod.outlook.com (2603:10b6:408:8d::31)
 by CH3PR11MB8137.namprd11.prod.outlook.com (2603:10b6:610:15c::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.34; Wed, 6 Sep
 2023 19:59:45 +0000
Received: from BN8PR11MB3556.namprd11.prod.outlook.com
 ([fe80::b535:230:d75d:bba0]) by BN8PR11MB3556.namprd11.prod.outlook.com
 ([fe80::b535:230:d75d:bba0%4]) with mapi id 15.20.6745.034; Wed, 6 Sep 2023
 19:59:45 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230906193009.1912129-1-lucas.demarchi@intel.com>
References: <20230906193009.1912129-1-lucas.demarchi@intel.com>
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 <intel-xe@lists.freedesktop.org>
Date: Wed, 6 Sep 2023 16:59:39 -0300
Message-ID: <169403037928.1922.4178883236664989581@gjsousa-mobl2>
User-Agent: alot/0.10
X-ClientProxiedBy: BYAPR06CA0067.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::44) To BN8PR11MB3556.namprd11.prod.outlook.com
 (2603:10b6:408:8d::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR11MB3556:EE_|CH3PR11MB8137:EE_
X-MS-Office365-Filtering-Correlation-Id: a4c6aea5-b4b4-4c05-f4a5-08dbaf13d145
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eJfoeINmfkgPm91NubxM2W6IflS7wgl9LCQqyqnVdFA41kKR2JMovzBf9kYJDgKvUCRFqWxZfljt241RHhnYbST+AxxCTEh11aXIMUEsKPYSnOaOWyIURHvmb6ZOQdoijrSfzmaai2vx4Fte5crdksCwcfiocwXYwFaTmIYhTjw4QzLEPEGnNbqUaxIPH3qlpyZnycQHMz6ze72tfbGEYNlFR7cJrpzFGL33ghC/yhQ6VVLuUkzEaAewOvGgy64wRCzZugRBzbPTMPJJsk9YK8RDAQ/TSvD9khqE1zYGv72iO36ZeDxKT0bNJyhS94pyIo/mc9gv8LGh9VZ5E5finrAqRJZprEzb6FxYQUTuEvk/mxuaeWyaW/2z+66zhC1YiD4N4GXSOGkpke2/ezy2NahiZPgN/w1f0BJb+U9s96ZBvhE4XXfdurK6xXOZCvfOAWymL3rb/PdTOarq17qhDjGVSFOUD4zaBc7YD0F0fs/74l5QQljFOFCnrcGfIYe4gVfC6Jwrpubw3Qla0kvD0HrVB9HxIL7+3/fcvBChlkFhoTjhbCoy6f38N68KLdTP
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR11MB3556.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(376002)(136003)(346002)(366004)(39860400002)(396003)(451199024)(1800799009)(186009)(6486002)(6506007)(9686003)(6666004)(6512007)(478600001)(83380400001)(26005)(2906002)(316002)(44832011)(66476007)(33716001)(66556008)(66946007)(41300700001)(5660300002)(8936002)(4326008)(8676002)(38100700002)(107886003)(86362001)(82960400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YTRjMUt4K1hDR3ZDbTQxZ3VHNUw3N090NG1mdURSQjI4UWZKL0RkN2k4NmRB?=
 =?utf-8?B?dW94SGN3WFpXMWZZdWVJRjJ1cTRCbEFqZFZFbjZreFAwdSsvcWdnOEp1dEVV?=
 =?utf-8?B?eVkrcjRsNlA3TGVvUTZ4a0RQc3RvK1dqbER3b2p3SnBxTXpxZHE0RkdkWlJr?=
 =?utf-8?B?dzlpTjRkTzNJNk9HUCsyZllidTB1SzBuMXZOdUhpTXU2TDJHZERWUlJlRDFs?=
 =?utf-8?B?OU01b3I3UHdZYm1CakY4U01weWNxOUEzaUpHTHdaekQ5ZTB2VDNNY3hQeTRz?=
 =?utf-8?B?NDlDSkhVb0JqRWxvVDdIR09tVGNLWTdjUm5BZEsxaWppYXgyNkYxYUdXWDVL?=
 =?utf-8?B?Q0Uzc3JEaFNEZE5tcDZjK2lmaHplSk05YWpkTFZkL3ZXOWhnWkRpL2l1Q0JD?=
 =?utf-8?B?alhGcE9XM3k2OHU2QXp5NmhqcVI1aU16c2VidGE3VDdtallTVXhoOE1jYXdv?=
 =?utf-8?B?V2xLN2NlSktadXhaRytlek5BbDNUVlhZU2NuTlNNc3d6djJGdDQ0UUw1OEJw?=
 =?utf-8?B?d2tRQk8wTWdrY1VBWS9yaG4rdEZhNDVpYmQ4cEtkcFowWHo0d1FKTDdZMm11?=
 =?utf-8?B?SmtkTCsxR2Q5YlRNNDY1bU90VUdqUlFRelJSMktybU1ZcXBkbkg4VzRPdEVE?=
 =?utf-8?B?Tk96SU5yM0tQSFdNVVBOb003cUZDU2I2R0pDWDBJczF5aUF6TTlQa0l6VTBN?=
 =?utf-8?B?RmY3MHA1bU1NQVVqM3FYVFZSRFJwczVtSG12V1A2RUJ3MnBwMW5Ib3JaWHRN?=
 =?utf-8?B?SHVhbU5qTjFVeGJseWx2L1pQakVXN1RTMGM1R2lIR0lRcE5ocHMrRDNveUEx?=
 =?utf-8?B?SVNqT3YwWFk4TzVaeWREV2prSFBvdU5YTjIyTFRDeXplenVBb1dRRzNnNitI?=
 =?utf-8?B?RnRhazZTbHZzZWoxNXhzZHpsclJ5T3A3aGF1YTZmbzRucUNNdUM4UFU0Z0RS?=
 =?utf-8?B?TnNCN2N1ZjVOMXFJcXJIQUNCS3BHR254WXYwblh6eTZzU2VjMFlsVXhUU1BG?=
 =?utf-8?B?dk5QcnI2ZFRsekppYkhVVUdYUVdjOXE0MEZxaHVCTjJ3bzV5c3lHT0Z0Qk56?=
 =?utf-8?B?cXhJZXdKUzhpdzA3TGNVTmozbVdINmxVNStJYVkzS3JsWVhvY1duOURncStm?=
 =?utf-8?B?Z0FRZUdtQXJqbisxZlZjSjN1aXhCSUNjRkZGYy9uWEFSZGhxeHlpMXJjb1c5?=
 =?utf-8?B?blM0U25KeUhHM1RPY0RqeUt0V014dWV1VU9yK0xleTAwdytWV2lva3ZLMWhz?=
 =?utf-8?B?dUpJWGJwQ0QvY2Jmd2FOdzl4NndHQ0poVzV3SzN3alkyS21VMmxmdFRyWkIr?=
 =?utf-8?B?S3FTWXRvQjZFVG42UzlMbEtvekQrQVZPazBYdStCYzdIV1hJSFRTT3dhY0Yw?=
 =?utf-8?B?RE5LWGxnaWFtU2tnb1R4V0pYQ1JRaFRyRkdEWkR3aDBJRmhDMFIyRWQ0SHRT?=
 =?utf-8?B?OWdicnN2WXFzMElQWUNTYytnYXBtZ0MwM0Y5M2JwUlpyVzRQZ1JxWEdXU0JL?=
 =?utf-8?B?ZXFBYmQzQmJ5RFpYSG4rbFAzdG45T1VrVHRDM1NKd2lacFFDVXJJT1FwM25y?=
 =?utf-8?B?SzEwTWtGVnY3MXpaOXcyWTNDNkNuR1ljSEQxVkp2WGpvRGxVZ1BZL215SjAw?=
 =?utf-8?B?NWVSU3FmcXJmalEvc1dGZHE3aG45aGhLNURPZDhRUmtKREE4MktlaHNGYjBu?=
 =?utf-8?B?Znp5eXMxam5vZXVJbWRyMzdVczR1RTQyRi84OGMyYXcvTCt1bUJTRmh1Nmlu?=
 =?utf-8?B?L1grZVNJb3ppK3orZzhwcVhaTFFQUG9KellkRUdVRTgxQkVCZDFMUjEvY3ox?=
 =?utf-8?B?UCs1dllqd0tRYnUwd091eGp5Yko1UkduQ0lQS29EZ01VL1BuNXdQV1kySmVm?=
 =?utf-8?B?TFY1R3ZqWEdHOVJZb0t6SVJPUzNTZmt0L01RdXhqd2w3NkVjQ1hCT0VTNkpK?=
 =?utf-8?B?QU1OaGVHOUNuK0xQbDZTbkJocEVrd0hFOGt5WENCYmUvcGt0NUg0U3pBbFVT?=
 =?utf-8?B?ajg0Kzd6d3FLT1RqZ21yY3RPcHBXL3dPTnZjNUlMQ0pqcnB0c3lvT255OUlV?=
 =?utf-8?B?ckk4MnV0SE5sQzdDNjdheGhFUXVpY05oZWxvL1RDbEs3Tm5XN1ZRVE5NUUZZ?=
 =?utf-8?B?WHNDOGV5cFQ0eUJnTUdRNWRoc0NtYkhmRVc2OGl6RHVFM0JKdHEwNGMxV1VF?=
 =?utf-8?B?SWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a4c6aea5-b4b4-4c05-f4a5-08dbaf13d145
X-MS-Exchange-CrossTenant-AuthSource: BN8PR11MB3556.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2023 19:59:45.6977 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8yA0F3ZTFdKdo0l82F0RxAx2YGyfc5zHf0qunRhnDIR4D6wj5CCRw9feQbO4FpFBUL3xeP5X2XC51MMQA/oOMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8137
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe/pat: Use 0 instead of space on error
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Quoting Lucas De Marchi (2023-09-06 16:30:09-03:00)
>Use 0 in format string instead of space so it shows as
>
>        [drm] *ERROR* Missing PAT table for platform with graphics version=
 20.04!
>
>instead of
>
>        [drm] *ERROR* Missing PAT table for platform with graphics version=
 20. 4!
>
>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>---
> drivers/gpu/drm/xe/xe_pat.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
>index b56a65779d26..71e0e047fff3 100644
>--- a/drivers/gpu/drm/xe/xe_pat.c
>+++ b/drivers/gpu/drm/xe/xe_pat.c
>@@ -107,7 +107,7 @@ void xe_pat_init(struct xe_gt *gt)
>                  * raise an error rather than trying to silently inherit =
the
>                  * most recent platform's behavior.
>                  */
>-                drm_err(&xe->drm, "Missing PAT table for platform with gr=
aphics version %d.%2d!\n",
>+                drm_err(&xe->drm, "Missing PAT table for platform with gr=
aphics version %d.%02d!\n",
>                         GRAPHICS_VER(xe), GRAPHICS_VERx100(xe) % 100);

Maybe we should have a standard way of putting versions in formatted string=
s?

Thinking about something like:

    drm_err(&xe->drm, "Missing PAT table for platform with graphics version=
 " XE_IP_VER_FMT "!\n",
            XE_IP_VER_FMT_ARGS(GRAPHICS_VERx100(xe)));

The macro names are kinda long though...

Anyways,

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>

>         }
> }
>--=20
>2.40.1
>
