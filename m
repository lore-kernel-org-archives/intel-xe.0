Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6683CC001DB
	for <intel-xe@archiver.kernel.org>; Tue,  8 Aug 2023 18:15:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DE2C10E3E6;
	Tue,  8 Aug 2023 18:15:29 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42A1610E3E6
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Aug 2023 18:15:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691518528; x=1723054528;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=xqhjEGqO3o7Aisb9IVNDXSS/CJK9s6sEIx8V2GkwCJ4=;
 b=PMFe8iD8svokbIW+pltvGMJ8cwnlzGsIfqRUmr2nuLJVDMYYNt5PfAfa
 PVTWhPdQfcCEX06h06X3TRPfTE5vsv3wh+2A+jKtUncZ0pEc6kVIiIOqu
 F0WMHf36uY7Lq07W5lIS1fLmyWFZbbI6luByAFGE24ecz5lDPKkcj5vsK
 U6tC5AOfEcn9p9eaOZub2Ak4zvw4z2cAbBwjOBt0VepNSZAhzV4rKY87H
 nggrysIsKlpXNOaSa+DgbllA2Ih8TpMgbTqUcZPuDB6XXCNqn+sR0ZwTj
 +M3akgb2C1+s9M2StnLy/YNn40kbU13D2JljujzSzIoW5Iny79GIZovT3 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="351217134"
X-IronPort-AV: E=Sophos;i="6.01,156,1684825200"; d="scan'208";a="351217134"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2023 11:15:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="681362201"
X-IronPort-AV: E=Sophos;i="6.01,156,1684825200"; d="scan'208";a="681362201"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga003.jf.intel.com with ESMTP; 08 Aug 2023 11:15:11 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 8 Aug 2023 11:15:11 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 8 Aug 2023 11:15:11 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 8 Aug 2023 11:15:11 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 8 Aug 2023 11:15:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=getqznyTnoyRSH/wWn2CqDodFbTZ/T450AZQYJ7pp2Fk6rO8pxfw1FPx2PKVb261toB3KQHQ1P/eUU1/fydr1KmxHKXJ2lulZKiijGalBInwpa9Ikan4KhgvT2MN9BNdovb+OeBm/nABLVeXmejE4LtROdwU2Qa6tPcqS94Pr/hrfneiRKAkzbzxqfQPeSpnChwf/S2P5YGDlxc79MpbEf1DyJZ/2u5qBQRLFUhgqr18qJYvvLfPc0HgJWgM4aeBC9oU8OuLRa4TBH6J1YTaNamd04NbDFdnkuZv+5GoUc6wzEg1WY03gTOe/Z1sJPd3yL25UCiWNu2DFMO0SuGPQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fgBXV52rQ0pGJN9kJkIUKzkGeU8RvMIhJEFnyQjfQKk=;
 b=iPdTISzxwbsbXe7/rJXyCVcb7cI1x7qlBhX0rYMQl1k1QE7nNw+kyMURLaekXFTbDzhMqsdOeKAYZPVEbTEIEOMJUROMrp66jwOQ8xZSNySc7ualFq6Mh6dR8pnUjuWvqg3nFm3QefcfC1EaIMmtgOAKqyNw0cyLeMEgUv+SXJdn+PvWDxziQe++wm69nhCYH7Vfn4rZjKRTNijApTBmx92p8GNZaRGDwflefHs0IkVt4hZe9KLZ957nW17qo5kQeEjNF9V92B0zQOkLF5ySTrzeON5OJbehtV7jd0WA6dbBZd+T7rjLbcAY4aIXBI5ENCaruj2/T6+pvHxOcL4TBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ0PR11MB5085.namprd11.prod.outlook.com (2603:10b6:a03:2db::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.27; Tue, 8 Aug
 2023 18:15:08 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::538f:8837:abce:4522]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::538f:8837:abce:4522%4]) with mapi id 15.20.6652.026; Tue, 8 Aug 2023
 18:15:08 +0000
Date: Tue, 8 Aug 2023 18:13:58 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <ZNKF5txFNhetaAPk@DUT025-TGLU.fm.intel.com>
References: <20230807173446.2039-1-michal.wajdeczko@intel.com>
 <vrhcmrdcsrd4pw4mgwcrbrmdinoh2ce3uu7ebrabpqcc7kjjll@2aor4ajoytf4>
 <87y1ilshhn.fsf@intel.com>
 <uc5h46hdu34kr5yrng7jpn4o5fobs5z5ttkfqshqzqg3i4lyfc@ecqj62tyqw5o>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <uc5h46hdu34kr5yrng7jpn4o5fobs5z5ttkfqshqzqg3i4lyfc@ecqj62tyqw5o>
