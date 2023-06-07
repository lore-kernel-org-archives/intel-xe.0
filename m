Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 602D8C7EE25
	for <intel-xe@archiver.kernel.org>; Wed,  7 Jun 2023 04:42:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0680010E421;
	Wed,  7 Jun 2023 04:42:34 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99AA710E421
 for <intel-xe@lists.freedesktop.org>; Wed,  7 Jun 2023 04:42:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686112952; x=1717648952;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=+xHAJgh30dbJjoZsWfv4TTZ5p4gY5n/S7wSZ9QlHvfg=;
 b=drWfSYy061pFr8W2J9jSGG5G0IjOt7U6m+zgDp8uzESEySQJbDGtvHEH
 pKoKGSZgipWCVwDWrI4UjTnDY1aQajB8zTFWoH1d/hmITWb72OaejLnGa
 IRiOsRRLCWjcIKQJL+vUlSDZ+o/cu2XcCEeVJFB8b4M0u2ChpmBRaXj+P
 O+jlL/cDlZHU3pfFdX77d4lmhy6Z/QmwZ1HXXWaGT9Aw8pXKRA8yOjHdK
 xVxSrWfzGGslUJ0i6/3A7ork2r+SUm6bbEkQw7IA7ibn4879Kb/pRIoX7
 i2Pq2vBoRwZoh+NfJ1YDhUQ9fWa0lE+O8xsUZxrBrbdre2+A7NVpOeRE8 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="337239566"
X-IronPort-AV: E=Sophos;i="6.00,222,1681196400"; d="scan'208";a="337239566"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2023 21:42:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="883597956"
X-IronPort-AV: E=Sophos;i="6.00,222,1681196400"; d="scan'208";a="883597956"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga005.jf.intel.com with ESMTP; 06 Jun 2023 21:42:31 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 6 Jun 2023 21:42:31 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 6 Jun 2023 21:42:31 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.41) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 6 Jun 2023 21:42:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B9Goac/EYyvT1eVkxOCVIGQ6q/NQE4ocd4cD69r8z3ksSupMq9DKFYx3KQyH1dyic/hmx4c1noIvvwZko53ECofvqWmhbaic3uOsx6oMQkiEBDOMSZdesjmd9ON4kqqDATQCSW7xGXdeNDBbhDYgcheHBozV5tYSoBdee74Xb/mOAZxXs74xouPVmjhXflOuFia9t/+92MFh/g/QeNt3ITW0kVeFS3ak9MKCKinJ7O8vQUn7KBVU57PTWIm2Ovkez+L/9WtDyxQ8NjHFXbESRlOaOtnJLaNygPmDjKKOsAPKdrMP/3xWhWteoTzKlioy1p1yoNU2L6u2TBttFsVN+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YGH2vhXLjTxqwVIU/ggw/y7sYP2zORdpChLAEBnh9dc=;
 b=F5SQQiyH6ytMMUOI7nTXuQX6QWSvGaQPZKmd1tw0CPkypIxX+1+qp8rd2OTExXPR++cJCjOZGAKSgE+N8XiaZ2bLJQ2Op0XCiIUEtEoDD6asXm3RnQF3S/SZjuemBE8c+82PmOtb5thm5JOgKQwnpp0SIJrbXh/mBqN1u0IitSd5PQRJhnvhiRUTiWln22vHnNY5j7xzEhEwtU7Z4mbW83eTfBd2jutPWRdf0pee1H9N2QotEuUxKrdcTzXBNZyIzPiaawnWUn8A9fzHxB7LWmMUHgQ28/5lVXjFhB8V1EobhDmEVgqlZWiMny6AODr78MoTaULkAOyfzYFHOJBJvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH7PR11MB7987.namprd11.prod.outlook.com (2603:10b6:510:242::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28; Wed, 7 Jun
 2023 04:42:29 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4%5]) with mapi id 15.20.6455.030; Wed, 7 Jun 2023
 04:42:29 +0000
