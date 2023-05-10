Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34E22C77B7C
	for <intel-xe@archiver.kernel.org>; Wed, 10 May 2023 00:30:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C126710E054;
	Wed, 10 May 2023 00:30:26 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6889510E054
 for <intel-xe@lists.freedesktop.org>; Wed, 10 May 2023 00:30:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683678625; x=1715214625;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=DV3ZJRnMnaHTA1giLfvvxy6hT/nZLU8kVtfdeKveYko=;
 b=DuzphDLIYESQJA+kI8fXIA8YE1GTy0RXf1i69XInKDdBj3wVOM25IoZ9
 JmSECCI3AklpVB4IkLQWYu1YO4+FJfgOSzQT6iirbia/kakRpWrxpKQP3
 MuWCAdJ29+ZSeCji75Mp3mX4EQ7xAeC8aNBSELcrtWNCIs6b58wZfGptZ
 SKqXfnf90+al1X7xZDRRmgUdA/69yY/QrNAzcDSZZRp5HxSwqFBL2OZXs
 8cujg0ZUbQ67Mt5jYJZGRgC1J1IwoTlyouwHnR3VU3ve2SdFdryBZx5vv
 nyOkiG2wyBTtSxNFkz+6Dx+ifprAYPOxriZkljnWx02KYgOIs3cy0cJB8 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="334551092"
X-IronPort-AV: E=Sophos;i="5.99,263,1677571200"; d="scan'208";a="334551092"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2023 17:30:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="873386658"
X-IronPort-AV: E=Sophos;i="5.99,263,1677571200"; d="scan'208";a="873386658"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga005.jf.intel.com with ESMTP; 09 May 2023 17:30:23 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 9 May 2023 17:30:23 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 9 May 2023 17:30:23 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.175)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 9 May 2023 17:30:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pqlj7HmQwyLx/YY3f19C/TFzEDzM0Pg8K0yz8KcDAfgyb+S8zOvzn5XNxIIUI0rxyEX0tjD5Ka63iZMr5g3fME8lEf8J/UA6c5UOcnCrgQFuGHEZEU9CsGJuRwJqq9L7myQ+OCNK702szJrf2/VvY7lfroec3QOAl9063B3PIcKWMvWoiqFYIg3bQFLNth3agZgsFFYDp4oLpFDQ+Rf5sEwIR1J+RHCiB/9jRSfSgHEZ1mpW9PtxyQFfoseuk0g8hJhEpHxmULzArkbUAYc7EDRLARCxeHqCozsxNTlXED0Bq4oXpZT5FOPMBo5NejBRgFsDd4nSi3YiB3qjf13qPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dghfQl8u1hl473PHTSiEfZxc0Io09oGHSAylkl0E9n0=;
 b=Pbzqn/uqtIyEs3dk9pTiYd4B65b0hq0aAo3/92mysguT2NnJRODSjvYoANv8DV58PoNlv6hN1CyWW/ubvInJkSpB1+Y9LoU6pW8YtlEinIipMe41xnWcdy0aIJq6YztcwU4d21J5dBHdyp2Mmctl+sJPl92OAS2EpKJSaxZeiVLdw4K1BkRo/jwYthAap425gymNu9np+az2ms435QBVWVa4AezArO8ZgXHUyNOAPg3RfYk6BYt9SpY397dRZYadSDEUeMea3E1lN2z5dKED1wit3Z8+Wj80y80VesjH6A7M0DAa9xXiF502vCPx2dSpOi4n+Cv/l1UYVmaFno39SQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM4PR11MB5993.namprd11.prod.outlook.com (2603:10b6:8:5c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.33; Wed, 10 May
 2023 00:30:20 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e%4]) with mapi id 15.20.6363.032; Wed, 10 May 2023
 00:30:20 +0000
Date: Wed, 10 May 2023 00:29:44 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Message-ID: <ZFrleEdcuXB4mH/n@DUT025-TGLU.fm.intel.com>
References: <20230502001727.3211096-1-matthew.brost@intel.com>
 <20230502001727.3211096-14-matthew.brost@intel.com>
 <f5c99897-c577-eb39-b6c0-d46e00832b40@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f5c99897-c577-eb39-b6c0-d46e00832b40@linux.intel.com>
X-ClientProxiedBy: BYAPR02CA0069.namprd02.prod.outlook.com
 (2603:10b6:a03:54::46) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM4PR11MB5993:EE_
