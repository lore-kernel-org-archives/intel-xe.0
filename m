Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7035CC0032E
	for <intel-xe@archiver.kernel.org>; Wed, 25 Oct 2023 21:45:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3406810E5EC;
	Wed, 25 Oct 2023 21:45:36 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD7B410E5EC
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Oct 2023 21:45:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698270333; x=1729806333;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=PzQbcYNjY3KMfV7eXsEPw6idh7H3EB8bclCGTG68Ja8=;
 b=mOOf2KEeEP0JJLmDqUc4JbFiU1ZS2CBUfq7g01sHpcwRP09EAFOROFeA
 tt70u/tKYCbc94bx4ZtQjYuWUBqv9EUnNTGE7fewtGa415HfigUjwh00l
 6nJsrx6O/tO9N2Z/HAKVourDATUb0zGC95eChjdRIsWXGPxAfevdyoimW
 uDAEb9MKwxrRxoOgn0ZfOD+tN0nAqwlasCUQ/APZhpMv3ltjSRxBVUFS2
 +PIDESqvSrbSWvm2DQY+TYXXCxzzKHmjK1eJWTUUi31WTp48JdwUdW/cY
 /Kj4aab4J2yz6Ui8y46dssi1xS0XU/H9yzcQpeImSlFi9HvURFE9pi9sD w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="453872463"
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; d="scan'208";a="453872463"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2023 14:45:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="752476672"
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; d="scan'208";a="752476672"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Oct 2023 14:45:33 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 25 Oct 2023 14:45:32 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 25 Oct 2023 14:45:32 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 25 Oct 2023 14:45:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NOnSjn5vkrXEvj8WHNRNQpCxzkSHTDG48HAu0RBNOSvtFEDwNR4xVvbxS9OJaPbZBQP+cZ/e8ptqoXF7LLzE10hxuKLbWYKudwD2e2+2V4zlfbzNVwuAq+IxqyNeKaUxkLJYsq6Kc7KMorh7MbkeECRcbUGr57Hq2PXkCCojNrF0ua/D9+fiZv6Sua0ffNlHzQeW60OMDjkThAAIGPVg1wP+SkZHNDLqbKX6dEX1DhpkKQ2OVkU+yLbl5RZnnQ9iI+urWa/+aOA5p/wNSlSH5l6/KEvhkCNuLeLMAst5c6eNUYim64bnd9IH8Xq5ngxTu6dafPyZc27QJxQ0wvkjuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kkaaMUrrzkAiacBfsbeTylOq2JuJiMym70ILbZkcQuY=;
 b=S4poZ7LlS4es/P2fby0M3Tchi8eHL+rmviAtPyi6/i+8XqoJ8UpD9KtwFpqwOgjMytmRQsjZxZ74sHod67o95tmTDpGR44m0vCPiFgH1LFkrPcNjcpDrMfmxO7fDNUhpQpvzdjYkhTrk+eX4qYLjJvuOavl1C0GoFG/ah2LpYxTSLq1tJh8DkkqlXuBizBJt8frCGCXctku+oEIqkb6HFmicnUoraJreGLWy//M9COyGntNY+fRqkfq+F8AkxF/y54WLcLqmBfOCmPJ8nIRyHL/A+8kvJlYuhqHa97GoxOYOvXMI3BXhGvuWYM9FFr4ymY16rsVk6avuzTaYStNhYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CY5PR11MB6161.namprd11.prod.outlook.com (2603:10b6:930:2a::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.31; Wed, 25 Oct
 2023 21:45:28 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::dc77:69e0:a3bc:e3e]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::dc77:69e0:a3bc:e3e%6]) with mapi id 15.20.6907.025; Wed, 25 Oct 2023
 21:45:28 +0000
Date: Wed, 25 Oct 2023 17:45:24 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <ZTmMdCIjRHP0K/SE@intel.com>
References: <20231025040520.1236213-1-matthew.brost@intel.com>
 <c3ndl6pfzedexr3ukg6ym35stplij4ponp2uojuqytcerlishr@z5dsqljvtbi4>
 <ZTlLNHyzwqAefhx5@DUT025-TGLU.fm.intel.com>
 <eztcofcj4qwbokg6n2ua4t5okg6f24mksxgkgsewozvdbufe22@bt7pyoxs3s5r>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <eztcofcj4qwbokg6n2ua4t5okg6f24mksxgkgsewozvdbufe22@bt7pyoxs3s5r>
X-ClientProxiedBy: MW4PR03CA0036.namprd03.prod.outlook.com
 (2603:10b6:303:8e::11) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CY5PR11MB6161:EE_
