Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA9AEC7618D
	for <intel-xe@archiver.kernel.org>; Wed,  5 Apr 2023 23:38:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A730510EA78;
	Wed,  5 Apr 2023 23:38:53 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70FB410EA78
 for <intel-xe@lists.freedesktop.org>; Wed,  5 Apr 2023 23:38:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680737931; x=1712273931;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=qWdB1t4QuqqIoSna+P4TA2lk1YfxIKYvePDaCxwp2oI=;
 b=Cl2fb3obtHl43XRCbKEWvMbb1npPmcjC8/MCnw8tWxS7Dw5hvzd2xJkL
 NAmtoNyIoehUSjsRu2czwU+6GK74sUydzKqAVLL94K1M9GYBQcrlC1Fp2
 n4WUdyzz2QPksh0vC9yhwaq4YCX/71UfZRgHMlpdbFAjdUl3BDPisEmXS
 zW1mq9oWw5viwR6okSoX7u6wfm1TdtWE/lg1Sa905i2cWO8lDdmMbRD6l
 8pCvccv4xwkeVzgZVMuFJWpo2YZDP1K4+Aw82cFaSIyBh61db0j7YELPy
 FbeW4om9jBtutw89bNry2IfoXzcJp7/eMpuc+4DEiH1W4daKarL3RoeZk w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="326633549"
X-IronPort-AV: E=Sophos;i="5.98,322,1673942400"; d="scan'208";a="326633549"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2023 16:38:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="830548726"
X-IronPort-AV: E=Sophos;i="5.98,322,1673942400"; d="scan'208";a="830548726"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga001.fm.intel.com with ESMTP; 05 Apr 2023 16:38:50 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 5 Apr 2023 16:38:50 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Wed, 5 Apr 2023 16:38:50 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.45) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Wed, 5 Apr 2023 16:38:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XnaKOKgVCY/iRjA0Zh1dbj8iVLD3FNEbhg8E8FalHC/ihwjb1+Svmv0lkEChCsruuKsZmgL++rizcF9a6fs1PC8HZOC5Bql61uP1KOtIpo+meVIBNoNVoAvPLTvm4K5vu4x4ytejQgAPGEkDckxSgRKdlc2PhKw2OuRkqyrw4bfkHRGxhe8tn/eHoyXw+Mb/LSw/QgyDWlTi07GNH7NF6do/KvXuxja6y0Gj7qrixSEmHyhhTCStLnkyIHv57O/gKA+SIHoky8hhTAnYMCCyxxRGZudD5ln664cIuHdMTVRO5P1qSk5BVseHa6mBmtY+7Am4sME/hWhxv3iMjzwDMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rvtSsrlqvKmNeC6ipTeYP0pTMwwi2U+HzmeNgMXTfTY=;
 b=Sf80LzIjzN9neyEHcz+pAAVgoi2PN/d4S1Vw0oW5L52QmTqtpiovhv5grOY82VwddG+kL7R+0FoT74OK5rOJ8MW/QSwT6e50eScmc5vc3879oeE3S9rVu1p1MVZB8sVqQAz/OzYUhFqv1iYOI254Su4XP8lvDTYbaa2SDYqYIhEwTtrv2Dd3BI6YymrOCafy6IgVECcMYgWEmu5qpWv8ttm6mKnUe5qOrQLCU43AHU+cvwuGjXqi3cDak5zXw6gMNdit0LiQN2pm0mOZh5vYnXfqgmc+MfLm6PcXFXkEyxNaq+IYCgC3aE8HCbq1O9JSQV1bPQpoNsIP3zXj5WX2rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA1PR11MB6869.namprd11.prod.outlook.com (2603:10b6:806:29c::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.34; Wed, 5 Apr
 2023 23:38:48 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e%9]) with mapi id 15.20.6254.033; Wed, 5 Apr 2023
 23:38:48 +0000
Date: Wed, 5 Apr 2023 23:38:43 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <ZC4Gg11NfEVHFwhn@DUT025-TGLU.fm.intel.com>
References: <20230405025919.3975162-1-matthew.brost@intel.com>
 <20230405182122.vzr3zgi3zqenocfp@ldmartin-desk2.lan>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230405182122.vzr3zgi3zqenocfp@ldmartin-desk2.lan>
