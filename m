Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39BC4C46CD4
	for <intel-xe@archiver.kernel.org>; Wed, 27 Dec 2023 22:45:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE5DE10E109;
	Wed, 27 Dec 2023 22:45:26 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 932D310E109
 for <intel-xe@lists.freedesktop.org>; Wed, 27 Dec 2023 22:45:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703717126; x=1735253126;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=HBhS4dTXpDgusp+9L9aiEJxkBXOmpMDYNRvrbCddrOw=;
 b=PnD4IKqrQJQtw5BLW/iM1tYbb0PnkWf+yyDy0Zqi5Xbdl/58yzCqeKnt
 +n5M3jKCp07OOUAAnhpaI1fTgUrImJMr9B3HVqMtvHxQ/vEjtCfkBkc0K
 QAxjSUFPydntuBMiCWc539e3oCD0cy50TqIt6REILscMMBy1Au8fnu0Tw
 FGTwvuw53HSewVtX8PTUuDD7O1gRWC5zIRuYc4bU5fr/5991Hvke32tS+
 XieOETaEA05KrLQ3DNJeY+Lg6FRrdvyHuwSGu/fbbsFc3LJwNcnSw3AqK
 5wRiCcD9a5EIgavwQLcDCZyJe216Eflfp4MEEOEi5EgV9gQwcHsHrvl47 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10936"; a="3338044"
X-IronPort-AV: E=Sophos;i="6.04,310,1695711600"; 
   d="scan'208";a="3338044"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Dec 2023 14:45:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10936"; a="951618527"
X-IronPort-AV: E=Sophos;i="6.04,310,1695711600"; d="scan'208";a="951618527"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Dec 2023 14:45:24 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 27 Dec 2023 14:45:23 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 27 Dec 2023 14:45:23 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 27 Dec 2023 14:45:23 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.41) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 27 Dec 2023 14:44:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lElYRmppzr7g10XUOKtLlhvOss3yyuWYXTLObpaT1y7/7uHXXZrPqDlwHN+p3iIbzwLfEGOE8jVT+pT1F48I0jMjTMIZXqZ5ByWL4JnlVc1FBrlsnc54vOSvs2k8VqAl00iJBGyGeiI5rIuSA3+9jPXYC3wAEyEQ8/bqugScoMGafmIf/x586fuaGqdOjEgc42M6amp6QC/dpXdhO1JWQdqJoGRXTLkxTXvxGxJpZj7nfPXAqWRG33bGuIYKJywhedbVx/4iAvdnlg7wY9J7e2fK2SAWN+mWotBh/e7tmhP/RkbtIhT9wpRofr2/R9rB5mMJ5WpL6kBwD0XENaCcqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lrjWhY0xmn14eCnlYEtzpVwlK0nTFwP8BLn5KVFyvwU=;
 b=QNl68IS1UinolIo92mmIJ+i9SnfCX3FzFjS7XIh3bjXzTWXfvmRD/zmNVfc+b5exzyf6pKoemy56WWUuXmQFtfro/olBehtG33Q4tlMR0rZ6E8tgg8reB1cwyzXo/bE92kcO2bsIDB/tAzTWd2pbOHhOh8mBMRAzTUeyzEEJ9HMpODbaGr/w0Rodbqc5wtN1uWAlIIrsqTlc7CC/owoyU8J6AYHVDLVm2EfGOJcMD1wc9NZAcQv31X9J6l6aUPxAcaswWu581GB/oaEa0EASp1JyO/evVJDPxCr2vOX/EiG5evmcfzIx3WROLNZe1Dy+FXzMUY5cbAS7BpEl53IlVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MN6PR11MB8241.namprd11.prod.outlook.com (2603:10b6:208:473::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.27; Wed, 27 Dec
 2023 22:44:53 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda%4]) with mapi id 15.20.7113.026; Wed, 27 Dec 2023
 22:44:53 +0000
Date: Wed, 27 Dec 2023 22:43:33 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: Re: [PATCH] drm/xe/guc: Add more GuC CT states
Message-ID: <ZYyolXIBxBhiyQmf@DUT025-TGLU.fm.intel.com>
References: <20231219172824.832873-1-matthew.brost@intel.com>
 <6af59573-3925-4af4-abb4-ad7e1f40b920@intel.com>
 <ZYUi5ZdXQV+r6J7C@DUT025-TGLU.fm.intel.com>
 <c777b06d-4323-4bf4-84fd-b06334c97484@intel.com>
 <ZYydV0poSZ0fc7nZ@DUT025-TGLU.fm.intel.com>
 <15300684-55e6-48ff-85fb-fc7d3acae3b9@intel.com>
 <fb0d767a-16ca-4937-9a75-d98513250d19@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fb0d767a-16ca-4937-9a75-d98513250d19@intel.com>