X-MS-Office365-Filtering-Correlation-Id: f9547842-3068-4f39-8e12-08dbd5a3b41a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7kTToYzjFDZ05rpxk+r3YjX3FVuxkVBFm99ZwPLkWEvF4xrhF1Ex2AvX9FBbYFrLqjxxx6uFRDaXg68Ig5ZFADQMZ0Xl45hyWbdwVGbYCCsUYTuQjnLlx3mYeVWP66MDifyMUtNT8f1rI/USSMqGsvUtCJj75Kq4qRMIA3rK3MKV6pK9z7rXL55F3sZA+Wvr1qbSL15T8RSpk9QGTmdBqsKOQTMQ9nPD+eta/XgOjQ3iPa8LnVqvYQ0rhl4W660sj01uZ/X8pAnjp1qd8VFkUS1wkonxwjMMXzYYDJfQ1qED6OWdITBHK+clumg3NaMSSZ6X4h89ujxP2+LRY/pINo89J/T6OnTuFJj9jzKlBTUMGLS7rCXaxgvPJsZ+N/RofSSoHsksIR28IQLM5qtssN7yp0TwFIn2GOB9pumML6te3UxmUp1ILBVqeRWVnqcDGbKojc0zGdW0R2BcFMwzfOiycI9U1/f9fAfWJrt4FJZicVZ5CPU9tJHAWTcxFuGrLe3b5W8MfZrqAzDiBXzsfFPTEF/cVueYazaEcs4Yi6+JWs4ciSpruLdyHN3CbYuM
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(39860400002)(396003)(346002)(136003)(376002)(230922051799003)(451199024)(1800799009)(64100799003)(186009)(66946007)(36756003)(2906002)(38100700002)(316002)(82960400001)(2616005)(37006003)(6636002)(66556008)(6666004)(478600001)(6486002)(6512007)(83380400001)(44832011)(6506007)(15650500001)(86362001)(5660300002)(4326008)(8676002)(66476007)(41300700001)(6862004)(8936002)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?iCgnCvw/IrUviA546BdG0vYgH0UF5ugmvGujp1mYrTE6MWbk57XZtgTa/FGZ?=
 =?us-ascii?Q?bQIHrxX9oOTkPLjGkIf4z4bnpHOxcyOpfwtAUV6f4rps7ZuwYk9FnOlJDOh2?=
 =?us-ascii?Q?2a/PgRiWjIs+hhK0WlK3DjfrHjH7Ewaaa3B+Yu3jkRo0Xp+y6wC/kzuvYm86?=
 =?us-ascii?Q?dTR+hX3IOp+oUDr2C06kJz4WBB/Nea68W2JTcmEjiZXvtLCH3dflMjgNVcWV?=
 =?us-ascii?Q?siOTz7ueqXTNLuSW7zENARO6OWjuahCAYurlKjMiiGNVl1ywvL5OC4Q+rMsH?=
 =?us-ascii?Q?5pNT/iPvxZajbl63P/Y+h21m/sngkQ/w4N7rGSI5rdkg8JnN5m+M+CFrKHFH?=
 =?us-ascii?Q?Uo3rdbdFVKwGkmGNlPPFuo3Fhr0OKWcGmW8wRCcalPGRW6M+Yb2K6zFx0Dir?=
 =?us-ascii?Q?qd7N+yuT2TmxMQ1lTgtq3KBj3hCuMoYRUD08Tuc0VmYNf4EvffzjJY3VqhTO?=
 =?us-ascii?Q?Jh5nYySc+jD3EC4JgJsvfARA/gUaneS1e5oTbF21M9bPc55Q5WoWF6IkMtm3?=
 =?us-ascii?Q?xRSdaFq+gf3ubDLzVsvDQB9K8ZLyMqgkYolxJ63/1H2tSaMRFu26p2VuXcyr?=
 =?us-ascii?Q?o+c2rJn4eZEpN+c9EhzYU/12cxxZc86c7/4MRn6ofbmuB+NL2YleIUfRfE3B?=
 =?us-ascii?Q?rK9uBXykL3z9cfL7pCt/kEWjhVC3zNJtbylnuZlpW9Mz3ZdJSmNRhdUMxkC8?=
 =?us-ascii?Q?Tj4MHApcJe6+0FrQQp6wpF7xb3HJbIWY45+j+0ig2OhDNm3sYsIwv0oo2NhI?=
 =?us-ascii?Q?FBPv9Ae4DdU2k4DM81wCaBiZvblAuskz2tNJ7IK22MKc4rcBt1hoWIShEZTu?=
 =?us-ascii?Q?TPunePxyai0PY3KKf8EhyAWDRkMZ5LWeBBV/Pz7001BkaXEsU5jMO5HxF0UH?=
 =?us-ascii?Q?2PDqe1sYfugO1Da9kEp2VCKs0crEeuMNTn6wqQVR5RdvrydouydgbPXFeMUW?=
 =?us-ascii?Q?h1AFIUvhTcE6unB3rcqTusrfQ1/qAWqxOIPHD+E9SSIdpqFTR8FzienYJ9r5?=
 =?us-ascii?Q?wTNc7K8k0VFWurzDyz2QlhHOt22MQPLnoJHlhjwR9bPmxtEwjxkBlcs99Moy?=
 =?us-ascii?Q?P8fY0LlBrsXabDq3HuXuGJuuA2A9qKvHt5fgYFdTYO+uFkRqxOrXZ+Z6he2Y?=
 =?us-ascii?Q?T+asEjWCCMNS0Y/VPhNFb/02oBNq1Bjs049DLHVh/DwGoWEk9fsHRaTi8rVK?=
 =?us-ascii?Q?ZN6EhVIH2RuNQDjePwDvld322qjVscHWj66qlVRQFAZSe3P2miQ6cBMmpH7M?=
 =?us-ascii?Q?GXdiU/sFmXnUZUQF6bHDoJa4Ue5xtqVTUQjEBG5Qe9nJ/1yZi4+GFCo4nK0J?=
 =?us-ascii?Q?Be7IrMomQe9T5oBvv5sl1yiOqFBjxfP1Qkku6ftv5mMdIAExmfJ/p77RgZwI?=
 =?us-ascii?Q?a28urplNlUQgBb9smGbI2DQSEO99HoK3icjzF5VPz/xcp54QdlEmpg2rBI4E?=
 =?us-ascii?Q?AIOKTrfmpaoyxQLVV+Gs3mK4KNdCVYHZPWgNNOMFLvW2ymyGwExTg78Qxv82?=
 =?us-ascii?Q?FB7pgw9k7jPDj8X79YAc1z69U+yOLBceW3cEAIc8yOPNk3mtAiY2WDMoS1nd?=
 =?us-ascii?Q?+XwfTp6cSZzjUUXto9Ic2BIrJCNthKcEXyextPjd?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f9547842-3068-4f39-8e12-08dbd5a3b41a
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2023 21:45:28.3487 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pIl5PZKsvZTi1TlGrAR+kWFwtCv5PhnjtWlureU0ZGSaE5AZHy1dpttYmZTHgNgC+eq63eM25nWxGvYrH+cwbg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6161
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Update to upstream DRM scheduler code
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

