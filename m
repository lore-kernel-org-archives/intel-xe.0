Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 887F5C4167B
	for <intel-xe@archiver.kernel.org>; Fri,  8 Dec 2023 05:29:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A8BF10E9CC;
	Fri,  8 Dec 2023 05:29:46 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78DE910E9CC
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Dec 2023 05:29:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702013384; x=1733549384;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=urdPA+R63tnU8OOWnFP6T/9xxea/kICePc7cU1Iv+AA=;
 b=XeB57TcO8uz5oFpA3Re7C5p1z04odiZes+d2+Oz/A3nPMExqnlAQdYyt
 uMCxX9Ts0guf+4Ma7VkrtFfHr9St3lZfk0awzXacOwmH7dFJx0nd+zSqZ
 b3pqDaosP6l9NQ6cNJvFbaZYCtZt4bSA3+yQmHEeC2qQVQqVkNXCS/xMI
 IPpL8PCsoRlD2aVAph3NBNuoerIZb9aB9ByshCb8fQpOkse7sIQshprRo
 zIJIleXA1olBx3m5E50yYb244quAEB2vWi0aX1SUyDEuJMu2W1J0ji5J9
 GGCn2LENcyIxtf6SQ57SErncA5pbYko2DvOVpZGdxxQ6tLHCoo1bypa+p Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="373859396"
X-IronPort-AV: E=Sophos;i="6.04,259,1695711600"; d="scan'208";a="373859396"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 21:29:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="915828989"
X-IronPort-AV: E=Sophos;i="6.04,259,1695711600"; d="scan'208";a="915828989"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Dec 2023 21:29:44 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 7 Dec 2023 21:29:43 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 7 Dec 2023 21:29:43 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 7 Dec 2023 21:29:43 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 7 Dec 2023 21:29:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k+4IuXja0ofQXpyqYnn+7FFrADMZrlXM7IWY0yj7AcWmTN5Oz+2xy1QAzaJ3W5Yxmk5N0IMnBL8UJ+R4kvWaB+IYx31NBKFS96wyTs7r9O9Z1fzD0ar0zCCPxXDZdpzyblJZa9f6AMh187vrDwbai9W9jCWUfRTtXj5/Badiw4xkyVv+4MdeJSMf6X/X7Dd/+gkmwgCCUUyQLei1l52Aep8VLHHm5/ts2b+Hf+tLznPK2hrk+lzUmaLD2iunDFfDexYDUKAqUTVt6rUBwiOtK5kteQGWP6Fouahi6NDkPuq9xZ6wMuSgigPmWWtBCCfsagXIf7yTVdYBqr2JO8e5Dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NtMOfpAyrLLJ91hUnFkvXHY1YnIqT/BKbmflv0msf6k=;
 b=oLvT2vQT5fHceAsa72v9NzZi6NFmi1dumt1sOf40o5KpFuceWjneK28BgLmo4X9QMYkkhQyQ3+Wv6uWidwrG2W/jUIlhfXB87GQkJdSfitgmqD4YRksJK50z4AlbzqguHl3W20p2+mT0JoDuTPi0AqWnWXdLIacKlUK4H8vnq17iWU48UTgMxD3UFAQWx1kwfbZr/m5lN5HToUVsRIlEjcQCcx5ULnxTzawuwWiA/RDJRL/14GfH75700aLCwxKDtuzaZdJi3KjstWnokLj/hzrQxjHVavyUi5FqwXJx0xvWhFidT2wzyOWg2GF0aS8iBeyfjWD31U8r//KVMR9G9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH8PR11MB6830.namprd11.prod.outlook.com (2603:10b6:510:22e::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.27; Fri, 8 Dec
 2023 05:29:35 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.7068.027; Fri, 8 Dec 2023
 05:29:35 +0000
Date: Fri, 8 Dec 2023 00:29:31 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
Subject: Re: [Intel-xe] [PATCH 1/3] drm/xe: Change the name of frequency
 sysfs attributes
Message-ID: <ZXKpu6TIp9DOsDYk@intel.com>
References: <20231205213659.179813-1-rodrigo.vivi@intel.com>
 <046df246-d29f-4551-9df0-fcf8aa4502a9@intel.com>
 <ZXKf0yVaESLeQ3eB@intel.com>
 <b06a5dc2-3389-4473-8e24-aeea89700268@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <b06a5dc2-3389-4473-8e24-aeea89700268@intel.com>