X-MS-Office365-Filtering-Correlation-Id: 04e6f988-4a72-448b-f656-08db50edbc36
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cu7NYry5dV19vzwZWFlZlgR9fLdOALgs7UYjQKkbClqx7f1VuMl9xVC4ZK18pX4Xea5oGYrvw4De2GfbQI3jXhQwzHjDyS6Cb0Hu5jBL8bszbiByL/FVe4Heq/fGk1il/rbiQC3/xAVbuTYwGLCk9xlsyVywFCEJTqJ4jfg3+/4jQmeH6qX2sr+OUBzmV+brtO2qHuFx0UADNaBhTZATdSpsFR+w+NN5nxsufCf7c5pvANiUJRAZ1rSZFP2SrGq9hb3VIrXEcNkYVbyHopaNaIPktbOeBMmfB+sEbv8+7diC33aImU6hEpbe9PCHkNeDSQGiKPE3eh2BDOBAFm1HT47xA4OkA7bftPPJKM2yTEk4QkJxktL6wHrrdwl+uojWnYPtYU4NHKWxIuKedstTFdDBCkUfNLDLNIrJGNojR6RbRH5VucUdIMK8s190jtuREKlAn7uueluLi/zYRFwB9wzGC+PAjRbJOUPKTia6sv6ctVDVn7jqssEKM1xDrxGk7Mw1OhUgVGWJUM15tmJxFw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(396003)(366004)(376002)(136003)(346002)(451199021)(83380400001)(66946007)(66556008)(66476007)(6916009)(4326008)(5660300002)(86362001)(478600001)(82960400001)(316002)(44832011)(966005)(38100700002)(26005)(6506007)(53546011)(6512007)(8936002)(8676002)(6486002)(2906002)(6666004)(41300700001)(186003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?SdzkEgPxN+11V5bU7IE3gM7w3dMYtE2HsrcZx5MrQhGZHobL0dSo4oU6su?=
 =?iso-8859-1?Q?S9x/rpALq3Yl/5aUwpE+mTH8KAmFQSWJPz1dyrCZlY2QbEYyU41nHjsOxd?=
 =?iso-8859-1?Q?2fau7fdkdQlUM/DCFcySMonzkcOrW0HeWdEF2JYlrVnoVu3G2y4Twgsxk4?=
 =?iso-8859-1?Q?P/Gn19+cPe8eduIjdyMax8e/VXMBQxhjhpi0WZg8RdQje/9t4CvcwZpXhP?=
 =?iso-8859-1?Q?B+/ZP9JU9AwG0audVuW/wPY1r3eKy2Y9uo5rr3mkZsnupfUH5k9qQRa0Zy?=
 =?iso-8859-1?Q?DuSdqD3vQ13JxF5rZNEMs4g/e0IRXgo8C+NoE/ScEWpyW5ykTmGwLGZfZO?=
 =?iso-8859-1?Q?4V4PUrGdGBVLEjCz+yhxezCn0w3wjwygnkmOJ5zF5tiWMUaFeaid7Cb7MD?=
 =?iso-8859-1?Q?Z8P+uLJt5TUUWbWxBr4KzUsYZY7tRMF3LmtiCmdgvM4g3q8tYAZ2dKpV0A?=
 =?iso-8859-1?Q?WeB/sfYGPUA36hTopBKaGQLlvNQmaIL8UC7odAtiDc43UIxfPTwDGV/gmd?=
 =?iso-8859-1?Q?p6Hj5/5y1hg8CuZTKb8v9C8KCwjMrSWLaSCRkaGlQNDK9VxZxJwIdEFE6a?=
 =?iso-8859-1?Q?TL3Uxkr4FXp9+UOCK97n+KvQxKikeLJyQBZ1oA9MYOZTTQs76dkHlizoHW?=
 =?iso-8859-1?Q?3JPZMeBQL3K9H04FARuV48QHFk7nJUUF4XhDLhXm9iCHn4sdersvGEIAFW?=
 =?iso-8859-1?Q?QNgvgTe7SicUuyvubBePbG7ilz0DVrBwDDWFXgGsRQKhIBJUuhLXKMaEvK?=
 =?iso-8859-1?Q?Roqb1mC/tuNdz63ldmwcQXahGKSyLK3lpPBjO1wkVTmMT5Y02lUYovNK7Q?=
 =?iso-8859-1?Q?TsDXdP3nqbVFsZX3vvfUT/wE4/WK8hBk6Sg80oj4nQfHkanWaDtGzvOaIR?=
 =?iso-8859-1?Q?NThRfxIUTmipVMIOhO18bQsdjTr2/N3iPFQmbyf1njrUWtK5VEx3K9GTnc?=
 =?iso-8859-1?Q?IfyT48alRIe1xjeiwbInXbqKVP2xmgnKS19Zqw4sk+socJVYHBW/BnIkDd?=
 =?iso-8859-1?Q?sNQc7jpHfYuv4G3MWFV5BrlEeejsJJicEyEwFPmmgY0p9fOpX0udrCVuw0?=
 =?iso-8859-1?Q?mjrapYVTLQmqhB5lSaZr1nBELeraXzQ6YQcumo3PQiEpJizU98lD35eu6W?=
 =?iso-8859-1?Q?0dQglim6piQj7Zdy9cMavKKj19GAMQa4VPhoL83chS2aRn9uH7Emr2327f?=
 =?iso-8859-1?Q?tLkz9awNOdMBiVyhYi7uT/E7Zypz4aunRCnVaOO8ImMFEu17UX/9iJoMhm?=
 =?iso-8859-1?Q?brMk3v0ih7rIfgeReH3oTbzKCPo44GIbuYQ7/bx5nG163SajYtgYWcnIgp?=
 =?iso-8859-1?Q?22HipGXjLfsDrhfbIifHnRD7xI/ulKo6ng+G6Oklv9r0nsGxaZZTEcFQTo?=
 =?iso-8859-1?Q?0y+8tbg1S7/AODbbNPqf8oLJHRe3PEZvPiDclOkAFJ/Ob/WhSc5XTiLC9X?=
 =?iso-8859-1?Q?+qzILlaX8uMxVRMp7jLia5cGs2oaxJGqYHK5DU40MV/l6aIypfG6xrEGio?=
 =?iso-8859-1?Q?06j7VdYxa8MTzuugOt2oinCpyaE1qhGIF67Peak4ipnlV/15mbBCDxTUOB?=
 =?iso-8859-1?Q?mzIca+hg1XZqA74CcSpBZUM5aZMHWRmTua786pU3TILUKYDZyXMUysL0eu?=
 =?iso-8859-1?Q?KV0icrX2gdLXj9NBgtTH/yBHabGLKwLRQRZWGOOTDZcrI6cUv1E4WPiw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 04e6f988-4a72-448b-f656-08db50edbc36
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2023 00:30:20.1376 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Or5pZJgOt3HCogeMU4I4EuOlZmiHrKWWKQLZEfMJ4CP28uoPSThZLcVvrt0HHHmaEBFGQhqLMslsemXu4PY7vg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5993
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 13/31] maple_tree: split up MA_STATE()
 macro
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
Cc: Danilo Krummrich <dakr@redhat.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, May 09, 2023 at 03:21:56PM +0200, Thomas Hellström wrote:
> 
> On 5/2/23 02:17, Matthew Brost wrote:
> > From: Danilo Krummrich <dakr@redhat.com>
> > 
> > Split up the MA_STATE() macro such that components using the maple tree
> > can easily inherit from struct ma_state and build custom tree walk
> > macros to hide their internals from users.
> 
> I might misunderstand the patch, but isn't the real purpose to provide an
> MA_STATE initializer,and the way to achieve that is to split up the MA_STATE
> macro?
> 

