Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5EBBE7E656
	for <intel-xe@archiver.kernel.org>; Tue, 26 Sep 2023 17:39:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CD6E10E3FE;
	Tue, 26 Sep 2023 17:39:39 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EB7210E3FE
 for <intel-xe@lists.freedesktop.org>; Tue, 26 Sep 2023 17:39:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695749978; x=1727285978;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=ZGWw8zi8m4UiARbMRdsWXzOxBCA0uwsQbFbr+zq59oY=;
 b=UTFNOgpREyMZff7VxJVxa8nPxUjVKjqYtt7NsohUfhqf2MCfrVkt52yA
 4uC/dEuFV5ZLT7VhrmSfPfkPe2L3FjjWu7t0hgDAHUbHQEZuIcY7IDBVw
 1BBG3pFFtavdCCWZFsXdzjgsR5UqetS7f55INVhJx+HMRaGm8CCIDSvZy
 8AwJsw/5qM8GDNRb4uyfDaRymLOS6a6SIuMuFKD12m2rJYTNq4zJxVr4V
 OmJibUH2fELtCM4fDbwocSHwm4AncY+RPzlltFLSNBXn7V+7RBEu28jW/
 ZtCw2QL0Zoayj47hagxcH1Prrv8AUBSx+vNzJU6R/gvhGU39Zc6k7o2G/ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="366690705"
X-IronPort-AV: E=Sophos;i="6.03,178,1694761200"; d="scan'208";a="366690705"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2023 10:39:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="864483343"
X-IronPort-AV: E=Sophos;i="6.03,178,1694761200"; d="scan'208";a="864483343"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Sep 2023 10:39:37 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 26 Sep 2023 10:39:37 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Tue, 26 Sep 2023 10:39:37 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.175)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Tue, 26 Sep 2023 10:39:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aSTqBkqqb9sNtFpKzJjNAgJ6FBacLa2O6HJ5lELwBIIahx7KBbMWTwrdqqYo/hd6tYP/p08T2UGMQrJ4tqPDDSxG8B4lZjgJAsMPVkAsWBGzK52Aimy9fVqxSW67Y2tpGImIy3wRdg8DCb2G23hVqza8QvrYG9LMg4VSr05DpHf2+ZgCSL+0bsxg82LVyGIuQJx5g/E4jv9G1k28FMmSP69+Ji0x6WbLbv65igM+FXyw/v5ruFHcW+vSY2Hfn1e2q/8zy8WSTOnU98saXk/BCR9gBEmoOZOwFnrIZmWzv0xy8yKHIjwSiURgm8948L8Vjw9W6ip6iVLIYzZg4GeFvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+nNQwCbn/xXAjT2R5eJbWR8KZBi7/r2NnmAe99YzU10=;
 b=BHPJggpkNy0aLJrUsN3SVUZ3bkNhE2gSKe7rRAqxGQEzmq2nrwkeFGxsEJQ1JZEC6SssvR5Dhg2t2UcUMtBNfG68GT2RESDACtNCgZPlPZOYhhlMs+CtifYcMpRWw3jL1yY8aUZX/txDiv/2J4eAJyZGjcPZVV35ANLF542Soerr5qv5qYXehPenizPZWBGSUjREfix1y8CRPIT7Xilxyzm0nCAjNYahtOsuu8zDuZnj6nIFwN12s95to7vA6Qy9QaeeaKtb9CgDagMkeRAqOO0kYuBoyg/e9EhJPNGQ//dFjGInlwGFmB3nhyYrg4r8VGdfRV56hKVOjbV3A+sz9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CH3PR11MB8382.namprd11.prod.outlook.com (2603:10b6:610:173::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Tue, 26 Sep
 2023 17:39:34 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593%7]) with mapi id 15.20.6813.017; Tue, 26 Sep 2023
 17:39:34 +0000