X-ClientProxiedBy: SJ0PR03CA0226.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::21) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH8PR11MB6830:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e4720a0-72c1-4363-ec26-08dbf7aeaa2e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /MHDOyCAue4efpNj75L9QHPipMe+f1l2XRytzoMFucSUTYMo4css5kep+YBCr57O5bE6DRJhh6kdubGbB8rK6j8HH5ZSLT4ELtDKyapQTaZsc6LfSsXRiXOSHPD5t/0l2OQRk55G7AvMscbcc+tGZN633nXXtzAqKU6zNvOE9XVeFUN7rJSkspOn2FTY+bmvIIJkzpLEA1Wl5Wjuxas1zUd8EhphQeX58rDGzSzrYkWQr1FyeQ/ch+NkmSb5+/RiZBVHqTt6UluPXz+HX4iXss2cMcsbizPEuqxHGJauousJ5TOy6w68xcKOcXslCbzUWIJhnqp1r3imH7PZtHv+eg1/mkWZcQ3GI+dIVzmGCSUWY30VjvmCrpKtfgHOziVfdEj5giHgFg4/6MtJ9TZoUkm1/vRbyPZSeTbrfLG1Kw3FxhvBrNo/gcnMiGNmb3c1+TculhiW6vvmR8F85JfCZKvCe7RpvfSETOFnJIiAAmyIl8DE1wWx1IQ7U8+yfuPdFGcGrNiBiBC4IFEiKYMk5aQPgF45E9TeqKxoVP0/UZ6LwQ8kRiIzYMTtOuUrMbu/
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(396003)(376002)(39860400002)(346002)(366004)(230922051799003)(186009)(64100799003)(1800799012)(451199024)(5660300002)(6636002)(2906002)(41300700001)(38100700002)(66556008)(82960400001)(37006003)(66946007)(26005)(86362001)(6512007)(478600001)(6666004)(2616005)(66476007)(53546011)(6506007)(8936002)(83380400001)(6486002)(44832011)(8676002)(6862004)(4326008)(316002)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8J+uQlGSAiI8IKSEEaHOCCellAEOt/9f1TuWoWk3Sg3j9K63lEWProXqGJLn?=
 =?us-ascii?Q?8b0/WS9qXBFPsg5r/YoE9mxD6+XceLY2sKggiBSv5KUm5LvWe8pl8ti/9niV?=
 =?us-ascii?Q?NyMf5l9eR1pJt+s9dKz96oZUni1eAmLOr2k1YEyMhI76p7ScMjqLTGKd6rfb?=
 =?us-ascii?Q?01ZBIrqjnZvC0dmXlIgsF5rZqZGE88XNG3iznBYD7SReLXnAYSMDmvU0Ly+p?=
 =?us-ascii?Q?52s2RIgMcGhHSb4H+FOkwaR5m0EK7WdNbgwu05jis72Hd2rxRnnsfo7/V/WS?=
 =?us-ascii?Q?HgjuwQLNu9MMXvUUcFlQIr7Tr3qZNS0LtDnEqWWGj7v3EZ/h24KzC20FUMY/?=
 =?us-ascii?Q?IB2OGpve9Vlzw72pbP2DlOUYRJ/geO1ka2HU3ZtqUSXRPG4HmorfUfZAJxO1?=
 =?us-ascii?Q?3wN8WgY73bSjQsEX5VbQY1FBGPyGeh0i5/fgff8j6miNqwJaJ/TaznDF2B5U?=
 =?us-ascii?Q?LGmj1+mkAdfEzg4avwdEzadlF78iEeGiZXTSYWWPjv75DMUs6zg2PjDNEqwN?=
 =?us-ascii?Q?QIYx2B1lmo5FWJOrMZnAWRStnmJ7Z+QnErsdq0HRNHkA5McNL1kDkFhU+PTJ?=
 =?us-ascii?Q?39YqjhLYHkv4SnxTezMXLnJotZy9Wwr7/5tY0AegtscFQT3ocOqRTSygJZob?=
 =?us-ascii?Q?BKXiLV6PrL3bOkF4rA4oh2fOEEKiQQmoHeKjBc7f6ihLySrNNjprJOt4puva?=
 =?us-ascii?Q?19OO6DrPsjbSxsuhdsPmvxjXPHI62WRUReqDcLjtrMOh7MqIvKL3QQYn4aZg?=
 =?us-ascii?Q?Dm7FNCL6dNeoJoU6yXUXIhQxdPebQrMAvEhBGjmoDWZreI8FXrOMY9XetBsI?=
 =?us-ascii?Q?wbPPKUOTA/5a0xDbAGOZFhqaxMibOq/xDeQ8KSb9x3fRY+ODrYOGYJZmdQxz?=
 =?us-ascii?Q?mOvbcisvXNDjcvnsSfTI16xl8zc1OjbOjy1X3h8njpe5wdFWsjp9iukkwDjD?=
 =?us-ascii?Q?v+KdtiDV1Yo67/UWUacdcuEhZnbPZ2UAli4UNjWZhNdMRp4ciP2KCKkTHcrJ?=
 =?us-ascii?Q?t0SSTFIbYwVpTHubrSUf9hyRznIau4/y44kGNgaYr59eSFFSy9kJP0PHEVP4?=
 =?us-ascii?Q?17aL3ui0w/ZBSQ8O8XUXD5ts2Uq1lF3DC/J3HICCRl82ylrnk7BsOOuAmNo7?=
 =?us-ascii?Q?dpA4DG4YgB4titgDePuqW+w/xNIuAj3Q85T04Lg3LAbW6TGUCPpZsRMZf8Z3?=
 =?us-ascii?Q?enXQQAq5V6KqywlzHA7oSrs7T/fVCCASbXK6AvnvL301hGw+uEE3yUvV6e5T?=
 =?us-ascii?Q?un+99d7IPVnLo9HrEdbIdkMB0WHYNdUfmxIL6VgzhEjqFb4oewZ892KML0QX?=
 =?us-ascii?Q?bjtHRa6MLjkTNJKv/LKOd7Ou9s2AHb+/JKOI2FmLH6NfzR2WcOqJlMhEBdrH?=
 =?us-ascii?Q?1QNda93SUu0hgHQjFX3ziNSz+Uzg5KMJxGsXEonUOVwgBp/g0kOogRyIrYFd?=
 =?us-ascii?Q?2luqqlWt5E8+FnO4acIyjofOdG3b3SSeliv6c7/Ad+XW+75xW50TU9LBbRXg?=
 =?us-ascii?Q?FfaGq2zy5XKbFgWusBawfh0U6o7qayvveML5RqkEYf2xxCsc0xNKhjS1Yozl?=
 =?us-ascii?Q?tifwvv48oO0nfKN4vUFqQveft6+XLkCoOxa0GWZT5yLZ/Y/W5QQYfixPVpPS?=
 =?us-ascii?Q?0w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e4720a0-72c1-4363-ec26-08dbf7aeaa2e
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2023 05:29:35.6316 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TVF+UAJEWCn77nR/oUJhoMcL+t69PwvZr6XsG72V/6yqX88lJJG8zAY1cYtgDbuZ90VpumZxSK3Y1y48N0+XHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6830
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
Cc: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>,
 intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Dec 08, 2023 at 10:45:01AM +0530, Riana Tauro wrote:
