Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A362C6FA8E
	for <intel-xe@archiver.kernel.org>; Thu,  2 Mar 2023 18:00:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 118FE10E18C;
	Thu,  2 Mar 2023 18:00:34 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF3F310E18C
 for <intel-xe@lists.freedesktop.org>; Thu,  2 Mar 2023 18:00:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677780032; x=1709316032;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=fIUSOXIg2k9fzluGWBnoTFpUY9PKZqb5uU/b9aXvt6g=;
 b=GxFQH+zP1Jmyyh02bmBbmmb0vtvPj+w6CkL+x79f8XKbSjfpmEuHeS0p
 GpaQuJvDJV+4kLKlr7V2reCxchp7QGq4sUNHQqE5CTj6gj1oGk89j41dy
 Z+fJ/6DqH5jDYFFAFYYCpyuv0H+qY+7rzqPbHiCSj+SQF8o9ECKZ1LXH1
 GP/30s9Mt5YEI4PQMHLOLX7gIIvvL7Y5wU5P7vIuJbmSmCAaqHmmQO7bA
 94xzOvhy3g1Q7Yt9m+eBe4KxGPtRLl+TLzWFNe90tbbbZKgBTDC0KFwDt
 Lz4lz84TZ/RSqZ2E7czZv67OSxw8BhJT+9ThGQRAoZ7DNyq2xfEYZGWo0 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="397392040"
X-IronPort-AV: E=Sophos;i="5.98,228,1673942400"; d="scan'208";a="397392040"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2023 10:00:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="668341705"
X-IronPort-AV: E=Sophos;i="5.98,228,1673942400"; d="scan'208";a="668341705"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga007.jf.intel.com with ESMTP; 02 Mar 2023 10:00:28 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 2 Mar 2023 10:00:23 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 2 Mar 2023 10:00:17 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Thu, 2 Mar 2023 10:00:17 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.176)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Thu, 2 Mar 2023 10:00:15 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=So6TAZix2kWxEteZc65JYTuRZy64Wy05I3J+GiaowowpYwaF1xUebN15AEADWXH2x2/XH4G0r8fneUT2DXWx//dLvOm2TlzOjaDUUNmtfiQwPO2t82be4p//JFTBBKXTxUycaXV2FCzVGu+Nlg1t40LPCXof5G7ggDdqRgm7sKIpLcRTzArOG7f8AmkhP4EsM/a8nTQRUByTrn/w/V4A/wSoHygZOTtLi8hjJsaBNsoCiHvb3ElK8jzNf0ZMi2Q9LnSyzHzDotF3jcsQbZc5sQghJ1O7/MATgpYImeiO741rDvVQTlyiMciAP5+jYbcUs5obQmw+e+JDXgl9wslgsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sdKyU5yfUVwJOZnPKYnztt340+OJ18ZGv3tq1oDYGR0=;
 b=nCQCaxxG6BoveTb/ATqpdZ3Jb4bXBEPdRsb7eI5KiGY+U15R0qVt5uptVBMkUcOjvMbhKdI40lDrYScupsRvWKqrSPahv/xQA4Xvg1XZDv0e2xL2IYazSVDbufQS/zEb0gEPR1cnvG/eBTpn4H/jwJX/2Qi7mOhh5QUhSecpwujnVva3bRd7grzQN9qXBqdaWwYnA+fW4zu0qUzK5e9bk1AzaoZBwUJQxmlOU02OsotkOw8XFqPVPGZtYj2GeOgphJcyaJohFnQZKgbubuGaGhSO7P5dwjHvSFO/WlJ7bH2yK+jdpV6+ylcIqXk3gm1IAXqxXRycJFEYxOPW+hLhcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ2PR11MB7454.namprd11.prod.outlook.com (2603:10b6:a03:4cc::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.19; Thu, 2 Mar
 2023 18:00:14 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7bcc:b9b8:78df:1bd8]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7bcc:b9b8:78df:1bd8%7]) with mapi id 15.20.6156.018; Thu, 2 Mar 2023
 18:00:14 +0000
Date: Thu, 2 Mar 2023 10:00:10 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Message-ID: <20230302180010.64nh3lt2pkhdc67f@ldmartin-desk2.lan>
References: <20230302141230.2804699-1-jani.nikula@intel.com>
 <20230302141230.2804699-2-jani.nikula@intel.com>
 <20230302152837.5lpnbzwciupdbkoa@ldmartin-desk2.lan>
 <87ilfjupfu.fsf@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <87ilfjupfu.fsf@intel.com>