X-ClientProxiedBy: SJ0PR05CA0059.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::34) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA1PR11MB6869:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e773472-e679-41d9-3d7b-08db362ee767
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gi1LjSh1KuaFLiAW4GYmzWbZ2BNnKOs00cbPGjwOTeFwXcQ95X4VRWMZdoXtvjtngRI1IGs/Bq9uitvUjBjOkY9Cj3KL8IS71C2A74s+z/MwvZbghYrQVq0LXZ/0mob9eMUBoMCyg8+nIc/RB/x2m47DhxpRi5wonScEpd1jehoizbaE+Nv3anpO8o4d0ARERaGxJdDGnHY8ZTPj/io7hKQcohUQY6fv6GiM1tcmJ3uHeaIRxLgvIQb0Cz/I9mSUkCriD30nzAYC1pb3fKssZt4vNK0ygweHt2WwoVs88e5gBQVVZcPWuLpV5tsgnZzKf77Gmo4JoZGT6PU1tsbj8TLssZONRc44EcO8RXIL+m6owi1K9hYRXMla3+JLP5RSvpsGZOLL/INjXwCMGeMVtZzlrM00RE08qQDTmeGFagsu6XyVIogjD3h4wgTJR/a2Aj4mSx3ZRw6dx1nQPcbnx7nKQOc1gvPvoa61A5tMOnfyOicIXSU8A78HSBMa8NnAs/rwDwLEXquqjA0foIipnxaibFurNLvBLqubJw/pHU1LkA6S9jIC3BABLTEuHz9+
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(39860400002)(136003)(366004)(346002)(376002)(451199021)(316002)(478600001)(6636002)(82960400001)(5660300002)(8936002)(6862004)(4326008)(86362001)(8676002)(66946007)(44832011)(66556008)(38100700002)(41300700001)(66476007)(6486002)(6512007)(26005)(6506007)(186003)(6666004)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xPlS4dJNJ1k5vd6WlkjrZt55FgRtjk8B5Mo3S/UAD78BLXTnFNHsOxyr3NDe?=
 =?us-ascii?Q?2hW0cLAFsWoTEiFSloAId1dY6B2x2WqJn1OSkhOXXSIpAi3tFXVEW/JCGG0P?=
 =?us-ascii?Q?nufuqcHdwsoscMzWccyV+OSgd1/CB7EGRTtA1r/Ht877NdIPnQz6LkJ8sCt8?=
 =?us-ascii?Q?lWtjfHy99FmTDPtVaKslhjddChbmFlQhkGZNrDZ7Ki9nmvtAus8iry8sClA4?=
 =?us-ascii?Q?4Tk3uAAX+uI4itV9isNRWM2Ts0RKe46LmUsjmJFJ9fjyfsVFkis+k3WmqtnG?=
 =?us-ascii?Q?igSSkxhgl8bUy0zhqLKVEpMo5kN9zFkeEzu40L+b5/3TZAQRqq5Rb2zrTp7x?=
 =?us-ascii?Q?Jej4FlEHsUdaEE6yKnUWGBDTg/caATlk549jMP0IqioBFL7tOen47lOP8xKp?=
 =?us-ascii?Q?1xOuPbWeIBLHlK6XFa69BUPJkD1GsfdHN2b18PIDidBRyhhbGoSsAx5MRfbY?=
 =?us-ascii?Q?WakmNDnFf59Isra5XdX8W7jMKX9RU44u3C2Adv7t79I9wV83XW3wWbjGEVAp?=
 =?us-ascii?Q?xF/whSoLCbGi5BATYn0tfon254b5UqKfSLZWErBiU2n6gEjRhu/QE/6vGBB1?=
 =?us-ascii?Q?uR4l2fRKVP+Ba9D6ZN2zyjGl7QPUt2YTqKnOJZ2hDGvAKBwsYVoDSACIOdzk?=
 =?us-ascii?Q?jjEymnq0g/iW03TYr7JqmLuohmZwURGYjfF8CZWY/jXhXebW4puEJgTyIJOV?=
 =?us-ascii?Q?msEG8tSSANdV6FnOps2hmeuYWbPCpfxU4Chl+TGWzvaiDKuPHT5EHfvx87Mo?=
 =?us-ascii?Q?VWxnGmdkwkPOUy0hyrZ3x8tRMnPCKEMHt9lytTHVp/Fuq46fZrV9Wv6tz5nh?=
 =?us-ascii?Q?CGcqgNUtELgG+yy1frgamDoXA5V5jZAKdfX4oLO2geDpYOYICfNKvzkBgfqp?=
 =?us-ascii?Q?rtsJAsgKMuC63hsSvgtYnQ627hrHsKPwoyY0Ui0x5UUYvZ6nfXd5x7zFzYo6?=
 =?us-ascii?Q?YxAZzSoMGz1HFQXCUnMlL37jfciS/+5QMwYcuklz9c6rA6PEf+sgxfN9TLQ3?=
 =?us-ascii?Q?EvNOhXbAc2qDzP9YZEqXeajJcVOIZzKhGd9JsJsgnzofH9tGhtR1+QfTAAmd?=
 =?us-ascii?Q?9oywHT2RPdOSMsNYu2TxeIwRrKTUpAGhBZp8vpv2p0UshEE7xJVZcYrYYqsH?=
 =?us-ascii?Q?NnCb6qIM/E1ifEzoRkWV4NdWW+HkX8tMxbhPmi11ipFEz0vy8glHZ6rTLyui?=
 =?us-ascii?Q?bpcoSJlAKO5IXc5lL6SnokyRsMewO1oekIZa+Fg/2rfw2EAEQNaUCoxhVM00?=
 =?us-ascii?Q?mEZ+VLYJGEMP0eGwvEvuyQ++IZxbloVuXBwyb0RQbQZycoVZ5A0pqxxzBZnD?=
 =?us-ascii?Q?QeuIrYSGUguoP/ftQXNm+9JArOz9kmPW0pULIUmkRR3PaVlgz+dDTjnL0tI5?=
 =?us-ascii?Q?QuyW5ULhxugHrkdSFe0PNpR8pTlZklPAFmWclSfWZgGqsHf8weAdlDrSnxYK?=
 =?us-ascii?Q?w4UzE7ZfpLcCij4PBixenkTPcwCQpDPTR758WQbddpvoH7E9ncJjZqvaxVYj?=
 =?us-ascii?Q?re6IHZN0Sv773TmUNQJHz4gdFswjx70tERUv3JAnq1gtvQnP9cv8BHl+vnNl?=
 =?us-ascii?Q?2jqlY2l4f3Zy4i/+iUwLUt/P7hBsfeWmR4o+LiHKsfQIBqgE7GaWMWDuD9dl?=
 =?us-ascii?Q?NQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e773472-e679-41d9-3d7b-08db362ee767
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Apr 2023 23:38:48.4112 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v6owbgmL3eFnLsrUl/rwpdWnM9NDNV52oSP+0kbdp00CdJZL2jYTY0HlyjtThpTlC/q02/NUTkY7HALqYHXIOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6869
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Fix error handling in
 xe_gt_record_default_lrcs
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

