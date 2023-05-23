Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9228DC7EE26
	for <intel-xe@archiver.kernel.org>; Tue, 23 May 2023 12:24:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45D4210E42F;
	Tue, 23 May 2023 12:24:57 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC89910E42F
 for <intel-xe@lists.freedesktop.org>; Tue, 23 May 2023 12:24:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684844693; x=1716380693;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=IgVg2nM9BESTRjvDy28tlx7XtqoCkuedOmm1iw2DmK4=;
 b=WUtpvxo4iPcC/U0/9s5eF1B3bJQb+fTbO+ZIhhxWhil0FmyxrDG4gyWl
 hK9W5Gz5+P6GnTUUxHBMYswb4eehV6fXDt0jP8/JlVprYjgygREpWejpt
 0mNUu6MHCoQHQLlERT9w/lCM6sjvdt10L8VqGjI7tHg+UBwpOK/OGydtf
 /lr6+GnCI/pzBu1UWJDhbt1qRTDXIBz1psgcCcoNq4Br1dbcWoRLuUA7R
 bdA9wVzF8/Yv+QUNQBbPuOsMh1m3u9XEDlMkB+oNvvURy2AsZc3KCaRpi
 pCgdVkeLiDxC5+qphsT+WLBe8OmnMiUvC/0tka5BT0gMwkGrGRmS3vdRs g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10719"; a="356451120"