X-ClientProxiedBy: SJ0PR05CA0185.namprd05.prod.outlook.com
 (2603:10b6:a03:330::10) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ2PR11MB7454:EE_
X-MS-Office365-Filtering-Correlation-Id: dd9b932e-58b8-497e-eeef-08db1b47f901
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DGz6N2usFj+BWt9ui+2KF3dbTFldXPujVvKva0F80VWda0BPKAeT1qmb17kU1IEtq3KbyHlOirxz4YdfOl456myn1QWdGY3sdteh0cSqojvw98fInkQfFuD9uvPJPTHCOaM8fg29iFVCD/ja0d5Rfzj06egn7Ob+1DhjPNCdtOV/OkEC9c/nDrue2uSKa71DA9ITHVa416pW/MaFZLssYwZ3vm3vc5mdw0X6QH5t0u9WFbzoW9VTTBtfBDIMvjSnNCfFqNG88+3uv5a38OxNqMi1wRKFIUYsGSy+VQ9QfE5C//E9IFQENLtvH0gBM4t8apyBYuE9MJZbrrDkYzcbaJBm873D+EGY+bUr7jE59Z47YwPHel1RySAF1VxvufNzWrlBd+o9W68KUtUPGKizPGQyZSyifXHmjPiojg4g1WJm92q6bDg/mJXkQUPV68gSpjyBkd/2Tm+qgKgUyFscx4Cwi5aNfOq/3yKdTL+mSrJ25F3Wxdj0EO3ssTuiyYfUpmtuYPN8ikOjh77pg+FNwTyQuevWhcM+S/brnthnp2os2W0ylez3a0OQl9oSwPm5Eq/Sm04RmE0AcGIE6fC38wX4lZ1cwP6XJ9Mx5jMbMKPXa45VuQh4NUE9UfQMc/CpecdEy4wsjfu9pgaPGYBtzQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(136003)(396003)(346002)(376002)(366004)(39860400002)(451199018)(82960400001)(5660300002)(9686003)(2906002)(41300700001)(8936002)(26005)(6862004)(186003)(1076003)(4326008)(8676002)(6506007)(6512007)(66476007)(66556008)(66946007)(86362001)(316002)(6636002)(36756003)(478600001)(38100700002)(6486002)(6666004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yUv7mQvbhyx9iUO5GSdCVd286ys51JtLqF54csgKLY9AS1LrkUBiVkgF7MiU?=
 =?us-ascii?Q?i7lxJdGUy+P7kMdV6oTmI4+R/WTVAxNdRtu+sqwOpkjIp7sWu0y+UjUobB3L?=
 =?us-ascii?Q?iE0RmhyqOuUoscWej+WkHmJ3JAZDw2Ekh1cbIfsAMRfb78Qy57O6yNOBlOuc?=
 =?us-ascii?Q?JZvsgixeVJgHPRyDmUXmEYAJkbtdsG0npoSAMgPdS0tWhWxMXRDDrIplFojY?=
 =?us-ascii?Q?N/SqUD/xhpXPDwT1RjdqlcqgJB3cej+uW3qqVsOhly75mvO7IU/gHqI0sm1/?=
 =?us-ascii?Q?goZ8WQGr56e/SucPd2ot73aEfvyPSjP89JEZyw3r84+ro2x/1GvUONNPCTTk?=
 =?us-ascii?Q?oX7eJ9p579iiFSrEumHSPBdt/D3L+vKSDt+veru5mlnIBttXD562fjF+shTc?=
 =?us-ascii?Q?WK+IlnKEt0qHDqHYWPk3eyeAmqryl+kxEI+WGhD4Uysb+z036qawbzrg0hoz?=
 =?us-ascii?Q?skOUqgTBr0mdDrbK07vZRHYogHHTEj/W8PXwN0zYt1OjhIjqXxc7Tk0JLWlS?=
 =?us-ascii?Q?l9+2eYQxcb6s3dDHBLw9r023k602S5BvjEURDOfrypz/C/5bqinl+Icoq+D/?=
 =?us-ascii?Q?rqtvSmkzvOLTLtV1pNT1kJQSodr7Tvu1Gb5/Vk2MnVOnG26mqhkf+mKt5Hac?=
 =?us-ascii?Q?d/Db+qL3KmJebijklcknRU6TiztZPH2yohT44dvW8M/INL0E6U69m7PBpQrc?=
 =?us-ascii?Q?F9i2AASwa3MXdjgvyb1LE++dF/UiVnTjZjPPc3jF860OKYQpDAdd2SVrmv0K?=
 =?us-ascii?Q?joG+tUTFDU+/Gz1CQBdo7jjNYZ0MpzcvYdgl7V8lFUOf449Ij5BCBEJcGzc3?=
 =?us-ascii?Q?taqWl0PWDkxsDbrK371aHgbZqGEsxsv7kLiv0gN8l7b88urmTzsv3bNCKc9R?=
 =?us-ascii?Q?2sBb4V/TK8DYRE4eHOkmi5NVMbj6MhrVzWeZvrYAxn+17aJPFXfcTUc4JO24?=
 =?us-ascii?Q?rmXa2RaAx6QnfrolsS2Z7OeRy2Fsc4tBlJgsoZFe4BednH4ZScndEh+ZGOGe?=
 =?us-ascii?Q?2e68M3K9UHS/bBMVMbWN82l/SRm3ax1z/xVm61hBljbwnwhajOj7oK+9T+PA?=
 =?us-ascii?Q?APaggy95Bhs+qCRyuOJOCTMw45xUQ1jaaZ1eUBQLCnPjN/5kyDsXG9GN6u6Y?=
 =?us-ascii?Q?AGedEc4nB8fnLh99ZxV5bI4RsuSs3sSzZ5/Way4g3CAC/i4jdMEqhM0VNri7?=
 =?us-ascii?Q?zg4vTmmKTKSVJTwRHy1dtKxeLg+2ufrhe3bKqbHkSwqOd7kBmC/JVrpLaA7b?=
 =?us-ascii?Q?dvWvzY7t35ger30jcgYgKulbxA5aMXqajls179ALRCX0RoUI1ZVSlPvB0ESk?=
 =?us-ascii?Q?L4nszcfe8LMTH3KIwDIDdp0r9F3Jc5mCIbxmU+gFG9vcQiyIKj0qLqpzBUbM?=
 =?us-ascii?Q?XscAsaxWRvxJG3rKJFFqFR1LPqYIt/Ym9Syu6Q5llO5HE7M8aYgfdbmLcuHD?=
 =?us-ascii?Q?rbYsQj+aM4S9zzXJRJOHhIZV1NRo77eWpMuRBUM3mgBIaYJ+imLeToY0sWOL?=
 =?us-ascii?Q?WU+X/4eCl8MeB4xQ1yeYkrHMEnlUxWPDwdmEqLtzLKIRRT30fHsjAQKveJpg?=
 =?us-ascii?Q?oIxK0MewjfI5RsoqAuNV9EwPD3v4xZ4zrw78vAVU9AnM1s5vSEZ1mQLt6Kvj?=
 =?us-ascii?Q?ow=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dd9b932e-58b8-497e-eeef-08db1b47f901
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2023 18:00:13.9681 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DhnQ/tCo2vVwyWVTmZICWxLTS47pxPzGNDy0eHJFsDD0ldEP4yKAgVIk5aakRkVO5t1y1ctvKErTTUsFtGvB7ITfLtoOih1f+wrh7oAztCM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7454
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/8] drm/i915/display: don't use relative
 ../i915 includes
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