Date: Tue, 26 Sep 2023 13:39:29 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Sundaresan, Sujaritha" <sujaritha.sundaresan@intel.com>
Message-ID: <ZRMXUZ2nEshzdX6/@intel.com>
References: <20230901121545.361436-1-sujaritha.sundaresan@intel.com>
 <20230901121545.361436-2-sujaritha.sundaresan@intel.com>
 <ZPJK5iahuG41pvcF@intel.com>
 <42c5b687-7827-9ca3-abc5-66d094e726e6@intel.com>
 <27a95bc6-59de-42ec-5633-3b82cc09aedd@intel.com>
 <ZQB20IN6ngi94/Oh@intel.com>
 <f4e47704-6a12-db83-084d-a529a3988597@intel.com>
 <38cc4b43-788e-9680-c416-8cd02831624c@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <38cc4b43-788e-9680-c416-8cd02831624c@intel.com>
X-ClientProxiedBy: BYAPR11CA0042.namprd11.prod.outlook.com
 (2603:10b6:a03:80::19) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CH3PR11MB8382:EE_
X-MS-Office365-Filtering-Correlation-Id: edce150d-421a-4d5f-ebc2-08dbbeb78c3e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IMFFhVzA5Qc7Q5SYXS7GfwrTbH0oBLCTkp+eD/ORUpGsj4c8i7LhpXDGWbE6p6osFp9/QGJ4sHi0zneRatXMPJFR/WvZR64RT1elIT9Lf3JtKN3CblKjcS0bNERCTQz6/VaFw9QKZ8/37qcMrNfq8bB4DYavDf6jePpjYyKtqR8pc7PojuwVwts8sy1qF5J0mvXKAMdWRVAyVtHTMiVyPejAeNbU3cYssoqPRo4A8cfnEyPG8B2HmOYbOzRP1pev2Y3BBEYUwkN7mo7scl8ZMg7H5DuFGiByjScPZ7DYgSY3t+/fYbIx6FMZ21jvajUHjeY4N5234v2JI5j9bGgo29reSxUhUct5fuid2hGGGD8f0ZPtEH7hU9z94GxGiyk8TP9TZFJKTGdm2xfhea1rRGJLo4hGbIkQh0NQFeHZFkvwVDSakTSWQAXPmIK14oQf7zTd5/Ad1puopB1e8j+QhH4ESG45A03KiRH3hiWKwlm3gs1v1sWoLbvffTnTXcTV1Eq5wy9rCjNCwUwSNcU1R1aiWVXQYC0x6kKQLQeWntFXGw0iB3kgXrby4eIVzsBV
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(376002)(396003)(39860400002)(136003)(366004)(230922051799003)(186009)(451199024)(1800799009)(86362001)(36756003)(6506007)(6486002)(5660300002)(26005)(6666004)(53546011)(37006003)(66946007)(6512007)(66556008)(66476007)(2616005)(316002)(6862004)(44832011)(6636002)(41300700001)(478600001)(8676002)(8936002)(4326008)(2906002)(82960400001)(38100700002)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?W5nJiDlA+hSshzhJJYDHL/IuDrTLvgS+pRsmuSMC2pJGfsXBm1i1hb11d3?=
 =?iso-8859-1?Q?fwAUUd9dJZUfMTNM2NTnGjcqFJswEUq/2a1Lj3p4RHYiW5lTUssLhlp0xI?=
 =?iso-8859-1?Q?mxq+FYlMM6GA8rQEOtSMKYKsjXLpMbRkkq4e9J099Ow3I8DonK5cLwmn9I?=
 =?iso-8859-1?Q?8tsS8bJSddSzjSGBL89U82yee4hK5ydl5ELLFtjqAyakL2sarUYKZ+3NVA?=
 =?iso-8859-1?Q?SJUpsEzON5aeMHP4i/m4h+7psQJcEy5COKnbZA38Vr339lQ9vfbHERNcoE?=
 =?iso-8859-1?Q?Qu2Wo3mRv1ZaN8AURwR1Twnyf8D7F8klUkXTOWefV3m3fj1Ru95T4rwqqU?=
 =?iso-8859-1?Q?OWZ+E+H8gfQAs0qALRFOV4xNg5eKHxwRqamMjEU0acdhpmx6/dD0/EEF5S?=
 =?iso-8859-1?Q?IegT4ykFs+VDelna+0WCrlKQdPsZgs44eWeY52TpYEkuZE2mGlkJcZ+ch4?=
 =?iso-8859-1?Q?3/tdiozjEIdgtvOleE4La/QusCnkFPEmUVHhJmazlnLkXvvuoIR1Q42np0?=
 =?iso-8859-1?Q?5LN6pq5ai8XNHqRKBrw8iHxt/V7oJzA5u5nL7mxa3xUPxQ2J1oYkuciCLz?=
 =?iso-8859-1?Q?gu0kP27ve+kQmGjLb6BHeQIs5v4a9us+ZkYMc/N7r4xLkuJg/PZzAFGn8a?=
 =?iso-8859-1?Q?xA4Bdsma0bIGsHeqFHFLPmKDI1yIk44OrpcZNCZOHCFYDTvlm+IPF7OKNc?=
 =?iso-8859-1?Q?xAM58HPV2mAVFyae0ISE9ImWiLO2w/HGP7Jm+URO4GFqVZQeXugPaUS9bj?=
 =?iso-8859-1?Q?+GtlFVqfZ/71zZsnCFUUH57bEQFaBvaOF5f6h934WvWPRsYsB9ITRnbW0d?=
 =?iso-8859-1?Q?ebA9CxqYDYUciE5fLGpuHciOz/PYAGHgh99jNHwqxel7GjcI+w9w4iNuJX?=
 =?iso-8859-1?Q?LBW3cEw8LjSh3lQyFT2TexubtJvy8vV8c78zFJIrY1GDPDUf35iMu7IAYT?=
 =?iso-8859-1?Q?GelANWXdp5y2RG/xUNNhfBL9eauPYXELmwL6CybsTMdj6tEQO3gVweKWBd?=
 =?iso-8859-1?Q?qtFmRDcyDI1zM1BVqCBXnb4A4zLMzojiyUTrQF/nXGliuYv5NDFhrtIHaz?=
 =?iso-8859-1?Q?gxtfCJN534erD1o0fbSMChPml1IFYoXoNtaRIdlHMk12vfr0GlWuxuooM6?=
 =?iso-8859-1?Q?lr3i33RzWvBoQuJZl5LKfRLcxmMQ8M6AAfPb+9irSU6TGjUBpikcxS6Jab?=
 =?iso-8859-1?Q?8uBO7K7rnEbjbDl93SC6lhyHT2gyTLH/LeoStkGuNueahmDy2OpZhd9t46?=
 =?iso-8859-1?Q?iC6fmkPXkK6Jtf2XrWIyNRAE9qrnE7U4tZJaU8V2tLbnwxuB/phMquCzfm?=
 =?iso-8859-1?Q?xSJGcASq6YnVAW5c2ViEqgdLYqSWJ4KAOz9wpV4ajiMazXKwHvKUU7NENE?=
 =?iso-8859-1?Q?7G5fdbkb1Al5uc8ImSUnpeTThA9T5scb9bvNPsEqf73nnSCdXTygcKmRhZ?=
 =?iso-8859-1?Q?iCGt+1ZLxyYLKfWaHbWVQfsyOd3bjdOavN/PHrQ7AGcFpn7bhAnKILf16S?=
 =?iso-8859-1?Q?3AkQ+VV2W85nJzrGpvfK9X8Z513szHJvQn5hA9ot85LeAxfqDC1fbc8ihz?=
 =?iso-8859-1?Q?b+1MAOdZ48dcl8qfylGVAncKqOGdc3biPPRJJ3Qg7gBE10byRBe/uFctF/?=
 =?iso-8859-1?Q?t42pimOZcYZKkslkJV6ejPEZkzQYSxH+G3avj5X9GapjqxApWQzhuShA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: edce150d-421a-4d5f-ebc2-08dbbeb78c3e
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2023 17:39:34.7272 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eSVJuTtAa61p0Jhe/wwZopWKMjpoLUhkCPKfzmZ9jx4Z5gcPm7+nYYCup5N+H8g15ZuwduI8yAVIHjGnI5W2IQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8382
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/3] drm/xe: Add a couple of pcode helpers
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