Date: Tue, 6 Jun 2023 21:42:25 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <hbi3qqlyma3ejmxy2frwxoy3pvy62fo4mv5elnefthjb2qfmxt@iyzenbh4ystw>
References: <20230606235242.1895643-1-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230606235242.1895643-1-matthew.d.roper@intel.com>
X-ClientProxiedBy: BY5PR20CA0002.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::15) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH7PR11MB7987:EE_
X-MS-Office365-Filtering-Correlation-Id: 920524aa-b7b8-46f9-b0ad-08db6711995b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GdgzTKMcPYTl3gXJ7KZC8J9ghD46Yb4+hlbVDaCO8ByuPrtRft27bxeJqtGi1b/JaPtw49y9syDOKQhKlhH9zjjh52ejVCBj1R44f4IJA5X/gMxTOCHetCIF4jzy8dz+7Z4cR4D8ZuSn1pX5EpKnYrbEsCGJvuFY82l77vw1Nv0aznyZNr9Mw8/noxSJMEe7t1MP4jSn/+9kCJdHtl6Ux6Wf67aK51CS1Bv6JvoqALI5aI0QCp+1RfsaKckrUZsiOkdHw8iZp1GI6wSPdD9RXzaxJohSc2s5Y5tiqI8X+MAmNS8X8NDDLybe3ayABYWr878yOfSYFqoyJ8U1DUeu1KWKzXG1cMB847c0ZL8VfkHZ6+44xx6jtbRfdqIKf0vFMshZwGClVC24uycJD49V/IWYJyENZ14L/PZPh5+FIWEUUff6PDOUweG7kWzo9E88hSCDFwnAD9YmldzCWf0VmNSxxdzhchbTazscxKXa2jeVRJcvmzoEf8QvJg6T4j9W1w7qqhfHtmUtlHzwyYs7qLIu5wsDb5XF2Z+c+M8lUMQpDyLWLklTcH1mwgks1HVA
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(366004)(346002)(376002)(136003)(396003)(39860400002)(451199021)(66946007)(478600001)(316002)(66556008)(4326008)(6636002)(66476007)(6512007)(6506007)(26005)(9686003)(186003)(2906002)(33716001)(6862004)(8676002)(83380400001)(6486002)(6666004)(8936002)(5660300002)(38100700002)(41300700001)(82960400001)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jtItGEcvBPlJRl3f6OXP8nS3VS+qKHLOP1wIWqTzjqE6I47KCyQnAxafSFU2?=
 =?us-ascii?Q?hIK1iO/ff+Yabry90xjnHSMjZaFT6KKh3GaHaDfMNukdSoBsO3LzZG4ztO4Q?=
 =?us-ascii?Q?6FgqFcU4wry/IBZnIlOm+O8FHNCpPZYA/UkT5qBNeeA/uWLmTAf2F/QfGlY2?=
 =?us-ascii?Q?RC9BgVL30kxIXGLcBdoi/1Gyb22Qv0/61Xgu6iRNHUzd7Vrkpd/DU4U2XSnW?=
 =?us-ascii?Q?Qq8riso2f56FZOKh2H8ElBuTJRKOZVT5Ue5jea1uwZtMVDD2Ka8uqMtz4prZ?=
 =?us-ascii?Q?EQSd0lJXmInEVb6hZVV0o46VyqcozE4JisaZxLIe5cLC9V8yNGFotv0BDB4l?=
 =?us-ascii?Q?8COyBz2YAF0HVn1hUiLyG0Li2W4MC3MN3sbMG7m59qZ1vKnNpH/tPxbGLIzJ?=
 =?us-ascii?Q?A0ZSdQ4CJ3bVDwjyNh6LDXLCmwTZ/VrbFe1+ZQH8rSy/eVVbmd+G8wULxp/k?=
 =?us-ascii?Q?w6oCUdjfItkHNSfMeWrIcgeywXsOZHkt91SlUWDA9e1F+Xs1JZwX2NynB4dR?=
 =?us-ascii?Q?VdTDwXsL3cDIHlP7fVzvrlGq76EQEY7UgFwmwJ2xIgPN9S/oJcQ1/ULA3mFR?=
 =?us-ascii?Q?m5OhIdTd8ikT8Q1VCIOHuaMcXku3ldMUZ9U796snHf7GFCXH36Bs22jAuXFH?=
 =?us-ascii?Q?teH+bxykYVoZFMHw/wBAafFYTCcTUzXJWHQRAagJ/wEI87A90dGFk+hERKZr?=
 =?us-ascii?Q?c1hxSN/Rjo65BKRPCekHiH2DrG04/sB90yHkrTRpVQ+VJo/KHZQSNoTEXRT1?=
 =?us-ascii?Q?1sduzrz1SugmtzDCP8guHJJ021vWf1X2hxASpKZ0t2LprQ+4XnzFgkrnb5GZ?=
 =?us-ascii?Q?RfOEsRDdkuklaR4K7Yha2Ge6g1NMOeYMqHndRRUQNsB7EDcFLC9pczMm3D02?=
 =?us-ascii?Q?1BNY/vLtR/ukHRIz6+OWBXi7aWqRmyJx/QIHImlsNLguCNlyN1U13x+4Eo2Z?=
 =?us-ascii?Q?yQvjuDWFuKQWpHxw6iUayQE0EwOda+AT+7HtX5k8EurxV1/gxlkA9oXuzOPB?=
 =?us-ascii?Q?oh878nWIrtJb0WObi+Hdxz8tXFxv72cUagmnwRBjb80DegcXPLBr6AtaApJx?=
 =?us-ascii?Q?jUAHNysbfdEbMNdeJYBGo6MJueAbfY59JiwOun121UFXzc/PgxTPnzxMvi6h?=
 =?us-ascii?Q?PohbMRBsJOqAkXGCPjhDGM0wNt0NfQZCX16ecY80YChwn07ASRvO1fPvMCiQ?=
 =?us-ascii?Q?uAIg1lPLOj86CwhQud0nj/G3VEFEQkPJHsVGmCViS5Kr9aMa/Oe+sUBomElP?=
 =?us-ascii?Q?A0IO+RE/YspyaBuDVU8HjHCmS5mFiG9Gis0C7A65HmSJrx5zQ+TbM/aD4xl+?=
 =?us-ascii?Q?hkUB56eBTJdLQYs9nEjRoA9V4RvMjzqFgkIEYgrrDfdy2pKEdOL8YWDHZoPA?=
 =?us-ascii?Q?avrTpigrKhU1rghnztEXt4EKQmteLZfIqajGf1d8Sk/qEH0EZfSw0G/JCntl?=
 =?us-ascii?Q?R1gUZTWEr6+o7tQARYUsrADS3V8z58DBjjAUsyWtP2w1OZ4uFI7enxdmq6GM?=
 =?us-ascii?Q?yz8NRNcE9+SJ5Krr5jJ9lTNjFtVZUClE0d61hB2zNqVGFjfeFbu7WYdXhYJ8?=
 =?us-ascii?Q?IXI2CVXDD5e96EfdTGYfPlB7SI6MW8qR/A8113adEwdQkxt0SGAWA8yJFBQ7?=
 =?us-ascii?Q?Qw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 920524aa-b7b8-46f9-b0ad-08db6711995b
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2023 04:42:28.9085 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gaDcaL7YImrB1vmGMmG93aonl+JXUpwMELm7J3F7hQe1Q68E/rESRR158/XtDkBC/G6ct2sotR0l+QZNnpaRKMuY73s02VrkJ+AcFzGXo1g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7987
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 00/10] Utilize i915 display probing
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

On Tue, Jun 06, 2023 at 04:52:32PM -0700, Matt Roper wrote:
>Now that i915 has moved display IP probing into the display/ directory,
>we can re-use that directly from Xe and eliminate a big chunk of Xe's
>display shim.
>
>This is mostly cherry-picks of the new i915 patches from drm-tip,
>followed by an update to the Xe-specific display layer to use the new
>interface.
>
>v2:
> - Rebase on latest drm-xe-next, which has now fixed the earlier
>   mis-squashing of display code.
> - Include additional cherry-pick of i915's display vs non-display
>   intel_device_info_runtime_init separation.
>
>A future step to further eliminate the display shim will be to split
>i915's display-specific handling out of intel_device_info_runtime_init()
>into a function under display/ that can be called directly by Xe.
>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Cc: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>

Aside from missing "cherry picked from" and comment on the last patch,
everything looks good to me.

thanks
Lucas De Marhci
