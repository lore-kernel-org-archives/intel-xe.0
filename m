Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7FD6C07545
	for <intel-xe@archiver.kernel.org>; Wed, 25 Oct 2023 13:52:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92E1F10E661;
	Wed, 25 Oct 2023 13:52:02 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97BC710E661
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Oct 2023 13:52:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698241920; x=1729777920;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=/eDsLESAv5nYUhy2lFjD89j0drkAV4eokCrb+5nVYSo=;
 b=dqkqxCU/QL/AEJDAn911AcJlSFk3cEtYw3zZFEzscbwJEq9HOP9XqRmf
 U1kpEf+6dBj5b0DsQ24WC6yt1cXTqn0lg9qeUTamxkjksCYuC/Z+4Bq1R
 GFSz31uZukYuo7R7oWuKNkQnnw748dbCGxW913xQflATxRWzJ+rUyYVAO
 NY1WD4S5F1dBy2/UKS+/yfaj5XvzMCa4DpDDY+BgL4hjxL9aCBuox3Opx
 RfDYR+Gj4sy9lltRCdHENJR/8S0yp/M2zjHTk/5RBgNOxhf9NSTZVEv/9
 xfCv4PCtw97jnqJqjBsi64LsgwzgLDUDwqeUD0PLN68dmtF0ThtW0Jcvj A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="387128202"
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; d="scan'208";a="387128202"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2023 06:52:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="762463485"
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; d="scan'208";a="762463485"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Oct 2023 06:52:00 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 25 Oct 2023 06:51:59 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 25 Oct 2023 06:51:59 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 25 Oct 2023 06:51:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ECbuu6HIBO2tSljnWg/8cWHQtFQTrGkc4BGe/Frykb49tafFqgI5oLQ6KCSgPlMZmxLEN5ozI2JloKa0gcBmJ87X0cZ0PlUfCz96G6cvFYnM20YoT+5aCPYzWZl7DyMU5Rn8ec6LNto6PaKvk7kkkHvsEakFRvNu5JdWFcwZUrvfLvj+/d1FHGuefEn5cBT0xuN32dpkUfqQQVPMT5YoL/O9X/X/GH2L62ZqW1Hr3fjhWX7eOFVNqS+5zF9R92M4+/OmYdBzdB4wFpd0XUpWVzePeaEluU3uJxt5tlYyVihzNYPE8e++7AdZFD6uk58RX0/TOWCO3MQaElfzNTNixQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DGjyGSZguaSOmzkPyxzvuEc6FeYGnxMClIv24FJScMo=;
 b=NwGJs8DnzMlKuyYDWOd65zHcjeP0wpEUfrvRGWW9rhH6y37aoaM5Kms3lvl0+iKjKbrwLXc2KwJkEfEXtueUp7+AGr/ANOk6gIQ4iCva129yNpozQrtw3Z2MiF4uRgmc/PdSclKkrm6nnlD4jnC3uD/T/us+OZZ6GX7b05MsdKKr17Q9TQLEUXMY5A6fLgdrkWwcEEe1BBeijNnX2oNK4G4bQ/ccFFgwxMdOOLEeEvDlJ8XI7w2DRC8IDXA9rxcjnpmskTtDzzQJ+2n9iUoPc2IMujV8ECV6dGOxGft/ToId7m87Ui3NsZ0v1NckFzbef8nOZYOCgNgb8n1RpX4VwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6974.namprd11.prod.outlook.com (2603:10b6:510:225::16)
 by CH0PR11MB5412.namprd11.prod.outlook.com (2603:10b6:610:d3::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.31; Wed, 25 Oct
 2023 13:51:57 +0000
Received: from PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::ad02:4c1b:1e4a:8551]) by PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::ad02:4c1b:1e4a:8551%4]) with mapi id 15.20.6907.032; Wed, 25 Oct 2023
 13:51:57 +0000
Date: Wed, 25 Oct 2023 19:21:50 +0530
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, <intel-xe@lists.freedesktop.org>
Message-ID: <ZTkddhzXGaFrUkpD@bvivekan-mobl>
References: <20231017231843.1790243-5-matthew.d.roper@intel.com>
 <20231017231843.1790243-6-matthew.d.roper@intel.com>
 <ZTkcxUrWTokb+Xrm@bvivekan-mobl>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <ZTkcxUrWTokb+Xrm@bvivekan-mobl>