X-ClientProxiedBy: SJ0PR13CA0223.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::18) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MN6PR11MB8241:EE_
X-MS-Office365-Filtering-Correlation-Id: 87e6b79b-45ef-41fe-28a4-08dc072d712b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eea+FMuimytO4eMyiB3EYgkDkdg0KMgkNUObaME2PZvgEWI1avDSwi+ikvEfsmsR7zSW8LytD0q7MuLp6eh9thLSjyGh05lWEIXBxlRgzCOt6D2j5YmRgGVaWbXY02/JG7cok+VSKY7usFUEI0Lbmaa9fcuttM2jTnFKgsR7lzGlPeIU5o4W5lj9uNAV7ozVWr/7nZ80wP6tLirXOi0uqZjuHEdwprBI4QjKdiLxbs/5Pl9RPVVE4goyEmGiytn+0gdDIoIbWVJjYw3sDENTts2h/c7zUCnI735WFfQ3kfTvtM+d/D8CP6QpzFwyG/3aBgniZP6YSU7FZ7w5TUMeCDglyos6WNJbpdW9rOF8+MSwET4Jbuvm6l30OQNOj20RzfOjS7meoaugnfks8rh+6UOw+ChMnLZ7tNs25lsYNXg9SYP64YZVGjK/ZhzQ6yJHqvxIaJCsthtPuszyajm+qlSmD3iyuuaCLhHxW24yvprr22cSsc5zSuLbbwTzCDIZ4VSL/eMTWaN34Ewpr0khMJZ680ZlDyHFVzgniZEDcuplhzITqMmcljOaxY98/C4mcccehG9MzV8FGudz+z2GCQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(376002)(136003)(39860400002)(346002)(366004)(230922051799003)(451199024)(64100799003)(186009)(1800799012)(30864003)(6512007)(83380400001)(8936002)(82960400001)(41300700001)(2906002)(38100700002)(26005)(6862004)(8676002)(4326008)(316002)(5660300002)(478600001)(44832011)(6506007)(6486002)(53546011)(6666004)(66476007)(66556008)(66946007)(966005)(6636002)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?pKdV38DQnMQlSHHVVm1k8QbTvMldQ1juaYVgXZoSlEc3DBh6aXy+odTPdV?=
 =?iso-8859-1?Q?yIuggAypxM5WL1EONN/0vkM2tT2enHAvSJS4ORi8Xn9QASCH9k7fuOoLvT?=
 =?iso-8859-1?Q?Zjh6BfzXMqByhdGXoukPKzkOoDaXKLOOoy6E7m7JO3cy3JtsnsyBWTPo+Z?=
 =?iso-8859-1?Q?1BzpG91tEzLq41j/oLYeHW/yaECeTWWNFlHVwVizxARiS8TxoJmBtJYtRv?=
 =?iso-8859-1?Q?YhN+kkQEWrth+wTwkN22TNDbjbIaH1X5SWGmNbcTyA4I2SmBP5gdYthV6P?=
 =?iso-8859-1?Q?iJAlGikozKbctNF6BnsAEHYQtZ0dpsXdxbinDFmrq8cxtmGbRS2GsN9Tkd?=
 =?iso-8859-1?Q?nT8YQ4PuF5NWd+uRr577NO2Bo79Yr2D4DhFZJm4bMPx0T9rQPs9c3SrlTe?=
 =?iso-8859-1?Q?luckMUAJO5Aw3OlywoppOP4EaLtNUGPLqck1/7L2WKWm+1+F2Dr3kCNswo?=
 =?iso-8859-1?Q?ktnCBvRvahQE+/JdY0py0yLjfmcgTbVXIavpjwkfW0Q9htc6oD7ivW1CSC?=
 =?iso-8859-1?Q?NIfZPq7DIbFmhyXZ8RHqOUwQ/ZEcReo/4M2ZBT2v6GeIv2HWio1RNlB1Fh?=
 =?iso-8859-1?Q?0XcSbzo71dRjOyWRxOtUs2aC8g7LQoSdakK55iQmiLovQmkqT3jVYcY/sn?=
 =?iso-8859-1?Q?6NYshh+7wT8gohtQtQCW3AYJNeStWJZzF1Pth2CCDYd+cCzlqECBO3HF6V?=
 =?iso-8859-1?Q?SADXCIokx/NtKSuAGx8fFoD26h15x3qg4bQ0Ply9cfbSc21xCgfKusV5j1?=
 =?iso-8859-1?Q?aDN5B2YKBdINe+rzOQZ17zNp+ke7UWNXpgcK6rGUlIwRaL1reUSjrTv9TX?=
 =?iso-8859-1?Q?tJtJ/9odkQho3GWl1DTlrsbAecr7LRNxktcp0ELp+cDZ2mnOZc0lboEciL?=
 =?iso-8859-1?Q?xxudeR8+rzIjw2afh7SnEvAtYN79LQtU9Qmy87VDqbmGptm3rrvYrQjsDB?=
 =?iso-8859-1?Q?Dy4UTovlwzKDrUJ2IBbys9muRHQkIz3BIFsi5nGz+HfBE1B7+btKiTPzHb?=
 =?iso-8859-1?Q?AZ00xEa9kUwWwgsyArTHswjuAH9/izh6ugx23DcPgIciswhOschB77pugj?=
 =?iso-8859-1?Q?CZ5jYcY9FHIfihTWk1M1WkOaoSpOhvMvpEbymJU+KJPWeSRLOGxiMW+PNA?=
 =?iso-8859-1?Q?U6A6qFX349vk4coMCS9SL8BZ+S+DAKclHs6WO0L6nAhU9fJw5OaCT0pghJ?=
 =?iso-8859-1?Q?kjzDBR5JiatWj/8RMr1e4BWeQgo7VpB39hZTkpTvLg6LRxxayJH6iNj0Ld?=
 =?iso-8859-1?Q?/CmKi/gqLm8Kw8D7vV7CZNy3PhelEVAlXCTH3JO7w7xdn83A4KlV0aXWMW?=
 =?iso-8859-1?Q?saev8aZHjH0FP2gAgCqS9hGwRX+YsGpZzIFYVkXkWn5W8i228iwyovdV3w?=
 =?iso-8859-1?Q?C2HoGoB0t+sWpA0C5U7l76hXmdiB8Ri2jTLB8oZfdPlhEfNKZsm/PILPqm?=
 =?iso-8859-1?Q?WTEupfA7zbauYfpwaz31jSJfA2eJf1oGXnQr0iOUr7guyIWFovTMZJZEmt?=
 =?iso-8859-1?Q?nMOLSJ2J4A8FMqHoMrcovVrIStjeNOvKYxGpnANS+Ln2DB/xhjGBYnk9MB?=
 =?iso-8859-1?Q?eqmuoLatM7wPIpikBQkA2b1MmElsZXDQz0+ylJm8BoOPRisdnlo9NJWe4f?=
 =?iso-8859-1?Q?mdw3Y+G5n9OUlc3sGa6Iw/RhPmhdPEX/ybcHc+K7DR3+jctTGpry/oeg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 87e6b79b-45ef-41fe-28a4-08dc072d712b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Dec 2023 22:44:53.4570 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bGL2e9YovOR/nYXKW57pJ7uIhxo5xp37nSaRXz0uRPmogPJqJo0nCLfwFS/93WEVBrDHvLWMgqG3UzMiz7AtLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8241
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Dec 27, 2023 at 02:25:21PM -0800, Daniele Ceraolo Spurio wrote:
> 
> 
> On 12/27/2023 2:20 PM, Daniele Ceraolo Spurio wrote:
> > 
> > 
> > On 12/27/2023 1:55 PM, Matthew Brost wrote:
> > > On Fri, Dec 22, 2023 at 11:36:28AM -0800, Daniele Ceraolo Spurio wrote:
> > > > 
> > > > On 12/21/2023 9:47 PM, Matthew Brost wrote:
> > > > > On Thu, Dec 21, 2023 at 01:56:33PM -0800, Daniele Ceraolo
> > > > > Spurio wrote:
> > > > > > On 12/19/2023 9:28 AM, Matthew Brost wrote:
> > > > > > > The Guc CT has more than enabled / disables states
> > > > > > > rather it has 4. The
> > > > > > > 4 states are not initialized, disabled, drop messages, and enabled.
> > > > > > > Change the code to reflect this. These states will
> > > > > > > enable proper return
> > > > > > > codes from functions and therefore enable proper error messages.
> > > > > > Can you explain a bit more in which situation we expect
> > > > > > to drop messages and
> > > > > > handle it? AFAICS not all callers waiting for a G2H
> > > > > > reply can cope with the
> > > > > Anything that requires a G2H reply must be able to cope with
> > > > > it getting
> > > > > dropped as the GuC can hang at any moment. Certainly all of submission
> > > > > is designed this way, so is TLB invalidations. More on that
> > > > > below. With
> > > > > everything being able to cope with lost G2H their is not a point to
> > > > > continue to process G2H once a reset has started (or send H2G either).
> > > > > 
> > > > > > reply not coming; e.g. it looks like
> > > > > > xe_gt_tlb_invalidation_wait() will
> > > > > During a GT reset xe_gt_tlb_invalidation_reset() is called which will
> > > > > signal all waiters for invalidations avoiding timeouts.
> > > > > 
> > > > > So the flow roughly is:
> > > > > 
> > > > > Set CT channel to drop messages
> > > > > Stop all submissions
> > > > > Do reset
> > > > > Signal TLB invalidation waiters.
> > > > Thanks for clarifying
> > > > 
> > > > > > timeout and throw an error (which IMO is already an
> > > > > > issue, because the reply
> > > > > > might be lost due to reset). I know that currently in
> > > > > > all cases in which we
> > > > > > stop communication we do a reset, so the situation ends
> > > > > > up ok, but there is
> > > > > > a pending series to remove the reset in the runtime
> > > > > > suspend/resume scenario
> > > > > > (https://patchwork.freedesktop.org/series/122772/) in
> > > > > > which case IMO we
> > > > > This path we would want to put the GuC communication into a
> > > > > state where
> > > > > if messages send / recv this triggers an error. (-ENODEV). We don't
> > > > > expect to suspend the device and then send / recv messages.
> > > > > That is the
> > > > > point of this patch - it is fine drop messages during a reset, not if
> > > > > during suspend or if CT has not yet been initialized.
> > > > AFAIU one of the reasons behind this patch (internal report
> > > > 53093) is an
> > > > issue around the suspend path, so we do already receive messages
> > > > after we
> > > > started suspending. If I understand this patch correctly, we
> > > > would put the
> > > > CT in DROP_MESSAGES state on suspend, via the following chain:
> > > > 
> > > > gt_suspend
> > > >          uc_suspend
> > > >                  uc_stop
> > > >                          guc_stop
> > > >                                  guc_ct_drop_messages
> > > > 
> > > > Are you saying this is fine for now, because we always do a
> > > > reset on resume,
> > > > and that we'll need a new state when we stop doing such a reset? (not a
> > > > complaint, just making sure I understood your reply).
> > > > 
> > > I missed this path.... This is slightly different as here we do not call
> > > xe_gt_tlb_invalidation_reset() but I think this does indeed current work
> > > but that may change based on some work Rodrigo is doing related to finer
> > > grained PM.
> > > 
> > > This is turning into a larger discussion as it relates to reset /
> > > suspend flows. I see 3 different flows, lets talk these through.
> > > 
> > > 1. Reset flow (discussed above in my reply)
> > > 
> > > Rough flow should be:
> > > - Set CT channel to drop messages
> > > - Stop all submissions
> > > - Signal TLB invalidation waiters (this would be a change in location)
> > > - Do reset
> > > - Do restart (entails cleaning up any lost submission G2H, enable
> > > CTs, starting submission)
> > > 
> > > In this case we drop all pending H2G / G2H and the reset flow ensures we
> > > recover properly. No fluhing needed.
> > > 
> > > 2. Suspend flow (discussed above in Daniele's reply)
> > > 
> > > Rough flow should be for suspend:
> > > - Set CT channel to drop messages
> > > - Stop all submissions
> > > - Flush G2H handler (just ensure worker is not running to race with
> > > next step, this step is missing)
> > > - Set CT channel to disallow messages
> > > 
> > > Rough flow should be for resume:
> > > - Do reset
> > > - Do restart (entails cleaning up any lost submission G2H, enable
> > > CTs, starting submission)
> > > 
> > > In this case, between setting the CT channel to drop messages and
> > > stopping
> > > submissions, teardowns of exec queues could be happening as this action
> > > likely doesn't take a PM ref that prevents turning off the device (e.g.
> > > user destroying an exec queue). It is safe to just drop these H2G / G2H
> > > as the GuC will be reloaded. We don't except submissions here though as
> > > those should have a PM ref. Not sure we have a way to enforce this yet
> > > but could add something if needed. After submissions are stopped and G2H
> > > handler fluhed we toggle the channel to disallow any further messages.
> > > 
> > > Also notice we don't signal TLB waiters here. I am thinking if a TLB
> > > invalidation is in flight we likely don't power down the device. We
> > > ensure this via PM ref counting somehow. That being said, if the device
> > > is powered off and we try issue a new TLB invalidation we likely
> > > shouldn't issue the invalidation (this is an optimization that is not
> > > required).
> > 
> > Preamble: PM is not something I am too knowledgeable about, so there
> > might be errors in what I'm saying below. Please correct me if I'm
> > wrong.
> > 
> > The PCI subsystem might not power down the device if we have a rpm ref,
> > but we might still go through the pm_suspend call (as AFAIU that is not
> > tied to the rpm refcount) and thus disable the CT communication. In i915
> > we have waiters in the S3 suspend flow to make sure everything is
> > properly flushed out without relying on the rpm ref. Also note that we
> > don't know if the device actually lost power, only that we got ready for
> > it (not sure if there is a way to tell on the resume side), so if the
> > device stayed awake we might end up having to actually do the TLB
> > invalidation (and not just signal the waiters) given that, unlike i915,
> > in Xe we don't do a full GT reset in the resume path. IMO just easier to
> > make sure all the pending TLB invals have gone through before we
> > complete the suspend flow.
> 
> Or we can add a GT reset in the resume flow, which will guarantee that the
> TLBs (and other HW units) are always clean so we can safely drop messages in
> the suspend path.
> 