On Wed, Apr 05, 2023 at 11:21:22AM -0700, Lucas De Marchi wrote:
> On Tue, Apr 04, 2023 at 07:59:19PM -0700, Matthew Brost wrote:
> > Kill engines if an error is encountered in xe_gt_record_default_lrcs so
> > the driver can free these resources on driver teardown.
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> > drivers/gpu/drm/xe/xe_gt.c | 8 ++++++++
> > 1 file changed, 8 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> > index bc821f431c45..3adde2205b39 100644
> > --- a/drivers/gpu/drm/xe/xe_gt.c
> > +++ b/drivers/gpu/drm/xe/xe_gt.c
> > @@ -301,8 +301,12 @@ int xe_gt_record_default_lrcs(struct xe_gt *gt)
> > 
> > 		gt->default_lrc[hwe->class] = default_lrc;
> > put_nop_e:
> > +		if (err)
> > +			xe_engine_kill(nop_e);
> > 		xe_engine_put(nop_e);
> > put_engine:
> > +		if (err)
> > +			xe_engine_kill(e);
> > 		xe_engine_put(e);
> 
> these error handling here mixed with normal flow seem a little bit hard
> to follow. I propose we change them as:
> 
> {
> 	struct xe_engine *e, *nop_e;
> 	struct xe_vm *vm;
> 
> 	for_each_hw_engine(hwe, gt, id) {
> 		void *default_lrc;
> 		
> 		e = nop_e = NULL;
> 
> 		vm = ...
> 		e = ...
> 		if (IS_ERR(e)) {
> 			...
> 			goto fail;
> 		}
> 
> 		...
> 
> 		xe_engine_put(nop_e);
>                 xe_engine_put(e);
>                 xe_vm_put(vm);
> 	}
> 
> 	return 0;
> 
> fail:
> 	if (nop_e) {
> 		xe_engine_kill(nop_e);
> 		xe_engine_put(nop_e);
> 	}
> 
> 	if (e) {
> 		xe_engine_kill(nop_e);
> 		xe_engine_put(nop_e);
> 	}
> 	
> 	xe_vm_put(vm);
> 
> 	/* Wait for engine kill */
> 	msleep(50);
> 
> 	return err;	
> }
> 

Sure.

> Although that msleep() seems arbitrary. Any alternative so we don't need
> to keep tweaking the value for slower platforms? What exactly are we
> waiting on?
>

It is for TDR to kick in and kill the outstanding jobs. Nothing easy
pops out off the top of my head.

Matt

> Lucas De Marchi
> 
> > put_vm:
> > 		xe_vm_put(vm);
> > @@ -310,6 +314,10 @@ int xe_gt_record_default_lrcs(struct xe_gt *gt)
> > 			break;
> > 	}
> > 
> > +	/* Wait for engine kill */
> > +	if (err)
> > +		msleep(50);
> > +
> > 	return err;
> > }
> > 
> > -- 
> > 2.34.1
> > 