X-ClientProxiedBy: BYAPR11CA0037.namprd11.prod.outlook.com
 (2603:10b6:a03:80::14) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ0PR11MB5085:EE_
X-MS-Office365-Filtering-Correlation-Id: df5b0233-6b66-4e55-0b56-08db983b65df
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: N6X0kQ75w1BazTcEv9bgmX6GTWj3OWnPpRLimADjC24f++K4wEKJcI1/I+4E4UfNbAUnrJ5ySvqLOGM4QBg20g2ml1AzJKVoze1BruVBxtcJQBQimAiB5/tG9YRmXLydp5GbBvKSUpq54+mZoyqnD9AMyuKI034G4KKoZdEfvLz9o6wiVA6JMEUJjS1oqHPEBahwc4ONLeytGDfZUiAHMQmDwpzgGVrG2ufvg2yUn5yeAfYAmJiE29DmOD80Q/ejAIoOQdugF/y861sGFdo5kxQ/DSvrwSd6uyu/RaJqlJrzchQj0eYkQz+/DsC+5nod6s6d2NbSZRHw0wI7pX3lR0pGhJl0WDHFAAlREzrVPcniBz5hMJW9Wf6JveCjs9+4PLaQ8zYxvztHMGnrEdiyHE3Z9OreYtZwpb3Bx7c1474vnoiRyT+NFK4gfVVHorTd3ztMALoRylJcdxakci1i101ZkkZKbAVLbC/9kJiy5xlvmK+4BFXY1DJWvaOZN+bEjwYrufea/mBXAZqJepyVYkTDehUz2d7RagAgF5ETBOJ5HlINMiW74SJ5Fqm0vh1Y
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(376002)(39860400002)(366004)(136003)(396003)(186006)(451199021)(1800799003)(316002)(83380400001)(4326008)(2906002)(82960400001)(6862004)(6666004)(8676002)(38100700002)(8936002)(6486002)(5660300002)(478600001)(66946007)(66556008)(41300700001)(66476007)(44832011)(6506007)(6636002)(86362001)(54906003)(26005)(6512007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?xPT4PJW2lt8k3me/iq0xYwrlXakcmJgK1X7y7v9Ovpz50iKb8BKSyeCUQu?=
 =?iso-8859-1?Q?Xaj6C3irXHChgwGQ6FYCgbfiOtW7oMDGCBMmhub0OujQHzXwgP5SOgaRYJ?=
 =?iso-8859-1?Q?9VIrzFh8FdVNTflhLTlYyLfgWrgkKB5jijdoTVqZVShuAk6jNH7U0PvYcG?=
 =?iso-8859-1?Q?kIvF3hgnZMN7keKiVBiJYa06nif8P1DMhzJVBFdwveWgqcGR70lzV0MvRx?=
 =?iso-8859-1?Q?Nmcf+PDSAon36H1yEVcoaxWm+i0ww+iArc0jjNEGjKBDZyytgihZkFMS9s?=
 =?iso-8859-1?Q?06jgN3IcN1wMbxn8J+gJNLfD8X2opJkMzqgwIBbVrNQAjOSn0tvNxiCBI4?=
 =?iso-8859-1?Q?0pMrTlaU6Aq06Nxt8/y4n/NcUONlRyDRPoCivjLEbJjQfT67nq6Drz/ZvV?=
 =?iso-8859-1?Q?ydCjUlg6wFK4NdQXyrjI63xZfirmM6kG3ygCbhUX3XFKa6kEBxR3GTJOKE?=
 =?iso-8859-1?Q?qmTImFzaAq39UW7JhkUt5gMVRm8osaQe5w2MGd1Ef/2vznLVu1Y8qneiq2?=
 =?iso-8859-1?Q?H/++tMvzPHi+mKwgxY/AxlP+BtIcO4jBDnYzrXUjLDcThI3Ni8/kNdpubI?=
 =?iso-8859-1?Q?dCsecCw9f+PtFJfSYFdP+D+w3MaLcIs1n+6vvdwZn3E2GDYPuKDdwQoJLO?=
 =?iso-8859-1?Q?BGTTU2C8BI3NbtfQ+ppzU1APvkirQYKGLu5QEpfkedgqj531MFI5GYCmIJ?=
 =?iso-8859-1?Q?+IsUGr7h7hLKDRA23aOUtjR9u593DM25UJa12hMos1XjFkppIMlsxag01G?=
 =?iso-8859-1?Q?SL79uzj3okZrLSxKbUQZl8+B9ZesOgGKo5pGtz05m7hJUM+Ll7pLdEoQLl?=
 =?iso-8859-1?Q?ksbKiK7x16rogepMo2k4YxBOIdwLU9xdjIvY3rHsQOfD0GaZD/mqEiKlNN?=
 =?iso-8859-1?Q?gBMzeHV+IrK9f/xwPl9ywGLtAxYXvRLnOsiv66itWVuVQil4BbFN1xnP8N?=
 =?iso-8859-1?Q?3pJbKosHSabyjYUKVKDibtBlUtE3wiB4O9DX2LmApa0Pjcv51G7CE+DvV+?=
 =?iso-8859-1?Q?CC+ISqWJOAUufjSE+8JbZFhIjd09Z0DidczqlcMCq5yzK+Bszqaxu07FVR?=
 =?iso-8859-1?Q?sZuwURFH9E+0JPm2ZmUzsOrctLcx9XpKd3nsqC56cfbiptJZWP8I6Ac9rB?=
 =?iso-8859-1?Q?E3aLae8+pv3KgnMrqkcgL/c08cOZ6Yoc8y8GvtI5RSnruEY22c+cyXySTf?=
 =?iso-8859-1?Q?Xwqugt1JF7ghhRpH1ImoNLAE4wq7P/2D2+58ObuhhVJrLXvRhsULlsdkze?=
 =?iso-8859-1?Q?QFydJgnVzKVWtE7M8hUGmFMQ1vbtji+iiiTcPO9TbVnBVEias/ZM/Lkfim?=
 =?iso-8859-1?Q?tLfzW4RfL0CIIE7N7SvikgzO+9yfs1WU7EoYV3d9C4R9oTjgv6Lql5uu1U?=
 =?iso-8859-1?Q?+jwyE4liNImD5+SkywWoYGbJ7VsBid7kTlRIbLGQz1aHQq3y6lkEyy0dtS?=
 =?iso-8859-1?Q?lm6pY2pGehj+70GTRtQloW41fGslzW9eTvTaFo1LYfxxXWUxM+0DfNbP5K?=
 =?iso-8859-1?Q?X9+PKJOCLicpStoTCBRwg7Kicu0eIRht2Ty0njSD1QQpUAJBjQ2YuaNHYl?=
 =?iso-8859-1?Q?cduVap2qczG40wJaAwiZfb2/WHTcDmGysdiLVh/JMWvccFkY1r9fYhsJNF?=
 =?iso-8859-1?Q?HcEmRCb3nZL/qKWnuOArOHfEDoVwXjrZglgqAq6fsLlwxKAzuB+jHFcw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: df5b0233-6b66-4e55-0b56-08db983b65df
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2023 18:15:08.4208 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bKS9yaAwuMMCQsX6Q3DJCHvALGcZJpFgLiwWGiAidxUDfgGXD/gsag0jsA2xqf5+MtMgiWEFoTL/64MZ9E3orA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5085
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Introduce xe_ASSERT macros
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
Cc: Jani Nikula <jani.nikula@intel.com>, intel-xe@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Aug 08, 2023 at 10:28:01AM -0600, Lucas De Marchi wrote:
> On Tue, Aug 08, 2023 at 06:04:20PM +0300, Jani Nikula wrote:
> > On Tue, 08 Aug 2023, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
> > > On Mon, Aug 07, 2023 at 07:34:46PM +0200, Michal Wajdeczko wrote:
> > > > As we are moving away from the controversial XE_BUG_ON macro,
> > > > relying just on WARN_ON or drm_err does not cover the cases
> > > > where we want to annotate functions with additional detailed
> > > > debug checks to assert that all prerequisites are satisfied,
> > > > without paying footprint or performance penalty on non-debug
> > > > builds, where all misuses introduced during code integration
> > > > were already fixed.
> > > > 
> > > > Introduce family of xe_ASSERT macros that try to follow classic
> > > > assert() utility and can be compiled out on non-debug builds.
> > > > 
> > > > Macros are based on drm_WARN, but unlikely to origin, disallow
> > > > use in expressions since we will compile that code out.
> > > > 
> > > > As we are operating on the xe pointers, we can print additional
> > > > information about the device, like tile or GT identifier, that
> > > > is not available from generic WARN report:
> > > > 
> > > > [ ] xe 0000:00:02.0: [drm] Assertion `true == false` failed!
> > > >    platform: 1 subplatform: 1
> > > >    graphics: Xe_LP 12.0 step B0
> > > >    media: Xe_M 12.0 step B0
> > > >    display: enabled step D0
> > > >    tile: 0 VRAM 0 B
> > > >    GT: 0 type 1
> > > > 
> > > > [ ] xe 0000:b3:00.0: [drm] Assertion `true == false` failed!
> > > >    platform: 7 subplatform: 3
> > > >    graphics: Xe_HPG 12.55 step A1
> > > >    media: Xe_HPM 12.55 step A1
> > > >    display: disabled step **
> > > >    tile: 0 VRAM 14.0 GiB
> > > >    GT: 0 type 1
> > > > 
> > > > [ ] WARNING: CPU: 0 PID: 2687 at drivers/gpu/drm/xe/xe_device.c:281 xe_device_probe+0x374/0x520 [xe]
> > > > [ ] RIP: 0010:xe_device_probe+0x374/0x520 [xe]
> > > > [ ] Call Trace:
> > > > [ ]  ? __warn+0x7b/0x160
> > > > [ ]  ? xe_device_probe+0x374/0x520 [xe]
> > > > [ ]  ? report_bug+0x1c3/0x1d0
> > > > [ ]  ? handle_bug+0x42/0x70
> > > > [ ]  ? exc_invalid_op+0x14/0x70
> > > > [ ]  ? asm_exc_invalid_op+0x16/0x20
> > > > [ ]  ? xe_device_probe+0x374/0x520 [xe]
> > > > [ ]  ? xe_device_probe+0x374/0x520 [xe]
> > > > [ ]  xe_pci_probe+0x6e3/0x950 [xe]
> > > > [ ]  ? lockdep_hardirqs_on+0xc7/0x140
> > > > [ ]  pci_device_probe+0x9e/0x160
> > > > [ ]  really_probe+0x19d/0x400
> > > > 
> > > > Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> > > > Cc: Oded Gabbay <ogabbay@kernel.org>
> > > > Cc: Jani Nikula <jani.nikula@intel.com>
> > > > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > > Cc: Matthew Brost <matthew.brost@intel.com>
> > > > ---
> > > > drivers/gpu/drm/xe/xe_assert.h | 160 +++++++++++++++++++++++++++++++++
> > > > 1 file changed, 160 insertions(+)
> > > > create mode 100644 drivers/gpu/drm/xe/xe_assert.h
> > > > 
> > > > diff --git a/drivers/gpu/drm/xe/xe_assert.h b/drivers/gpu/drm/xe/xe_assert.h
> > > > new file mode 100644
> > > > index 000000000000..7ea295b7091c
> > > > --- /dev/null
> > > > +++ b/drivers/gpu/drm/xe/xe_assert.h
> > > > @@ -0,0 +1,160 @@
> > > > +/* SPDX-License-Identifier: MIT */
> > > > +/*
> > > > + * Copyright © 2023 Intel Corporation
> > > > + */
> > > > +
> > > > +#ifndef __XE_ASSERT_H__
> > > > +#define __XE_ASSERT_H__
> > > > +
> > > > +#include <linux/string_helpers.h>
> > > > +#include <drm/drm_print.h>
> > > > +#include "xe_device_types.h"
> > > > +#include "xe_step.h"
> > > > +
> > > > +/**
> > > > + * DOC: Xe ASSERTs
> > > > + *
> > > > + * While Xe driver aims to be simpler than legacy i915 driver it is still
> > > > + * complex enough that some changes introduced while adding new functionality
> > > > + * could break the existing code.
> > > > + *
> > > > + * Adding &drm_WARN or &drm_err to catch unwanted programming usage could lead
> > > > + * to undesired increased driver footprint and may impact production driver
> > > > + * performance as this additional code will be always present.
> > > > + *
> > > > + * To allow annotate functions with additional detailed debug checks to assert
> > > > + * that all prerequisites are satisfied, without worrying about footprint or
> > > > + * performance penalty on production builds where all potential misuses
> > > > + * introduced during code integration were already fixed, we introduce family
> > > > + * of ASSERT macros that try to follow classic assert() utility and can be
> > > > + * compiled out on non-debug builds:
> > > > + *
> > > > + *  * &xe_ASSERT
> > > 
> > > pass by comment, not really checking anything else here... Why are we
> > > mixing upper/lower case? It's perfectly fine to use XE_ as the namespace
> > > like is done for other macros.
> > 
> > I think it comes from drm_WARN, but yeah, could be XE_ASSERT.
> 
> yeah... I think copying that would be like perpetuating a mistake.
>

Agree with Lucas.

Matt
 
> Lucas De Marchi
> 
> > 
> > > 
> > > Lucas De Marchi
> > 
> > -- 
> > Jani Nikula, Intel Open Source Graphics Center