GT reset on resume makes sense to me.

Matt

> Daniele
> 
> > 
> > > 
> > > 3. Runtime suspend (relates to
> > > https://patchwork.freedesktop.org/series/122772/)
> > > 
> > > Rough flow should be for suspend:
> > > - Stop all submissions
> > > - Wait for all pending G2H to complete naturally
> > > - Set CT channel to disallow messages
> > > 
> > > Rough flow should be for resume:
> > > - Enable CTs
> > > - Start all submissions
> > > 
> > > Rather than flushing G2H, we have to waiting for any pending G2H dance
> > > to complete before disallowing messages as the GuC will not be
> > > reloaded so
> > > we need to ensure the GuC is in a known state.
> > > 
> > > Here we'd have to wake the device on any new TLB invalidation too.
> > 
> > This looks good to me.
> > 
> > Daniele
> > 
> > > 
> > > Does this seem correct and make sense?
> > > 
> > > Matt
> > > 
> > > > > Proper error messages will added based on these new states.
> > > > > 
> > > > > > don't want to drop messages but do a flush instead.
> > > > > > 
> > > > > See above. Also unsure what you mean by flush here? Do you
> > > > > mean the G2H
> > > > > worker? I think that creates some dma-fencing (or lockdep)
> > > > > nightmares if
> > > > > we do that.
> > > > I meant the G2H, yes. We've had a ton of problem on the i915 side with
> > > > worker threads running parallel to the suspend code and trying
> > > > to talk to
> > > > the GuC (latest of which is
> > > > https://patchwork.freedesktop.org/series/121916/), so I am kind
> > > > of worried
> > > > something similar could happen here.
> > > > 
> > > > Daniele
> > > > 
> > > > > Matt
> > > > > 
> > > > > > Daniele
> > > > > > 
> > > > > > > Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> > > > > > > Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
> > > > > > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > > > > > ---
> > > > > > >     drivers/gpu/drm/xe/xe_guc.c          |  4 +-
> > > > > > >     drivers/gpu/drm/xe/xe_guc_ct.c       | 55
> > > > > > > ++++++++++++++++++++--------
> > > > > > >     drivers/gpu/drm/xe/xe_guc_ct.h       |  8 +++-
> > > > > > >     drivers/gpu/drm/xe/xe_guc_ct_types.h | 18 ++++++++-
> > > > > > >     4 files changed, 64 insertions(+), 21 deletions(-)
> > > > > > > 
> > > > > > > diff --git a/drivers/gpu/drm/xe/xe_guc.c
> > > > > > > b/drivers/gpu/drm/xe/xe_guc.c
> > > > > > > index 482cb0df9f15..9b0fa8b1eb48 100644
> > > > > > > --- a/drivers/gpu/drm/xe/xe_guc.c
> > > > > > > +++ b/drivers/gpu/drm/xe/xe_guc.c
> > > > > > > @@ -645,7 +645,7 @@ int xe_guc_mmio_send_recv(struct
> > > > > > > xe_guc *guc, const u32 *request,
> > > > > > >         BUILD_BUG_ON(VF_SW_FLAG_COUNT != MED_VF_SW_FLAG_COUNT);
> > > > > > > -    xe_assert(xe, !guc->ct.enabled);
> > > > > > > +    xe_assert(xe, !xe_guc_ct_enabled(&guc->ct));
> > > > > > >         xe_assert(xe, len);
> > > > > > >         xe_assert(xe, len <= VF_SW_FLAG_COUNT);
> > > > > > >         xe_assert(xe, len <= MED_VF_SW_FLAG_COUNT);
> > > > > > > @@ -827,7 +827,7 @@ int xe_guc_stop(struct xe_guc *guc)
> > > > > > >     {
> > > > > > >         int ret;
> > > > > > > -    xe_guc_ct_disable(&guc->ct);
> > > > > > > +    xe_guc_ct_drop_messages(&guc->ct);
> > > > > > >         ret = xe_guc_submit_stop(guc);
> > > > > > >         if (ret)
> > > > > > > diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c
> > > > > > > b/drivers/gpu/drm/xe/xe_guc_ct.c
> > > > > > > index 24a33fa36496..22d655a8bf9a 100644
> > > > > > > --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> > > > > > > +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> > > > > > > @@ -278,12 +278,25 @@ static int
> > > > > > > guc_ct_control_toggle(struct xe_guc_ct *ct, bool
> > > > > > > enable)
> > > > > > >         return ret > 0 ? -EPROTO : ret;
> > > > > > >     }
> > > > > > > +static void xe_guc_ct_set_state(struct xe_guc_ct *ct,
> > > > > > > +                enum xe_guc_ct_state state)
> > > > > > > +{
> > > > > > > +    mutex_lock(&ct->lock);        /* Serialise dequeue_one_g2h() */
> > > > > > > +    spin_lock_irq(&ct->fast_lock);    /* Serialise CT fast-path */
> > > > > > > +
> > > > > > > +    ct->g2h_outstanding = 0;
> > > > > > > +    ct->state = state;
> > > > > > > +
> > > > > > > +    spin_unlock_irq(&ct->fast_lock);
> > > > > > > +    mutex_unlock(&ct->lock);
> > > > > > > +}
> > > > > > > +
> > > > > > >     int xe_guc_ct_enable(struct xe_guc_ct *ct)
> > > > > > >     {
> > > > > > >         struct xe_device *xe = ct_to_xe(ct);
> > > > > > >         int err;
> > > > > > > -    xe_assert(xe, !ct->enabled);
> > > > > > > +    xe_assert(xe, !xe_guc_ct_enabled(ct));
> > > > > > >         guc_ct_ctb_h2g_init(xe, &ct->ctbs.h2g, &ct->bo->vmap);
> > > > > > >         guc_ct_ctb_g2h_init(xe, &ct->ctbs.g2h, &ct->bo->vmap);
> > > > > > > @@ -300,12 +313,7 @@ int xe_guc_ct_enable(struct xe_guc_ct *ct)
> > > > > > >         if (err)
> > > > > > >             goto err_out;
> > > > > > > -    mutex_lock(&ct->lock);
> > > > > > > -    spin_lock_irq(&ct->fast_lock);
> > > > > > > -    ct->g2h_outstanding = 0;
> > > > > > > -    ct->enabled = true;
> > > > > > > -    spin_unlock_irq(&ct->fast_lock);
> > > > > > > -    mutex_unlock(&ct->lock);
> > > > > > > +    xe_guc_ct_set_state(ct, XE_GUC_CT_STATE_ENABLED);
> > > > > > >         smp_mb();
> > > > > > >         wake_up_all(&ct->wq);
> > > > > > > @@ -321,12 +329,12 @@ int xe_guc_ct_enable(struct xe_guc_ct *ct)
> > > > > > >     void xe_guc_ct_disable(struct xe_guc_ct *ct)
> > > > > > >     {
> > > > > > > -    mutex_lock(&ct->lock); /* Serialise dequeue_one_g2h() */
> > > > > > > -    spin_lock_irq(&ct->fast_lock); /* Serialise CT fast-path */
> > > > > > > -    ct->enabled = false; /* Finally disable CT communication */
> > > > > > > -    spin_unlock_irq(&ct->fast_lock);
> > > > > > > -    mutex_unlock(&ct->lock);
> > > > > > > +    xe_guc_ct_set_state(ct, XE_GUC_CT_STATE_DISABLED);
> > > > > > > +}
> > > > > > > +void xe_guc_ct_drop_messages(struct xe_guc_ct *ct)
> > > > > > > +{
> > > > > > > +    xe_guc_ct_set_state(ct, XE_GUC_CT_STATE_DROP_MESSAGES);
> > > > > > >         xa_destroy(&ct->fence_lookup);
> > > > > > >     }
> > > > > > > @@ -493,11 +501,19 @@ static int
> > > > > > > __guc_ct_send_locked(struct xe_guc_ct *ct, const u32
> > > > > > > *action,
> > > > > > >             goto out;
> > > > > > >         }
> > > > > > > -    if (unlikely(!ct->enabled)) {
> > > > > > > +    if (ct->state == XE_GUC_CT_STATE_NOT_INITIALIZED ||
> > > > > > > +        ct->state == XE_GUC_CT_STATE_DISABLED) {
> > > > > > >             ret = -ENODEV;
> > > > > > >             goto out;
> > > > > > >         }
> > > > > > > +    if (ct->state == XE_GUC_CT_STATE_DROP_MESSAGES) {
> > > > > > > +        ret = -ECANCELED;
> > > > > > > +        goto out;
> > > > > > > +    }
> > > > > > > +
> > > > > > > +    xe_assert(xe, xe_guc_ct_enabled(ct));
> > > > > > > +
> > > > > > >         if (g2h_fence) {
> > > > > > >             g2h_len = GUC_CTB_HXG_MSG_MAX_LEN;
> > > > > > >             num_g2h = 1;
> > > > > > > @@ -682,7 +698,8 @@ static bool retry_failure(struct
> > > > > > > xe_guc_ct *ct, int ret)
> > > > > > >             return false;
> > > > > > >     #define ct_alive(ct)    \
> > > > > > > -    (ct->enabled && !ct->ctbs.h2g.info.broken &&
> > > > > > > !ct->ctbs.g2h.info.broken)
> > > > > > > +    (xe_guc_ct_enabled(ct) && !ct->ctbs.h2g.info.broken && \
> > > > > > > +     !ct->ctbs.g2h.info.broken)
> > > > > > >         if
> > > > > > > (!wait_event_interruptible_timeout(ct->wq,
> > > > > > > ct_alive(ct),  HZ * 5))
> > > > > > >             return false;
> > > > > > >     #undef ct_alive
> > > > > > > @@ -941,12 +958,18 @@ static int g2h_read(struct
> > > > > > > xe_guc_ct *ct, u32 *msg, bool fast_path)
> > > > > > >         lockdep_assert_held(&ct->fast_lock);
> > > > > > > -    if (!ct->enabled)
> > > > > > > +    if (ct->state == XE_GUC_CT_STATE_NOT_INITIALIZED ||
> > > > > > > +        ct->state == XE_GUC_CT_STATE_DISABLED)
> > > > > > >             return -ENODEV;
> > > > > > > +    if (ct->state == XE_GUC_CT_STATE_DROP_MESSAGES)
> > > > > > > +        return -ECANCELED;
> > > > > > > +
> > > > > > >         if (g2h->info.broken)
> > > > > > >             return -EPIPE;
> > > > > > > +    xe_assert(xe, xe_guc_ct_enabled(ct));
> > > > > > > +
> > > > > > >         /* Calculate DW available to read */
> > > > > > >         tail = desc_read(xe, g2h, tail);
> > > > > > >         avail = tail - g2h->info.head;
> > > > > > > @@ -1245,7 +1268,7 @@ struct xe_guc_ct_snapshot
> > > > > > > *xe_guc_ct_snapshot_capture(struct xe_guc_ct *ct,
> > > > > > >             return NULL;
> > > > > > >         }
> > > > > > > -    if (ct->enabled) {
> > > > > > > +    if (xe_guc_ct_enabled(ct)) {
> > > > > > >             snapshot->ct_enabled = true;
> > > > > > >             snapshot->g2h_outstanding =
> > > > > > > READ_ONCE(ct->g2h_outstanding);
> > > > > > >             guc_ctb_snapshot_capture(xe, &ct->ctbs.h2g,
> > > > > > > diff --git a/drivers/gpu/drm/xe/xe_guc_ct.h
> > > > > > > b/drivers/gpu/drm/xe/xe_guc_ct.h
> > > > > > > index f15f8a4857e0..214a6a357519 100644
> > > > > > > --- a/drivers/gpu/drm/xe/xe_guc_ct.h
> > > > > > > +++ b/drivers/gpu/drm/xe/xe_guc_ct.h
> > > > > > > @@ -13,6 +13,7 @@ struct drm_printer;
> > > > > > >     int xe_guc_ct_init(struct xe_guc_ct *ct);
> > > > > > >     int xe_guc_ct_enable(struct xe_guc_ct *ct);
> > > > > > >     void xe_guc_ct_disable(struct xe_guc_ct *ct);
> > > > > > > +void xe_guc_ct_drop_messages(struct xe_guc_ct *ct);
> > > > > > >     void xe_guc_ct_fast_path(struct xe_guc_ct *ct);
> > > > > > >     struct xe_guc_ct_snapshot *
> > > > > > > @@ -22,10 +23,15 @@ void
> > > > > > > xe_guc_ct_snapshot_print(struct xe_guc_ct_snapshot
> > > > > > > *snapshot,
> > > > > > >     void xe_guc_ct_snapshot_free(struct
> > > > > > > xe_guc_ct_snapshot *snapshot);
> > > > > > >     void xe_guc_ct_print(struct xe_guc_ct *ct,
> > > > > > > struct drm_printer *p, bool atomic);
> > > > > > > +static inline bool xe_guc_ct_enabled(struct xe_guc_ct *ct)
> > > > > > > +{
> > > > > > > +    return ct->state == XE_GUC_CT_STATE_ENABLED;
> > > > > > > +}
> > > > > > > +
> > > > > > >     static inline void xe_guc_ct_irq_handler(struct xe_guc_ct *ct)
> > > > > > >     {
> > > > > > >         wake_up_all(&ct->wq);
> > > > > > > -    if (ct->enabled)
> > > > > > > +    if (xe_guc_ct_enabled(ct))
> > > > > > >             queue_work(system_unbound_wq, &ct->g2h_worker);
> > > > > > >         xe_guc_ct_fast_path(ct);
> > > > > > >     }
> > > > > > > diff --git a/drivers/gpu/drm/xe/xe_guc_ct_types.h
> > > > > > > b/drivers/gpu/drm/xe/xe_guc_ct_types.h
> > > > > > > index d814d4ee3fc6..e36c7029dffe 100644
> > > > > > > --- a/drivers/gpu/drm/xe/xe_guc_ct_types.h
> > > > > > > +++ b/drivers/gpu/drm/xe/xe_guc_ct_types.h
> > > > > > > @@ -72,6 +72,20 @@ struct xe_guc_ct_snapshot {
> > > > > > >         struct guc_ctb_snapshot h2g;
> > > > > > >     };
> > > > > > > +/**
> > > > > > > + * enum xe_guc_ct_state - CT state
> > > > > > > + * @XE_GUC_CT_STATE_NOT_INITIALIZED: CT suspended,
> > > > > > > messages not expected in this state
> > > > > > > + * @XE_GUC_CT_STATE_DISABLED: CT disabled, messages
> > > > > > > not expected in this state
> > > > > > > + * @XE_GUC_CT_STATE_DROP_MESSAGES: CT drops messages without errors
> > > > > > > + * @XE_GUC_CT_STATE_ENABLED: CT enabled, messages
> > > > > > > sent / recieved in this state
> > > > > > > + */
> > > > > > > +enum xe_guc_ct_state {
> > > > > > > +    XE_GUC_CT_STATE_NOT_INITIALIZED = 0,
> > > > > > > +    XE_GUC_CT_STATE_DISABLED,
> > > > > > > +    XE_GUC_CT_STATE_DROP_MESSAGES,
> > > > > > > +    XE_GUC_CT_STATE_ENABLED,
> > > > > > > +};
> > > > > > > +
> > > > > > >     /**
> > > > > > >      * struct xe_guc_ct - GuC command transport (CT) layer
> > > > > > >      *
> > > > > > > @@ -96,8 +110,8 @@ struct xe_guc_ct {
> > > > > > >         u32 g2h_outstanding;
> > > > > > >         /** @g2h_worker: worker to process G2H messages */
> > > > > > >         struct work_struct g2h_worker;
> > > > > > > -    /** @enabled: CT enabled */
> > > > > > > -    bool enabled;
> > > > > > > +    /** @state: CT state */
> > > > > > > +    enum xe_guc_ct_state state;;
> > > > > > >         /** @fence_seqno: G2H fence seqno - 16 bits used by CT */
> > > > > > >         u32 fence_seqno;
> > > > > > >         /** @fence_lookup: G2H fence lookup */
> > 
> 