X-ClientProxiedBy: PN3PR01CA0018.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:95::8) To PH8PR11MB6974.namprd11.prod.outlook.com
 (2603:10b6:510:225::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6974:EE_|CH0PR11MB5412:EE_
X-MS-Office365-Filtering-Correlation-Id: 27b6e06f-abee-4180-18b9-08dbd5618db8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: P9twEWi88OMyBok8wrVaNaGAruSEXf0FoBO3RQZtpUQ78aHwsoHWTGGvQklbk3HGWC9RJpR02SzC9KlvKgz9Hn3LsVQ8R1Ne4op1VFjtyc9IAscldyOg9yp9N6syDxkp/i6qPTN0lJZl0tugTF9gfgH4YVafokULO9Mbl4xcAJYaVzhrj1iD7jIhAvUAR+KHeHCQRJq1JmZ6uWOHDZODDULwq/6NjHaIcAO5j8P02M7evhjimZwpZjEIq3kSJHFLscSYbR2UTbEdQkC7YIengmGYE7nURHzi69z+ZR2pj/agneQDuyj93Lkr0XsYstnYR2H5gR4P/fMKBR6ey+SJ33m2+fSw30pHExmGzFelgsdffkuLA33JgHlCqa7sWFdY4a5Y6De6iCT1OKqv/8jgLmRn5b+HuVk+7VShKjXqHl62CZsodVoEjmV9CM2EaHH9xLUcHUDR1buJSdNrg36xX40fXLyKIuTIl/WeQKVANijtIr+mL2w+xL2F/k83S93M4TVemJ0UD0AoQ/oq6e94kmhCpAnKQsCGn9Rth3LTXw5qNTp6bT+Iuyekr62vXKz7
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6974.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(396003)(136003)(346002)(39860400002)(366004)(376002)(230922051799003)(64100799003)(1800799009)(451199024)(186009)(2906002)(38100700002)(66946007)(66476007)(316002)(66556008)(6666004)(6506007)(82960400001)(478600001)(6486002)(6512007)(53546011)(9686003)(83380400001)(44832011)(5660300002)(86362001)(8676002)(41300700001)(8936002)(26005)(33716001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NTdyQStDelVpV3VlT285TjU5VFdYclV6L0c3MzJCYVVIY2VwTUpaNHA1ZWtj?=
 =?utf-8?B?dlp2VnkvUzJLbHcrWE1iL0xTb1lHN2NFR3N0ZEt4V3hWZWJxelBHSUs5dnJo?=
 =?utf-8?B?bmdLUnhaODlwOE1mWit1a3JPam1iOGZnamcrTk5qRXpEK0pHUVU1U3RnaDZi?=
 =?utf-8?B?d29adjhzWWcyS2grc3d4ck9rQ04rZjhzNHpxajEyaXh4L2xXL09XWUM4aDVW?=
 =?utf-8?B?WDV4MlRyaHAxckUrM2NtZUNqdWlQMEhKeU5NNWk5RmZCV29qV2QwMHNlQURk?=
 =?utf-8?B?SE5NdHIxbHZvTWNROVNUR3NDRTFNRUtXZVZRbXFCdlg3QjNjVkNzaHVxVW1s?=
 =?utf-8?B?bEh4ajZuMFRPL3N2K05tWW85Tk0zN25QK3crMmFwa3BvMWlLNEhuUHBjcUZp?=
 =?utf-8?B?NGM1aGxsN3pML3l2dTFmbjZoVzF0eGV0cjkxSTBwZTlCL2NkelRnbEpYUnBC?=
 =?utf-8?B?c3AwSnBxd1Y4YlR4SXcyWUFUY0ZJWWlBYWdPT0dtc2J4UzM0cDBlRHd0Vy9J?=
 =?utf-8?B?SjBiMTcya3FEZnluYjhJWElrTkIzOFdKTkxVNENmTW0rUllQWFpsZzlMTzYw?=
 =?utf-8?B?Qmk4eGdrbW1URmNvVnYrZ1g3bXdKclE0U09MWjltSUZaVnM3cStpVVFjREtV?=
 =?utf-8?B?dEhGZjRLTDFqY0d0M1NMQXdJR0NMU2lDcDBFbUtSNzFCdTQ2Qml0UTYrTmt3?=
 =?utf-8?B?cEJ0S2dVZ1RFTHh5MnZaNXlQZml1cDlqUTZRaG1TU0VTQ3N3d200Z1RyckZY?=
 =?utf-8?B?WGJpbU1PazVUY280eTdpWjQrM2J1cnhuUkNCQ1NVaDk2Y2YzOXFMNkFaK1FZ?=
 =?utf-8?B?SllGWHgrclNHNWtTSnlFMExORXpYYXRJNmIvWlJDNXdBNk1zWTg2N3hHYy9W?=
 =?utf-8?B?QUVueEQyYk82dlpNaXhxUllVMkwxNFU5SGtwM0JjYzBhUUFJZ1YxZS9kN3R0?=
 =?utf-8?B?bXpBbWdKNkFjNm9oTzYvcUp0bU1OVkw4ekVXQjhWUTQwYStrRjlpK0hxaVVk?=
 =?utf-8?B?dm9KSjNMQ2VWdlRPQXpzVEJOZk5ENXBIWkVpS0hHUzdQeVN5RC9ZWVBXa0JU?=
 =?utf-8?B?R0VSZW04UWUzVER6NTRCTTVtQjk4blVjVExOMVpENFdPWnp2OVo2ZUIrcFZj?=
 =?utf-8?B?VXhyTXF0aTMrSS9qWVJycHUwUTgzeGtnUmQyb2ZneHRyZC9Pb2F3ZzlpZVpF?=
 =?utf-8?B?N29rQllJRnhmZzBualhKaFprQm8xRm5xN1pkYlFKQjFaUHhNM3hqZ2RsaTF0?=
 =?utf-8?B?NEI0R21ET21iR24wNDRkd3lXUjdONGlDcm93SkZlalpWdUo0bnFiNTRxUGl3?=
 =?utf-8?B?QWdEV2FyLzZiZms5czR1bEd2YTZOKzZUS3VaMDBCL2xDaHhTSm42KzBVdXNP?=
 =?utf-8?B?Q3oxdWNDSEROMUYwcENwbW9HNEowWGxIM3ZIWFBHRnJxc3lTV1lnWmpHMytB?=
 =?utf-8?B?cDZwYy9yQU1wY0luSFNtakhVQ00yTWFYRThzNFJMMjlZdVpUOEZCWW05cktz?=
 =?utf-8?B?Wm1iMXdUTW1NZUhXOGNMRzVRNzU2citVeHVla001ODZmVURzLzFEYWpBS1la?=
 =?utf-8?B?ZEIvQVMrVHZ4OUtnZXJLMXZjbDRRMkkyNThpek1qRzJBNHBCcjBJVHVUTFdx?=
 =?utf-8?B?ZVZRaTlHY2RhdmFtN05WZWl4d3l5ZnE0bVFwVHRVWWpYeFR5TmU2dGd2QThm?=
 =?utf-8?B?VFBYaWppUXd0Yi9jc3dmRVZ6bHQwcGhxU1R6Z0ZHT005YTdGRFdTeE1jRVgx?=
 =?utf-8?B?cGxLVlo2SGE0dEh6bEprcGczYW5HdnFnRUExbkUzUS9BQzBJYXpHVnJvNlAv?=
 =?utf-8?B?M2RaZlczaWlNQWRxaWhXeTR4S2ZzaFVmb05qMzI1bUY2UUE3TjVjR1BBZHBz?=
 =?utf-8?B?VGxDWFk4NFhHOFArRC9hZVZyWXhyaEw5dkdhU2huTFhURitlYlVjSk9FSFRo?=
 =?utf-8?B?c2lJTVRQOVNNREdHVjB2OFBMdDM4NkZuN1d6bERFT1FUMkV1NE9uWG5UN2hn?=
 =?utf-8?B?T0NjbEJhSTBsTkptYmNOYjd5bzBEN3hveVRYTXNIS1J1bFpPenkxYUFBam4v?=
 =?utf-8?B?SFFPVzNGdGltZnZieUI0QThYZi96VFE4VVBGREExVEFVSWxTS0hJak92UTl2?=
 =?utf-8?B?aDFKQ0lQSXVMb01YUG1UZVFZVmdoUlBiY2hjSWdXT2ZiR0duazQxZnRhaEd2?=
 =?utf-8?Q?CtnXnOYwZB8ogHU5ZZsdSyk=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 27b6e06f-abee-4180-18b9-08dbd5618db8
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6974.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2023 13:51:57.2618 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qTOnCPX0TCJ8RFHUMPS4QPa/rpb6JmePaTBixol2QXngwk4jXCySPFHfIwRIvj/VweA96KpY45BjwVCjxPyxbePemjpCiWxkXqXt+hqfUGOE8qZvD+Owc8QL/LuAhb4+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5412
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/3] drm/xe: Prepare to emit non-register
 state while recording default LRC
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

On 25.10.2023 19:18, Balasubramani Vivekanandan wrote:
> On 17.10.2023 16:18, Matt Roper wrote:
> > On some platforms we need to emit some non-register state while
> > recording an engine class' default LRC.  Add the infrastructure to
> > support this; actual per-platform tables will be added in future
> > patches.
> > 
> > Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_gt.c  | 10 ++++++++-
> >  drivers/gpu/drm/xe/xe_lrc.c | 44 +++++++++++++++++++++++++++++++++++++
> >  drivers/gpu/drm/xe/xe_lrc.h |  3 +++
> >  3 files changed, 56 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> > index 74e1f47bd401..8618275b1877 100644
> > --- a/drivers/gpu/drm/xe/xe_gt.c
> > +++ b/drivers/gpu/drm/xe/xe_gt.c
> > @@ -136,7 +136,13 @@ static int emit_wa_job(struct xe_gt *gt, struct xe_exec_queue *q)
> >  	long timeout;
> >  	int count = 0;
> >  
> > -	bb = xe_bb_new(gt, SZ_4K, false);	/* Just pick a large BB size */
> > +	if (q->hwe->class == XE_ENGINE_CLASS_RENDER)
> > +		/* Big enough to emit all of the context's 3DSTATE */
> > +		bb = xe_bb_new(gt, xe_lrc_size(gt_to_xe(gt), q->hwe->class), false);
> > +	else
> > +		/* Just pick a large BB size */
> > +		bb = xe_bb_new(gt, SZ_4K, false);
> > +
> >  	if (IS_ERR(bb)) > >  		return PTR_ERR(bb); > >  
> > @@ -173,6 +179,8 @@ static int emit_wa_job(struct xe_gt *gt, struct xe_exec_queue *q)
> >  		}
> >  	}
> >  
> > +	xe_lrc_emit_hwe_state_instructions(q, bb);
> > +
> >  	job = xe_bb_create_job(q, bb);
> >  	if (IS_ERR(job)) {
> >  		xe_bb_free(bb, NULL);
> > diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
> > index 332fc0602074..1f7b1ea00d4d 100644
> > --- a/drivers/gpu/drm/xe/xe_lrc.c
> > +++ b/drivers/gpu/drm/xe/xe_lrc.c
> > @@ -12,6 +12,7 @@
> >  #include "regs/xe_gt_regs.h"
> >  #include "regs/xe_lrc_layout.h"
> >  #include "regs/xe_regs.h"
> > +#include "xe_bb.h"
> >  #include "xe_bo.h"
> >  #include "xe_device.h"
> >  #include "xe_drm_client.h"
> > @@ -1108,3 +1109,46 @@ void xe_lrc_dump_default(struct drm_printer *p,
> >  		remaining_dw -= num_dw;
> >  	}
> >  }
> > +
> > +struct instr_state {
> > +	u32 instr;
> > +	u16 num_dw;
> > +};
> > +
> > +void xe_lrc_emit_hwe_state_instructions(struct xe_exec_queue *q, struct xe_bb *bb)
> > +{
> > +	struct xe_gt *gt = q->hwe->gt;
> > +	struct xe_device *xe = gt_to_xe(gt);
> > +	const struct instr_state *state_table;
> > +	int state_table_size;
> > +
> > +	/*
> > +	 * At the moment we only need to emit non-register state for the RCS
> > +	 * engine.
> > +	 */
> > +	if (q->hwe->class != XE_ENGINE_CLASS_RENDER)
> > +		return;
> > +
> > +	switch(GRAPHICS_VERx100(xe)) {
> > +	default:
> > +		xe_gt_dbg(gt, "No non-register state to emit on graphics ver %d.%02d\n",
> > +			  GRAPHICS_VER(xe), GRAPHICS_VERx100(xe) % 100);
> > +		return;
> > +	}
> > +
> > +	for (int i = 0; i < state_table_size; i++) {
> > +		u32 instr = state_table[i].instr;
> > +		u16 num_dw = state_table[i].num_dw;
> > +		bool is_single_dw = ((instr & GFXPIPE_PIPELINE) == PIPELINE_SINGLE_DW);
> > +
> > +		xe_gt_assert(gt, (instr & XE_INSTR_CMD_TYPE) == XE_INSTR_GFXPIPE);
> > +		xe_gt_assert(gt, is_single_dw ^ (num_dw > 1));
> I think it may help to add an another assert statement to check if
> num_dw == 0.
> 
> Rest looks good.
> 
> Reviewed-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
> 
> Regards,
> Bala

Please check the checkpatch warning.

Regards,
Bala

> > +
> > +		bb->cs[bb->len] = instr;
> > +		if (!is_single_dw)
> > +			bb->cs[bb->len] |= (num_dw - 2);
> > +
> > +		bb->len += num_dw;
> > +	}
> > +}
> > +
> > diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
> > index a7056eda5e0c..28b1d3f404d4 100644
> > --- a/drivers/gpu/drm/xe/xe_lrc.h
> > +++ b/drivers/gpu/drm/xe/xe_lrc.h
> > @@ -8,6 +8,7 @@
> >  #include "xe_lrc_types.h"
> >  
> >  struct drm_printer;
> > +struct xe_bb;
> >  struct xe_device;
> >  struct xe_exec_queue;
> >  enum xe_engine_class;
> > @@ -52,4 +53,6 @@ void xe_lrc_dump_default(struct drm_printer *p,
> >  			 struct xe_gt *gt,
> >  			 enum xe_engine_class);
> >  
> > +void xe_lrc_emit_hwe_state_instructions(struct xe_exec_queue *q, struct xe_bb *bb);
> > +
> >  #endif
> > -- 
> > 2.41.0
> > 