> > This is based on the upstream series [1] that hopefully gets merged
> > soon. To create this patch I just dropped in the new drm-scheduler code
> > (copied drivers/gpu/drm/scheduler/*.c / *.h into this repo) and updated
> > the Xe code as required. The DRM scheduler coded so much in the baseline
> > I'm not sure if it worth trying to do fixup patches, rather we just
> > merge it on tip and find a proper place these changes during the next
> > rebase. Open to other ideas too.
> 
> I don't think we should do fixup patches neither, but it's important to
> keep documented in the commit message how and what was changed. Like you
> did now.
> 
> However I think it will be quite troublesome to rebase the branch in
> future since you are also changing other parts of the code. So it's not
> a matter of just dropping this one patch when we rebase.  Lately it's
> usually Rodrigo who is rebasing drm-xe-next, so +Rodrigo.

the rebase won't be easy indeed.
Another aspect is that we will likely need to wait that to propagate
from drm-misc-next to drm-next before we can rebase on drm-next and do
the first pull-request.

> 
> One alternative that comes to mind is: can you do the rebase and post
> the result to a remote branch? Assuming your remote is called xe:
> 
> 	git fetch xe
> 	git reset --hard xe/drm-xe-next
> 	git rebase -i bb46e837b7e59c22a567ae6913ff4d6bf0e9211a

Yes, please! We had a similar situation with the display case and this
is what I asked Jouni to do. Having the reference branch when rebasing
was super helpful.

Besides the reference branch, we need a top commit on drm-xe-next.
(Maybe this commit here?, maybe something more)

But in a way that the
$ git diff drm-xe-next..reference-branch
should be empty

Then we force-push origin/drm-xe-next

and when the rebase on drm-next comes, the drm-sched base patches
will disappear and we won't have any conflict.

> 
> Then drop the patches as you see fit and add the ones from this series.
> 
> Lucas De Marchi