X-IronPort-AV: E=Sophos;i="6.00,186,1681196400"; d="scan'208";a="356451120"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2023 05:24:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10719"; a="736858059"
X-IronPort-AV: E=Sophos;i="6.00,186,1681196400"; d="scan'208";a="736858059"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga001.jf.intel.com with ESMTP; 23 May 2023 05:24:52 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 23 May 2023 05:24:52 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 23 May 2023 05:24:52 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.47) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 23 May 2023 05:24:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YcAVuWCBkbSl2BEMYlfL6aTxySii9dUsncObIr36zKqAAiUCskMZrE9PareoHWMkH8IvTet/tauRCcnUX3Ae6hUtBzAiq+p0PvPxqXTAZYJkzEZOY6gYjdDVPL4W4rkfSD0c6orXKDBN8pAIr0Rc3tGXyj0Iyh9bLXUFqG8wcqFRze8FBsG9Q11n/B8kDdfo7Xb+U8dcSXM/gyPUR1qwluR6zdCJAvp38UYSweRBq+uJiACWy0+FxspyWxyBmwnEVFl+QPSMjaMK2IGnEuqyxx/3W1dGabkI1nTyPgzcEB2O6ILxn5pDSepKLnvgmlJNQgq7cHqugYm/ioEVRQBGkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IgVg2nM9BESTRjvDy28tlx7XtqoCkuedOmm1iw2DmK4=;
 b=NMHA9Wh87LoVC3eosyrDZ+fHEu0q8p7qQjc4M13HKpi8cp7W64Hh+pV6OhtGJGu5CHqeXwpbjBORDve3ClzyfCkLWLydLpJ1mjtB+s1piIpbLa/jUxjDsB8ypO1i4xIzzH1cafzJuxd9448C5WxVm17JxGwdu1ZJ5GeWZtmjjB/FUhLZuoUezdf+mDGiBcUWnzQD8Bh9ouV69TBUc7yJKjMs61ujTd1cH6Tr0gUw4oVlVRgGwvnZVuSjYIuGc2osbEiDPRDYwR2XenD0amw9sdfCiBxsdFdlK2smhYerkBKcdWBP1Exu25Fm76LHFPu4CZmPgGrvYkQAxsNAjrl31A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN8PR11MB3556.namprd11.prod.outlook.com (2603:10b6:408:8d::31)
 by LV3PR11MB8604.namprd11.prod.outlook.com (2603:10b6:408:1ae::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28; Tue, 23 May
 2023 12:24:50 +0000
Received: from BN8PR11MB3556.namprd11.prod.outlook.com
 ([fe80::7c95:635b:8059:9e68]) by BN8PR11MB3556.namprd11.prod.outlook.com
 ([fe80::7c95:635b:8059:9e68%4]) with mapi id 15.20.6411.028; Tue, 23 May 2023
 12:24:50 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <kpjxmnghgy74jhjgmjyb7wlcaxwqy5scpqvtibjgw5mhfkmsi2@25qiavmpij37>
References: <20230522125529.52695-1-gustavo.sousa@intel.com>
 <kpjxmnghgy74jhjgmjyb7wlcaxwqy5scpqvtibjgw5mhfkmsi2@25qiavmpij37>
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Date: Tue, 23 May 2023 09:24:44 -0300
Message-ID: <168484468421.2065.14848526857778321767@gjsousa-mobl2>
User-Agent: alot/0.10
X-ClientProxiedBy: BYAPR02CA0009.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::22) To BN8PR11MB3556.namprd11.prod.outlook.com
 (2603:10b6:408:8d::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR11MB3556:EE_|LV3PR11MB8604:EE_
X-MS-Office365-Filtering-Correlation-Id: 0755a391-8149-45a7-2b5f-08db5b88b448
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3rQ9RHIVb+yH8VQmR0VfdxoYheUnP4YvHcUIanANwgk67d/VZsz9juKxtyLKKSPgOK8xJ0tXyys2ocpDokPjvcPRSdH/MedZj24idYZYex6537LlFBgn0mui7BmpZcyCCd+mkvP3VuyBoLhP43yPxnfiThIgLePYWs3fCU6wzAds0O8s4eB6ORekkJTYgHBCZakZ4UyFLikAigZ9Ug5NUMQolQlfv1jkhuxgTtU61gWUpMfIcgDmELs9S4piftFCNuR5v2ZXwdOayyUAVO54M79Qbvbfhxm+LhMFH4xo7CL4XZiQpZ3oUnEecQlCXkjYQFBktHxr8V2k3cWhl1WyyYJ97xuiiiulcn9r3mwPI3OcIH8H/9QtM/lagVbzkT+ANV+3AjYLacR3Rf/qZhMSVQsyZ7dQQ3SMuLnp8kaDWotktZL5CvSDcpB4DbxFqG355t18Bdno7xlo8opsid0mJDdPYeWDR1dFQ57MDIOa0rjH+rJYNG9QweKC7cHkTrD3qx/NERXshXXI+os+GWSGDgxXLUQfcVFZkgYMKvVmevgD4n5qmavkSWqC5HgI7/OI
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR11MB3556.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(366004)(39860400002)(136003)(396003)(376002)(346002)(451199021)(33716001)(66946007)(66556008)(66476007)(6636002)(478600001)(41300700001)(6486002)(6666004)(316002)(4326008)(86362001)(8936002)(8676002)(6862004)(5660300002)(38100700002)(44832011)(4744005)(82960400001)(26005)(6512007)(186003)(6506007)(9686003)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d3QyT0lYZEp3TWhSSW5wN1pUdWM2Y2NlaVpKRjdyZ1VsT3ZOb0tiUUxONWxr?=
 =?utf-8?B?YkVzM05uVzMwZm5Sd3haRE9KWUNUUjI2VUJUKzFzOUtHRS9sU3d6azhBZjZG?=
 =?utf-8?B?NzlpSXlGUEVVL045cXVwQVNCMktCa2hGeFNmQTVBRkkrRVc4U1lyNU9LWDRy?=
 =?utf-8?B?amVGSHFMYU1sTnRXSVhDNE15S29OSE92N2paKzA0bGZKZU1aeWlzTDN2YldH?=
 =?utf-8?B?Wjg4UmJJb05rdUlUTFcxM2NhK0JIYm1ZeEdUM1hUakFkY0piVEcwcEQyaENB?=
 =?utf-8?B?NUVqZDRCWDdVRzh1NkVPZEhva2VkYTJvSmN2bDcrSzcwOHJUeHNJOFpUd0c5?=
 =?utf-8?B?S3l4VHlzajVpODdSYk5XVG9PVmJodEx1Q1pyeFlObG5ob0JnSGl2bUtiR2Ra?=
 =?utf-8?B?cmVYRTg1MHdHaFZFaXg4dUErZE9NY05WZUpub2kxZVdGekMwWmFuSGhoTW5S?=
 =?utf-8?B?L1NPWW9lUlBGUk1JU3RkZUttSFlUZVVuNHVjOFZlMmtmeTVJenR5aGh0K2U4?=
 =?utf-8?B?eFRraFY3aHorb2ZUMm5wOGdIRzQ0T0ZyaSs4bC82VVNoUnVBM3lvNlUyTjE2?=
 =?utf-8?B?eC9lZmVJTVRadEt4SGxZYjRocVk5aGdiVkxhN2VSZ2lCOXhPNXhJd0p5eVIz?=
 =?utf-8?B?azUzZVZ3T0RMWFVPRkxSMTVRTkxSNHV4UC9OR21WZkVjcGRKSE4vSUozZ3h5?=
 =?utf-8?B?Rkh3N3JhT0RPSy80TkMzRldGWVFNZnFXTnUzR2RFK1QxMFd4N0J3cVhCbnhX?=
 =?utf-8?B?MEZSN0pHSURkeW1YOVlSSmF4bk11UThkWkxuVUJkTnVmU2xtUktpRGNrVHNE?=
 =?utf-8?B?aVBibHhOeXl5NG5jeVovcVdGbVAySUtldTNCa3FxbXBJdnFHNmV1b0QrQ2hU?=
 =?utf-8?B?OFdVY2RrSGFtNjJWVEVHeUFYS3c1Z3I2OFZyQVpqb3J4U21ZQ2hNaFNXcW5h?=
 =?utf-8?B?L1VPZ3ZZZCtSWVJsVDl0eTVMUTh4eCtlbXR2MFlkY2tuOE9NQ3RDQWhRVkI2?=
 =?utf-8?B?MXRXQWtPZmdteE5sT3FCZjlFdyt2aTlyMnA4UnNXYmtRM25DUnpFTU5LenJ3?=
 =?utf-8?B?VW1ZWmkyTVg3Nk5VY0xKTXpPWGpuazV2Vi9CRDIyTE9SQ21QOVFoRW02d2xS?=
 =?utf-8?B?NVVhSjZxekJtem9nbXVMNDVvbG40RzdUZzBtb3R5bGhFTUpUcTNzTXM1RUhK?=
 =?utf-8?B?VWVWbnM5U1VaZW9TcVBBcWZFVEYxU2J6ekt5eXFZam9DdjJEMHV6S0hJZWtS?=
 =?utf-8?B?aENJbS9KcS9vSTFCY05sdVhFN1FGMnp6ODJlVUdSS0l3bm82czRhMHp6a0Nj?=
 =?utf-8?B?Q1AvZytWd0VkeTFZNzFyTlhFM2dueVZCYTM2VHdaelRxUk9tZnpNVkJ6Q3FK?=
 =?utf-8?B?WlFFa09TN2ZGczFOc3RkM1FPd29sMHAybkR4WVRHdjMyY05mMi90cENPbjBj?=
 =?utf-8?B?NUI4UUJURUE5TnBBYlpPR3lXVFBseG9zUVlxdGVvNndGRGhlbEtrY3crVnFr?=
 =?utf-8?B?UEorM0lyM2RFbjcySVcxbGppOGF1bFRzeHNQVUpqY1BCaXZEd2JReWdReXMv?=
 =?utf-8?B?QUtIWVRSdTBYYUtPRGw0emoxd2FMRnErR080b3EwdE1UVUwrWTVrTEs3YUwy?=
 =?utf-8?B?NVhWR0RNNDZVQngvQWFybGRTT2Y4NkZGOGg3SlU5bVppMVB4MGVPa1pLK1lh?=
 =?utf-8?B?WjhXOXlGMWdSYnBzTTJ4Z3c1TFFtRmF6VFgvb3lSbGxXU0FyRnViZUFYRGF0?=
 =?utf-8?B?YkMzYitPL1JoVHFBQUxNcXRKbkUrWHJYOVVQYUZXZFFWWTFCQjJmd3ptbm9R?=
 =?utf-8?B?UitwZ2hxcVVVUklVT1N2TmpuNjB6U1NNR2Z1VVA2aGs2TGU3cXpGYnliK0oz?=
 =?utf-8?B?NFA2bXMweDU2WWFsMGtIMDR3MS9JTTJKYTU1WU1uMlNlNjlRVGhoa0ZWYXFl?=
 =?utf-8?B?UEVGUFBTWS9HczluUzBEMnJGZDhad2ZzTTJoMDRsTDZjTVI5VmJobnUxcHdi?=
 =?utf-8?B?MWZyMXYrUy9YcjFKRk05R1NVaE53ci83eXhYdC9VUVk2djB5b2Nwa290cHRy?=
 =?utf-8?B?Qnlpc2haRFNTckxPYlBTVWMvM1BjZXV4c21heXNJMHJmNnFPNWZIdE1FcWRr?=
 =?utf-8?B?YU1Pc1F6NmYzN2p5N2NHajZFOW1mdWpKVzZIMnlCOVUxTzJNYTlFa3hQTlR4?=
 =?utf-8?B?cGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0755a391-8149-45a7-2b5f-08db5b88b448
X-MS-Exchange-CrossTenant-AuthSource: BN8PR11MB3556.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2023 12:24:50.3343 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Pi4eIEoyJt5gNbOn3JWPj3WWmJDuThu2TPZnB8oB6x56FrkGagkYls1pvtsX5qGOEX3jWp5YdFE7hCYzAJ7TVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8604
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] fixup! drm/xe/display: Implement display
 support
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

Quoting Lucas De Marchi (2023-05-23 03:49:04-03:00)
>On Mon, May 22, 2023 at 09:55:29AM -0300, Gustavo Sousa wrote:
>>Remove the call to drm_aperture_remove_conflicting_pci_framebuffers(),
>>which is already being done by xe_device_create().
>>
>>Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
>
>
>Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Pushed. Thanks for the review!

--
Gustavo Sousa