> 
> 
> On 12/8/2023 10:17 AM, Rodrigo Vivi wrote:
> > On Thu, Dec 07, 2023 at 11:04:04AM +0530, Riana Tauro wrote:
> > > Hi Rodrigo/Suja
> > > 
> > > These changes are removed again in the second patch.
> > 
> > What? they are not. The final result is something_freq.
> 
> The changes made in the guc_pc in this patch are removed and function name
> changed to be called from the freq sysfs layer in the next patch.
> 
> 
> -static ssize_t cur_freq_show(struct device *dev,
> -			     struct device_attribute *attr, char *buf)
> +/**
> + * xe_guc_pc_get_cur_freq - Get Current requested frequency

but without the patch the name of this function would probably
be xe_guc_pc_get_freq_cur
or xe_guc_pc_freq_cur_get

> 
> 
> The next patch changes the name as well. So it is aligning to devfreq.

okay, I see your angle: that all the renaming could be done
in a single patch...
but to be honest I prefer to keep this one here since it was a good base
and separate... also had a separate igt simple patch.

> 
> > 
> > The next patch is based on this.
> > 
> > > Is this patch required?
> > 
> > and both are required if we want to be prepared for a
> > possible alignment with devfreq.
> > 
> > > 
> > > Thanks
> > > Riana
> > > 
> > > On 12/6/2023 3:06 AM, Rodrigo Vivi wrote:
> > > > From: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
> > > > 
> > > > Switching the names of frequency sysfs attrbutes to align with
> > > > required devfreq changes. The name changes are as below;
> > > > 
> > > > -freq_act -> act_freq
> > > > -freq_cur -> cur_freq
> > > > -freq_rpn -> rpn_freq
> > > > -freq_rpe -> rpe_freq
> > > > -freq_rp0 -> rp0_freq
> > > > -freq_min -> min_freq
> > > > -freq_max -> max_freq
> > > > 
> > > > Signed-off-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
> > > > Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > > ---
> > > >    drivers/gpu/drm/xe/xe_guc_pc.c | 60 +++++++++++++++++-----------------
> > > >    1 file changed, 30 insertions(+), 30 deletions(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
> > > > index d2605a684b1c..b1876fbea669 100644
> > > > --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> > > > +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
> > > > @@ -60,15 +60,15 @@
> > > >     * Xe's GuC PC provides a sysfs API for frequency management:
> > > >     *
> > > >     * device/gt#/freq_* *read-only* files:
> > > > - * - freq_act: The actual resolved frequency decided by PCODE.
> > > > - * - freq_cur: The current one requested by GuC PC to the Hardware.
> > > > - * - freq_rpn: The Render Performance (RP) N level, which is the minimal one.
> > > > - * - freq_rpe: The Render Performance (RP) E level, which is the efficient one.
> > > > - * - freq_rp0: The Render Performance (RP) 0 level, which is the maximum one.
> > > > + * - act_freq: The actual resolved frequency decided by PCODE.
> > > > + * - cur_freq: The current one requested by GuC PC to the Hardware.
> > > > + * - rpn_freq: The Render Performance (RP) N level, which is the minimal one.
> > > > + * - rpe_freq: The Render Performance (RP) E level, which is the efficient one.
> > > > + * - rp0_freq: The Render Performance (RP) 0 level, which is the maximum one.
> > > >     *
> > > >     * device/gt#/freq_* *read-write* files:
> > > > - * - freq_min: GuC PC min request.
> > > > - * - freq_max: GuC PC max request.
> > > > + * - min_freq: GuC PC min request.
> > > > + * - max_freq: GuC PC max request.
> > > >     *             If max <= min, then freq_min becomes a fixed frequency request.
> > > >     *
> > > >     * Render-C States:
> > > > @@ -388,7 +388,7 @@ static void pc_update_rp_values(struct xe_guc_pc *pc)
> > > >    	pc->rpn_freq = min(pc->rpn_freq, pc->rpe_freq);
> > > >    }
> > > > -static ssize_t freq_act_show(struct device *dev,
> > > > +static ssize_t act_freq_show(struct device *dev,
> > > >    			     struct device_attribute *attr, char *buf)
> > > >    {
> > > >    	struct kobject *kobj = &dev->kobj;
> > > > @@ -413,9 +413,9 @@ static ssize_t freq_act_show(struct device *dev,
> > > >    	xe_device_mem_access_put(gt_to_xe(gt));
> > > >    	return ret;
> > > >    }
> > > > -static DEVICE_ATTR_RO(freq_act);
> > > > +static DEVICE_ATTR_RO(act_freq);
> > > > -static ssize_t freq_cur_show(struct device *dev,
> > > > +static ssize_t cur_freq_show(struct device *dev,
> > > >    			     struct device_attribute *attr, char *buf)
> > > >    {
> > > >    	struct kobject *kobj = &dev->kobj;
> > > > @@ -442,18 +442,18 @@ static ssize_t freq_cur_show(struct device *dev,
> > > >    	xe_device_mem_access_put(gt_to_xe(gt));
> > > >    	return ret;
> > > >    }
> > > > -static DEVICE_ATTR_RO(freq_cur);
> > > > +static DEVICE_ATTR_RO(cur_freq);
> > > > -static ssize_t freq_rp0_show(struct device *dev,
> > > > +static ssize_t rp0_freq_show(struct device *dev,
> > > >    			     struct device_attribute *attr, char *buf)
> > > >    {
> > > >    	struct xe_guc_pc *pc = dev_to_pc(dev);
> > > >    	return sysfs_emit(buf, "%d\n", pc->rp0_freq);
> > > >    }
> > > > -static DEVICE_ATTR_RO(freq_rp0);
> > > > +static DEVICE_ATTR_RO(rp0_freq);
> > > > -static ssize_t freq_rpe_show(struct device *dev,
> > > > +static ssize_t rpe_freq_show(struct device *dev,
> > > >    			     struct device_attribute *attr, char *buf)
> > > >    {
> > > >    	struct xe_guc_pc *pc = dev_to_pc(dev);
> > > > @@ -465,18 +465,18 @@ static ssize_t freq_rpe_show(struct device *dev,
> > > >    	xe_device_mem_access_put(xe);
> > > >    	return sysfs_emit(buf, "%d\n", pc->rpe_freq);
> > > >    }
> > > > -static DEVICE_ATTR_RO(freq_rpe);
> > > > +static DEVICE_ATTR_RO(rpe_freq);
> > > > -static ssize_t freq_rpn_show(struct device *dev,
> > > > +static ssize_t rpn_freq_show(struct device *dev,
> > > >    			     struct device_attribute *attr, char *buf)
> > > >    {
> > > >    	struct xe_guc_pc *pc = dev_to_pc(dev);
> > > >    	return sysfs_emit(buf, "%d\n", pc->rpn_freq);
> > > >    }
> > > > -static DEVICE_ATTR_RO(freq_rpn);
> > > > +static DEVICE_ATTR_RO(rpn_freq);
> > > > -static ssize_t freq_min_show(struct device *dev,
> > > > +static ssize_t min_freq_show(struct device *dev,
> > > >    			     struct device_attribute *attr, char *buf)
> > > >    {
> > > >    	struct xe_guc_pc *pc = dev_to_pc(dev);
> > > > @@ -513,7 +513,7 @@ static ssize_t freq_min_show(struct device *dev,
> > > >    	return ret;
> > > >    }
> > > > -static ssize_t freq_min_store(struct device *dev, struct device_attribute *attr,
> > > > +static ssize_t min_freq_store(struct device *dev, struct device_attribute *attr,
> > > >    			      const char *buff, size_t count)
> > > >    {
> > > >    	struct xe_guc_pc *pc = dev_to_pc(dev);
> > > > @@ -543,9 +543,9 @@ static ssize_t freq_min_store(struct device *dev, struct device_attribute *attr,
> > > >    	xe_device_mem_access_put(pc_to_xe(pc));
> > > >    	return ret ?: count;
> > > >    }
> > > > -static DEVICE_ATTR_RW(freq_min);
> > > > +static DEVICE_ATTR_RW(min_freq);
> > > > -static ssize_t freq_max_show(struct device *dev,
> > > > +static ssize_t max_freq_show(struct device *dev,
> > > >    			     struct device_attribute *attr, char *buf)
> > > >    {
> > > >    	struct xe_guc_pc *pc = dev_to_pc(dev);
> > > > @@ -571,7 +571,7 @@ static ssize_t freq_max_show(struct device *dev,
> > > >    	return ret;
> > > >    }
> > > > -static ssize_t freq_max_store(struct device *dev, struct device_attribute *attr,
> > > > +static ssize_t max_freq_store(struct device *dev, struct device_attribute *attr,
> > > >    			      const char *buff, size_t count)
> > > >    {
> > > >    	struct xe_guc_pc *pc = dev_to_pc(dev);
> > > > @@ -601,7 +601,7 @@ static ssize_t freq_max_store(struct device *dev, struct device_attribute *attr,
> > > >    	xe_device_mem_access_put(pc_to_xe(pc));
> > > >    	return ret ?: count;
> > > >    }
> > > > -static DEVICE_ATTR_RW(freq_max);
> > > > +static DEVICE_ATTR_RW(max_freq);
> > > >    /**
> > > >     * xe_guc_pc_c_status - get the current GT C state
> > > > @@ -667,13 +667,13 @@ u64 xe_guc_pc_mc6_residency(struct xe_guc_pc *pc)
> > > >    }
> > > >    static const struct attribute *pc_attrs[] = {
> > > > -	&dev_attr_freq_act.attr,
> > > > -	&dev_attr_freq_cur.attr,
> > > > -	&dev_attr_freq_rp0.attr,
> > > > -	&dev_attr_freq_rpe.attr,
> > > > -	&dev_attr_freq_rpn.attr,
> > > > -	&dev_attr_freq_min.attr,
> > > > -	&dev_attr_freq_max.attr,
> > > > +	&dev_attr_act_freq.attr,
> > > > +	&dev_attr_cur_freq.attr,
> > > > +	&dev_attr_rp0_freq.attr,
> > > > +	&dev_attr_rpe_freq.attr,
> > > > +	&dev_attr_rpn_freq.attr,
> > > > +	&dev_attr_min_freq.attr,
> > > > +	&dev_attr_max_freq.attr,
> > > >    	NULL
> > > >    };
