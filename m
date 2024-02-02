Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A159FC48291
	for <intel-xe@archiver.kernel.org>; Fri,  2 Feb 2024 16:48:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61E3410EE86;
	Fri,  2 Feb 2024 16:48:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eXMWUV95";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AC8310EE86
 for <Intel-Xe@lists.freedesktop.org>; Fri,  2 Feb 2024 16:48:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706892505; x=1738428505;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=kTk3/nszUnb1YFAICPIAgiVOdmxlEeJeD1ZLPpHqGqA=;
 b=eXMWUV9560cR/EdNgKdvvwXh6F9xD7Y3EXZlht0uImm1GKIOOrBHnctp
 j4N1mObvFioXYfqAQoPxmIokiM5sBobZY1v5Ld1CSTm7TNzmR9RAGPzkm
 YcMGUvIr41pFkeeweePiPsYZNzmi4EeUwbtyGMiFvGavwo5My2yVbknfv
 u8NtloU2cnu/MNG+SUPLwylAVrMamENSu4ur23Rkjmxbiwe4ktD3cGA49
 ZgqxfgBbFJfJaIWIEStnuRNfpHopthBJnEnTAjOmCcdx4bFNHMSKbzPs5
 0OmztcxwAlomtfJ1n1R9NgCKNgA3tDB6GPFAzxUS5M2qtNaOJ8wUY6Wp9 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="22676411"
X-IronPort-AV: E=Sophos;i="6.05,238,1701158400"; d="scan'208";a="22676411"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2024 08:48:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,238,1701158400"; 
   d="scan'208";a="438718"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Feb 2024 08:48:25 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 2 Feb 2024 08:48:24 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 2 Feb 2024 08:48:24 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.100)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 2 Feb 2024 08:48:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Lng2CGUE35/CNEAmj86b3JB2LkkC48fzENtz2Aw93XilXZ4gKq0G3QkPJ9y58t8LrfECk7Qqw6hz+TDS1f4Vw3naWD1H4XxC0IZqG55QapqNI+lcdsY/+8A61nlp0+EVqwFudYQKBVaeWOnU+LEKvy1h+WWOXRVB7wHcWdKbJu1Ie0g2d8jgypiGxJd72ywY1SDbV8pqccaMI3mVcCRVh1EzC9c1lz2+X1dadKl5sq/M97YVAYtmdITIO9EYG6BiDFiXHDrU5Nx0ckwQeA4My95XXuzew95k2wtvGNlCinSksOMyU4QxuTnDH41qEPfA/ZjasnYJSDg2Vr50G7h6gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kTk3/nszUnb1YFAICPIAgiVOdmxlEeJeD1ZLPpHqGqA=;
 b=lpuZcap4YF0bQV2F4krynvFztlUJMNcYYQ+Q9TcxZJDUlcQjYUaVSazhq0By8QqklPvSdcj9iZAE1m9OTCJnMs2jPnA3/a4dKBWamRfC2jOqIUAL1eldvtvL8YS4PEyzfsp6WkQYLM+tr28bUFQjsw1Lzg18xAoNaJ241jHvCwGQf5PLigjfHO4U3MgIHK/NrHXLF6OIOe8SauhrKM/mvLPVv6Y60drJy4GyJ+ezFJsgV6garRXQpFxTXXcSH04MR5eZQ+oJtQ8zVpfIgoP/oVsKG8MytvHekqPFNywm46eK7Mq9HVFYzm05+klI4Ba//JSkXiz8ckgYffL6939mkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DM4PR11MB5263.namprd11.prod.outlook.com (2603:10b6:5:38a::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.31; Fri, 2 Feb
 2024 16:48:22 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954%7]) with mapi id 15.20.7249.025; Fri, 2 Feb 2024
 16:48:22 +0000