On Mon, Sep 25, 2023 at 01:43:07PM +0530, Sundaresan, Sujaritha wrote:
> 
> On 9/13/2023 9:33 AM, Sundaresan, Sujaritha wrote:
> > 
> > On 9/12/2023 8:03 PM, Rodrigo Vivi wrote:
> > > On Tue, Sep 12, 2023 at 10:38:50AM +0530, Sundaresan, Sujaritha wrote:
> > > > On 9/3/2023 7:00 PM, Sundaresan, Sujaritha wrote:
> > > > > On 9/2/2023 2:04 AM, Rodrigo Vivi wrote:
> > > > > > On Fri, Sep 01, 2023 at 05:45:43PM +0530, Sujaritha Sundaresan wrote:
> > > > > > > Some pcode commands take additional sub-commands and
> > > > > > > parameters. Add a
> > > > > > > couple of helpers to help formatting these commands to improve code
> > > > > > > readability.
> > > > > > > 
> > > > > > > Signed-off-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
> > > > > > > ---
> > > > > > >    drivers/gpu/drm/xe/xe_pcode.c | 28 ++++++++++++++++++++++++++++
> > > > > > >    drivers/gpu/drm/xe/xe_pcode.h |  3 +++
> > > > > > >    2 files changed, 31 insertions(+)
> > > > > > > 
> > > > > > > diff --git a/drivers/gpu/drm/xe/xe_pcode.c
> > > > > > > b/drivers/gpu/drm/xe/xe_pcode.c
> > > > > > > index 7f1bf2297f51..e45169f47500 100644
> > > > > > > --- a/drivers/gpu/drm/xe/xe_pcode.c
> > > > > > > +++ b/drivers/gpu/drm/xe/xe_pcode.c
> > > > > > > @@ -104,6 +104,34 @@ int xe_pcode_read(struct xe_gt *gt, u32
> > > > > > > mbox, u32 *val, u32 *val1)
> > > > > > >        return err;
> > > > > > >    }
> > > > > > a doc would be required...
> > > > > > 
> > > > > > > +int xe_pcode_read_p(struct xe_gt *gt, u32 mbcmd, u32 p1, u32
> > > > > > > p2, u32 *val)
> > > > > > a better name would be nice....
> > > > > > 
> > > > > > > +{
> > > > > > > +    u32 mbox;
> > > > > > > +    int err;
> > > > > > > +
> > > > > > > +    mbox = REG_FIELD_PREP(PCODE_MB_COMMAND, mbcmd)
> > > > > > > +        | REG_FIELD_PREP(PCODE_MB_PARAM1, p1)
> > > > > > > +        | REG_FIELD_PREP(PCODE_MB_PARAM2, p2);
> > > > > > > +
> > > > > > > +    err = xe_pcode_read(gt, mbox, val, NULL);
> > > > > > but why not simply modifying the existent one to accept 2 params?
> > > > > > 
> > > > > > int xe_pcode_read(struct xe_gt *gt, u32 mbox_param1, u32 mbox_param2,
> > > > > >                 u32 *val, u32 *val1)
> > > > > > 
> > > > > > and the equivalent write...
> > > > > > 
> > > > > > oh, and while doing that, could you please add the
> > > > > > missing documentation
> > > > > > to these 2 functions?
> > > > > > 
> > > > > > Thanks,
> > > > > > Rodrigo.
> > > > > Sure that would work. Will add the docs as well.
> > > > > 
> > > > > Thanks,
> > > > > 
> > > > > Suja
> > > > Hi Rodrigo,
> > > > 
> > > > Another question,
> > > > 
> > > > I can change the existing pcode_read function, but would it be
> > > > better to
> > > > have a separate new write equivalent ?
> > > I wonder if we should do s/xe_pcode_write_timeout(/xe_pcode_write(
> > > 
> > > where timeout is still an argument but it can be null.
> > > And then we merge with your options here and make a single write fn.
> > 
> > I'll see if this works out.
> > 
> > Thanks,
> > 
> > Suja
> > 
> Hi Rodrigo,
> 
> As I am making the final fixes, looks like it would be better to have
> separate new read/write functions.
> 
> With changing the existing read/write functions, we are having to change the
> pcode_mailbox_rw function.
> 
> That is causing issues with other existing functions. Shall I keep the new
> functions defined separately ?

I'm really sorry for having missed this here.
I still believe that there are ways of combining them, even if we have
to change the internal rw function. But if that gets too complicated or too
ugly fine, let's have something alternative, but with a better naming

> 
> Thanks,
> 
> Suja
> 
> > > 
> > > > > > > +
> > > > > > > +    return err;
> > > > > > > +}
> > > > > > > +
> > > > > > > +int xe_pcode_write_p(struct xe_gt *gt, u32 mbcmd, u32 p1, u32
> > > > > > > p2, u32 val)
> > > > > > > +{
> > > > > > > +    u32 mbox;
> > > > > > > +    int err;
> > > > > > > +
> > > > > > > +    mbox = REG_FIELD_PREP(PCODE_MB_COMMAND, mbcmd)
> > > > > > > +        | REG_FIELD_PREP(PCODE_MB_PARAM1, p1)
> > > > > > > +        | REG_FIELD_PREP(PCODE_MB_PARAM2, p2);
> > > > > > > +
> > > > > > > +    err = xe_pcode_write(gt, mbox, val);
> > > > > > > +
> > > > > > > +    return err;
> > > > > > > +}
> > > > > > > +
> > > > > > >    static int xe_pcode_try_request(struct xe_gt *gt, u32 mbox,
> > > > > > >                    u32 request, u32 reply_mask, u32 reply,
> > > > > > >                    u32 *status, bool atomic, int timeout_us)
> > > > > > > diff --git a/drivers/gpu/drm/xe/xe_pcode.h
> > > > > > > b/drivers/gpu/drm/xe/xe_pcode.h
> > > > > > > index 3b4aa8c1a3ba..8d4103afd7e0 100644
> > > > > > > --- a/drivers/gpu/drm/xe/xe_pcode.h
> > > > > > > +++ b/drivers/gpu/drm/xe/xe_pcode.h
> > > > > > > @@ -19,6 +19,9 @@ int xe_pcode_write_timeout(struct xe_gt *gt,
> > > > > > > u32 mbox, u32 val,
> > > > > > >    #define xe_pcode_write(gt, mbox, val) \
> > > > > > >        xe_pcode_write_timeout(gt, mbox, val, 1)
> > > > > > >    +int xe_pcode_read_p(struct xe_gt *gt, u32 mbcmd, u32 p1, u32
> > > > > > > p2, u32 *val);
> > > > > > > +int xe_pcode_write_p(struct xe_gt *gt, u32 mbcmd, u32 p1, u32
> > > > > > > p2, u32 val);
> > > > > > > +
> > > > > > >    int xe_pcode_request(struct xe_gt *gt, u32 mbox, u32 request,
> > > > > > >                 u32 reply_mask, u32 reply, int timeout_ms);
> > > > > > >    --
> > > > > > > 2.25.1
> > > > > > > 