On Thu, Mar 02, 2023 at 05:45:57PM +0200, Jani Nikula wrote:
>On Thu, 02 Mar 2023, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
>> On Thu, Mar 02, 2023 at 04:12:23PM +0200, Jani Nikula wrote:
>>>We can't have this in upstream i915, so don't try that here either.
>>>
>>>Note: This should be squashed to the commit adding the relative
>>>includes.
>>
>> is this a requirement?  I think squashing this is not very problematic,
>> but it may not work as the build infra with the different -I also
>> changes in the tree.
>>
>> I'm also wondering why we have these changes at all in the xe side. Was
>> it maybe a temporary solution not needed anymore due to the -I added to
>> the build system?
>>
>> Another idea would be not to squash it now, but only at the end
>> with all the i915 changes together.
>
>Basically we don't want to have the back and forth when submitting xe.

ok. It sounds like we may want to squash/re-split it later when it's
time to get merged.

For my own patches required in i915 I'm trying to merge those in
drm-intel-next and then I cherry-pick them to the xe branch.  So when we
rebase they are just dropped.  If it's something undoing a change that
we have a better alternative for now, then yeah probably good to have
separate commits that can be squashed.

 From a quick look it seems this would be
a09f88e470b6 ("drm/i915/display: Remaining changes to make xe compile")

thanks
Lucas De Marchi