Date: Fri, 2 Feb 2024 10:48:20 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <John.C.Harrison@intel.com>
CC: <Intel-Xe@lists.freedesktop.org>
Subject: Re: [PATCH 1/3] drm/xe/uc: Include patch version in expectations
Message-ID: <h2jjfnuz35zosmwxtbrexsnjkdffnwmwvlzn5il524bxbc3nxa@y2ppj6qaw3sy>
References: <20240202073050.1986142-1-John.C.Harrison@Intel.com>
 <20240202073050.1986142-2-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240202073050.1986142-2-John.C.Harrison@Intel.com>
X-ClientProxiedBy: BY5PR04CA0019.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::29) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DM4PR11MB5263:EE_
X-MS-Office365-Filtering-Correlation-Id: 462f2ff7-99a2-4ae1-8e34-08dc240ec44c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nUQ5kKFPbKAgxO69bkqckPj+pOny1CbyTM1VA9V5jPJYCLdsrjpUgkcRt76Ct105fazdJJazXB7rVVbK2QIERKL8Yx2ONSZPaAiQL6bw2tW/JHZaZNigzvCZgW7Bc/jos/qiA4rWnBUqMJGBPOAbMsXRI+jFr7T16anBBGBOaqj8Wa71wJ8Qw+Y0H2RomBmwrxCMNmy1wsUdrBZtjMtndwdcLjc+Xfou4HXyhOOEk07QmvNbtdI1+FKKsKUmbTSWtWn0wJotsqmdUD8F5U5qEaIA00HD3Sj6zYAOsP5EIDsYUTQsVj8oe9YPeVmGHNiwA+k1+kLHE8vVlYzA3+xL2EEr4t3ZaYSDS+n6Jf2hCxIaL7Q2d7nz+MMp4U/sQFJ0NkaXHL+PWLnIIZtGKOJGC289GyHnSgErCm+c12ob3z2Wx1kMd5QQj+nCrHfalKZm8zhEE0WQjzV98dNTZIPIbAnJ93rahC+q6ytPaexfvfUXHs9iWyvParOzx28hIfNAo5gs4+E9fxtAfLDN0y9a9mIZn4qLPyw2LfhC88bMSZL4pNLZeJMryTPDQw57RmNT
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(136003)(346002)(366004)(39860400002)(376002)(396003)(230922051799003)(451199024)(64100799003)(186009)(1800799012)(5660300002)(478600001)(6512007)(33716001)(6486002)(9686003)(4326008)(6506007)(86362001)(8676002)(34206002)(6636002)(8936002)(66556008)(66946007)(316002)(38100700002)(26005)(41300700001)(66476007)(82960400001)(83380400001)(2906002)(4744005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YLvG+B5qEIOpyr0PADsQD8kRIWtYWFjnYWZcRTVhS6VxqcAYAYT3YOnV9iOv?=
 =?us-ascii?Q?rbvnXTWvbzq7t/Befn0azy+d0E6ifW+31eTdMIAjRu8wdvJ5ik407wK9sHLc?=
 =?us-ascii?Q?jRtk8aq9cCTNxx/T/O3gZU0Th19W3gBIjBs4GX7x4f7bFrME17zxiUOb4Zn/?=
 =?us-ascii?Q?JJrEj1Py7IBG9prj52r4RVUZi4oyVnoVsuL+0xGAe4zaO7YTooSrUbYd47yW?=
 =?us-ascii?Q?0CmXWBlwN01DzhrEfk4fvzzb8w/cXQuws7X2mmolJPbCamrIZLXObZySGYj/?=
 =?us-ascii?Q?E4g5dXncmRy8GCgq7h9v+pdHr9MD95reEMsfSKIIbkI59YljgZ9bQAN8CigQ?=
 =?us-ascii?Q?S6vwE9BrMAtRQ7u8lmMCF+aFZ7rN9iqkrB8N2/7INmvQt7jxU814omJTcElh?=
 =?us-ascii?Q?/mRDClSDlScjs76NlnenpewmW9EcJa3wZs9VaDoeUKMvTvA5/jZBBqRnpUqF?=
 =?us-ascii?Q?YI5upPKPY5zCRgkpTwEZOYGtwHVaevLTAgn8Ivs3UOKooo4BlMXwqqvmJEFw?=
 =?us-ascii?Q?HhdPW0wIPKTmWsCSd93uqn7IPX1JlnBSehZ2f2bbw5C4psklGnUQEUoKGzNQ?=
 =?us-ascii?Q?QDHZcYfIoBBAHe8tbo2D16I8cNqTJ8iq6OI/4ALQDugphqGUoxrRXyU3WDQp?=
 =?us-ascii?Q?MZWWFUh7EKa+iE88CVIErGb3FVdL/KyAIdre4Sv1NwD4FCdYoluJfeAXOfBp?=
 =?us-ascii?Q?kESOMuWPQfeXHMBhi9zqKz4pe91d0c72f4GCaXW0GZBf9vWFIsEiANzpJILr?=
 =?us-ascii?Q?iZ+QyBaAwuNxBD6m98IBG0jiAaBOrCx96aeDlyL6PDH/XqfzFJmRpHydZ4xV?=
 =?us-ascii?Q?Zlc3y6HodVSHW3P9p9ghI8d9/Ab8pfVueuh6Lq+cBZOuuB6qole+gvS5dCYQ?=
 =?us-ascii?Q?8WFpW8gb6YYgSIE0ZsOgdtiGJkxXn+2ANqwMQg4f0EgCF59qw1+c/iGMlozp?=
 =?us-ascii?Q?k024btit2xs3Dmofc1DDVk6egrBfsi8xIBZkeBRmNMVUYzPtgXc0jVmPGfUo?=
 =?us-ascii?Q?0XCup/Z5F4UYhTaYUodPTBebkLQv409fYORfBpXixSc/ls5wAHC/ABExdYhW?=
 =?us-ascii?Q?JczCtyN4pdjShW1KEAiNxMOQ82bA9jOM6bXRKRIsBog7NYnKwGXwl13UbgWB?=
 =?us-ascii?Q?ItXbRS1L8pujSslXl97dW5prpDDIRUJN8xh4PPy3QU2tUMkGP9mDO/p5HUls?=
 =?us-ascii?Q?+RUi3jc7J++P3zicrN/FG9990yxh34DicIUHaGRpCykdvOoodVmqpIF6quGO?=
 =?us-ascii?Q?xhrd6QaFr2IJA0wwhMzChfDmhQ8oAXnG0NpTVwpcerkM12pB++1rTPF9U/55?=
 =?us-ascii?Q?UkALNzzMMyx7Bon575kjK0Asp/DIzxkQAK7DjwybalQmpzsGKXUrjJ11fngH?=
 =?us-ascii?Q?8Qbo2pDA4D70UeLG4PNy1lrHItdW8QqsnSsZoQTucDhA5Sg6CvAqy3liGHEP?=
 =?us-ascii?Q?w63dMutemGZZ9778zcJHwHKVkVlJBMnhDhCLl3WOCbn8sckusZW6OirCDZSy?=
 =?us-ascii?Q?iFyM1nWFr+V7uPpwiGs7WwFyqBtiomkBThCdNb4GL8ZuG4y7IUl08b3v8yuQ?=
 =?us-ascii?Q?fOn6vr/oz6ddfs70zcSakGfr/QtEX+1NakgHSy6GIKgQtC2gQbiRcXIBkOmh?=
 =?us-ascii?Q?Zw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 462f2ff7-99a2-4ae1-8e34-08dc240ec44c
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2024 16:48:22.2467 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CVVkzLx2qL7TcDlBBIzAFvBVgwAld3acpD/GyC0uvdt2KW4nFF8HVacujuPQkXQDIjvlx0T0QFnV5alHvsX2uMxt/pPPyIepZIaIuaMqL0Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5263
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Feb 01, 2024 at 11:30:48PM -0800, John.C.Harrison@Intel.com wrote:
>From: John Harrison <John.C.Harrison@Intel.com>
>
>Patch level releases can be just as important as major level releases
>if they fix a critical bug. So include the patch version in the
>expectation check so the user is properly informed if they need to
>update.
>
>Signed-off-by: John Harrison <John.C.Harrison@Intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

thanks
Lucas De Marchi