This patch isn't mine and on dri-devel. Can you put your comments there?
https://patchwork.freedesktop.org/patch/530673/?series=112994&rev=4

Matt

> > 
> > Example:
> > 
> > struct sample_iterator {
> >          struct ma_state mas;
> >          struct sample_mgr *mgr;
> > };
> > 
> > \#define SAMPLE_ITERATOR(name, __mgr, start)                    \
> >          struct sample_iterator name = {                         \
> >                  .mas = MA_STATE_INIT(&(__mgr)->mt, start, 0),   \
> >                  .mgr = __mgr,                                   \
> >          }
> > 
> > \#define sample_iter_for_each_range(it__, entry__, end__) \
> >          mas_for_each(&(it__).mas, entry__, end__)
> > 
> > --
> > 
> > struct sample *sample;
> > SAMPLE_ITERATOR(si, min);
> > 
> > sample_iter_for_each_range(&si, sample, max) {
> >          frob(mgr, sample);
> > }
> > 
> > Signed-off-by: Danilo Krummrich <dakr@redhat.com>
> > ---
> >   include/linux/maple_tree.h | 7 +++++--
> >   1 file changed, 5 insertions(+), 2 deletions(-)
> > 
> > diff --git a/include/linux/maple_tree.h b/include/linux/maple_tree.h
> > index 1fadb5f5978b..87d55334f1c2 100644
> > --- a/include/linux/maple_tree.h
> > +++ b/include/linux/maple_tree.h
> > @@ -423,8 +423,8 @@ struct ma_wr_state {
> >   #define MA_ERROR(err) \
> >   		((struct maple_enode *)(((unsigned long)err << 2) | 2UL))
> > -#define MA_STATE(name, mt, first, end)					\
> > -	struct ma_state name = {					\
> > +#define MA_STATE_INIT(mt, first, end)					\
> > +	{								\
> 
> Naming: following the convention in, for example, the mutex and ww mutex
> code this should've been called
> 
> __MA_STATE_INITIALIZER(),
> 
> whereas the decapitalized name ma_state_init() would've been a (possibly
> inline) init function if it existed.
> 
> But this all should ofc be run by the maple tree maintainer(s).
> 
> FWIW, with these things addressed the change LGTM.
> 
> /Thomas
> 
> 
> >   		.tree = mt,						\
> >   		.index = first,						\
> >   		.last = end,						\
> > @@ -435,6 +435,9 @@ struct ma_wr_state {
> >   		.mas_flags = 0,						\
> >   	}
> > +#define MA_STATE(name, mt, first, end)					\
> > +	struct ma_state name = MA_STATE_INIT(mt, first, end)
> > +
> >   #define MA_WR_STATE(name, ma_state, wr_entry)				\
> >   	struct ma_wr_state name = {					\
> >   		.mas = ma_state,					\
