Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F36FEB64D9
	for <intel-xe@archiver.kernel.org>; Fri,  7 Jul 2023 05:46:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8D7910E505;
	Fri,  7 Jul 2023 05:46:30 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47F0610E505
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Jul 2023 05:46:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688708788; x=1720244788;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=TbqX1rDL4KnRmJ6M1BCev4tlOjbvfxiGcTRTDl2NTVc=;
 b=YnmPQQp5Ex3avHnsXjHCwKExHCYjGdd4LOzbLSfYbp/9wQVFyG5KHXgf
 HUntoJbnyMg1bJJJPgwcii/ZSB3K8trpyhqhh3OZ4dhZCLMDEfuTZbHKL
 NHGdtWrFj6n6ucjVADSgQqG/5eM1w67PUOIbSCzZhbw/yInhf2nIQTd28
 7h5gGtgz5q/zoutjz5YTUZe7WU+yg6ljSY0qcc6IK7v3zIvJzSfqCDRwi
 nO/3iPxjUA7Yy1O9DhDigyFsZdDdTMYnjvNmp87Wwqld4u8jLz/th5dG7
 2sZWohedkk30h0j6OxEgotC4Rn5pWe2oe8GtbIbgbFcAlNd7C5ivE+zSX Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10763"; a="450166610"
X-IronPort-AV: E=Sophos;i="6.01,187,1684825200"; d="scan'208";a="450166610"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2023 22:46:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10763"; a="843983077"
X-IronPort-AV: E=Sophos;i="6.01,187,1684825200"; d="scan'208";a="843983077"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga004.jf.intel.com with ESMTP; 06 Jul 2023 22:46:26 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 6 Jul 2023 22:46:26 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 6 Jul 2023 22:46:25 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 6 Jul 2023 22:46:25 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.106)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 6 Jul 2023 22:46:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mfbJErgPub0Z8hJlguY4V9RE3FofLIJqWDpzbig50E0Vs4PKRrqUC7jtfsUwOPQg7roh5c6nry0LqRw46z7AYRloG8zV/MsNoWGj6BNMUQaR/S6gmRrx3sULpZKIdnen2qXSe3hxkzXBYZdSY/es6ZgbpJWxlOzv6fm0JHx2Jh29segsjDXo+VNM1wcHFwaUnLR3kEqFtAvFesrPT5sXy4fjGRdgSqz/lyZ5lQoazoUMaSfvekDVFM5nz1A6+4eQbGHq75aLpsR2VijMO6LrXk1RxbjW8FSN8iQ3DESfMIDoCnZQLpd/vJGCMydtCUfWTnnKmELAWCFOR9PeqSe6Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4ikB+AUXRe6ahFtJOHUtll40tsVCeCHJeeDz2DTAPNs=;
 b=WdCkYAt3vfrJZnDb+Uw04iaVTe5KjVMxPwxxDJzbsbVuHHg7W0WoDlmFgc80jGQJ83UBpR2KvKLJdCKTvrKynd8gqvlxzgaHBixICPxc7HgT41ngjX4/rZKlujf8hTxoDybbJUN6+h+5QGE0B8F7lSAXXMs2DEyy2AgL+b1pup6uIZZlLr9lXezmc6VuvqFOp4RNZC868Y45Swk9YT9Q4mOCqEBeFeuVGI2Up/LVyKNTONrPgRS25zqWoOSxYgCNortgZzP/agxWZQqiv2mI4VihSh6T+Uinjac99N3TKjMa31cpb3TeIyuzM5eaZFbiPNWK9xbuqKDuoEHe5XXwsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS0PR11MB8232.namprd11.prod.outlook.com (2603:10b6:8:15d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Fri, 7 Jul
 2023 05:46:24 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::c65d:c846:f197:3ca5]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::c65d:c846:f197:3ca5%4]) with mapi id 15.20.6565.019; Fri, 7 Jul 2023
 05:46:24 +0000
Date: Fri, 7 Jul 2023 05:45:42 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Message-ID: <ZKemhnYQ1l8otNkk@DUT025-TGLU.fm.intel.com>
References: <20230630175804.1096370-1-matthew.brost@intel.com>
 <20230630175804.1096370-4-matthew.brost@intel.com>
 <de460f03-453f-28bf-69d2-af9c143216b2@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <de460f03-453f-28bf-69d2-af9c143216b2@linux.intel.com>
X-ClientProxiedBy: SJ0PR13CA0129.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::14) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS0PR11MB8232:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d15e3ff-30f3-49c5-60e3-08db7ead7f72
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HoSQ1Hfdy/3cfDNkZUy0wfwIG/GbJaXf2fdv/YLmxHOtxPzEOXfB4qMJyVXS/Sch6SjBy5wY+wFw7vgP+ohRnCsWv9iaItM/TDK/lpOiVRg1aav6+KvTlrvnQcb4eA0bJuKHQnLxNTolttvbd9/25dIDbUTz8LAwqlpCb195q7bH8G/+qhapSZFzc5bqArxSazfq4T72hDGDPS43u8XVVvCmBSJF6tfgAevZRAGL/ek5ECnv2mIVMyCSzAXN1K6RojGWCztkDtDmvSZ7h8ueDHsWFHal5niN9P0p9H0o0cnU4VSxYvFDie0jAyD16D4ix8M30p52BUkAfd8WQLJDm4i0sCVBpCWCPL8K3lwNmjxYqPzHa1LmzEcQeMOga8msN7dwXoPEUor8VLiM16usVWIo2LAAkxt5y0B7mZSGOlzssANLpgC/saZxlAQLbIno7EF4LJ8bVmklKyAe1S3Q+QLXfy61D1Cu/LwTgyPJTAr22t/AITgDhWwShP0G/EF5vt8Fhf+Jz7yuDZKszWKjr21Vy5yqfG730hTLBAVaRhonInsp35444MaedOAdKXcf
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(396003)(376002)(346002)(366004)(136003)(451199021)(66476007)(26005)(6512007)(82960400001)(478600001)(53546011)(6506007)(186003)(86362001)(6666004)(66574015)(316002)(38100700002)(6486002)(6916009)(4326008)(66556008)(66946007)(5660300002)(8936002)(8676002)(44832011)(2906002)(41300700001)(4744005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?oOf0fXh/z9fG7ZfLlLtnMWXDyAeC6VggQJZclXdezunZSYVj5SfJER/cw2?=
 =?iso-8859-1?Q?vrNfR8+pnRC7iRXIyuvFNO4z+2e2cNWwaRQ0Etr4RXbMozwWGabOn+c684?=
 =?iso-8859-1?Q?LdWCmp7av5ruPTEodhKtuII3f7bA5+UZ/ukw1JQV2MVwE/I+S9KstZlfBc?=
 =?iso-8859-1?Q?EIEdEmRmKH1/AKKD22pXa8II9s+1vZwPWYdNdmOvuEmRwKs8Q5eX5HlZuO?=
 =?iso-8859-1?Q?KWx2nC+eRcUfyWG1QGJQWC0d4wBoJu02/5C4diYyJxXSp3b/lINHFNhmOh?=
 =?iso-8859-1?Q?ScWSYWsCaILPNc7F//CAHXtrqeofX+Dr7jOt4vpj8GnHAGl7TFNdWrQwWf?=
 =?iso-8859-1?Q?yZYxgm4oh3oZNcMkOUarTiqzW1VRu8h5U648OiEDR2pwLa08WfJicq+WLX?=
 =?iso-8859-1?Q?TsZccObjXXPRWQrpg6a71rxP5fXSzcWwGBM9GAC3aFT+HZvDFMe4K69jtq?=
 =?iso-8859-1?Q?VTDtxtQiXzgk9ZIFTJsbiGYekM1pZhGRJ8Llp43KfR7ytBcgKORyoUnSKu?=
 =?iso-8859-1?Q?WdhQd67hT9fhcy/0+XzJLWMKhqx7c9sZGEBUe4ZWg8wDSBmDJrxO2n8+Xw?=
 =?iso-8859-1?Q?Td8tVL0eX7SUAd7RX0HbKtGSKnG/vZsvpCdReHxJRxv+q9ZFyTlD8fb18x?=
 =?iso-8859-1?Q?kqx2uWYI8RACMhqYGrld0BZbXbYYMCtIByrhQ+v7WMzpQZSg4ZMcERahY5?=
 =?iso-8859-1?Q?jP21xTb4NrcfA+EAwoDCJ4sdUSqh2040W+pXT5JYpV7NXcfe4RziqJrccG?=
 =?iso-8859-1?Q?Lx56slTnlzlJtWUuNhcwYdjdPY3aCw6F4T0EwegJozVoj9IM5aMbFMqzSg?=
 =?iso-8859-1?Q?bdt9TgBUWRD/Wt1jtttg0kH7oHkUXF5mnGSHZuyCxUCjLYGLuLE5XU7piO?=
 =?iso-8859-1?Q?a6O66mcJ9J5pRs5Tq5FkVfkYUcrzmWv+xMk5YcXnRG8SCp2DIx/ZDemnYn?=
 =?iso-8859-1?Q?/C29dcYJRpcwV1AVJo962nAmMiHD0I4oOip2UkM7Tm9ammztbursw6t/LY?=
 =?iso-8859-1?Q?ITy9CaIrjppzp0PLTpFLZSVxicF+icGJDw30HAz9Pzhc7P3myLDk0OOrj3?=
 =?iso-8859-1?Q?+6rrnDiHZOh1kp47B3PjHtSkUv5mjmV9DP84NKe/FLKtCiBbZighJywSC8?=
 =?iso-8859-1?Q?QvCkMJ4vodD76l8N5JCk8iO5ZAzwrl9FVb4/rOjzhopYCyFU+RKrn3BNn8?=
 =?iso-8859-1?Q?MjAcnDr+hflicJi5Phh9el+AV2fjUXA0eQkhmKT+8alR89w+xa2muhb1HB?=
 =?iso-8859-1?Q?x8SX966bfc8+PqSY5OY4E99DIaBEUl2pCdAH64GqtaFok4n49uyTXNP4fD?=
 =?iso-8859-1?Q?bxDnSyP963vsHmFrTwcEWsb2bGcvirsEL35oWk4YmSMdy76uyS8PIf3QdW?=
 =?iso-8859-1?Q?kn2+BczptxatLPsJuS3VEwCUKEyOKTZlBI50xsFbAdOgh/vt7FMJ6qSFok?=
 =?iso-8859-1?Q?tUz21MEnRd1GoEOn2IGLsUQJV7JpuYjCB9j/PskHviZbfUdZf/4+ZHn1Gh?=
 =?iso-8859-1?Q?mpbwphWWtZXPWrf/NDQQ8w3PLVDv2LrcqkeA2MnzuaE6HELGh4wtKF4x+a?=
 =?iso-8859-1?Q?Ysd/AZCdmJwcOJ1KtL6gUXwmCYDCa5dGgkpMBvBTiajS6jtuKmMjwB2wl4?=
 =?iso-8859-1?Q?eVE5qe1VtKN77HszcBRfEbeRMFhiYoz0PsxTz6m5xpY7XSQRjw4HytAw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d15e3ff-30f3-49c5-60e3-08db7ead7f72
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2023 05:46:23.8395 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yBYljbZo/DKhmiW314DWZfQo9gC64SO4GaWXUDrpsqtJo5CNctAiFwyKsb3Sd7WCc9eNDXCfXD+ff1hKUJd5hQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8232
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v4 3/9] maple_tree: Export mas_preallocate
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

On Thu, Jul 06, 2023 at 07:51:26PM +0200, Thomas Hellström wrote:
> 
> On 6/30/23 19:57, Matthew Brost wrote:
> > The DRM GPUVA implementation needs this function.
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> 
> It looks like DRM GPUVA has moved to the interval tree, so this is no longer
> needed?

It looks like it has... Let me pull in that version of GPUVA and test this.

Matt

> 
> /Thomas
> 
> 
> > ---
> >   lib/maple_tree.c | 1 +
> >   1 file changed, 1 insertion(+)
> > 
> > diff --git a/lib/maple_tree.c b/lib/maple_tree.c
> > index 1281a40d5735..4a6ecdb12a92 100644
> > --- a/lib/maple_tree.c
> > +++ b/lib/maple_tree.c
> > @@ -5815,6 +5815,7 @@ int mas_preallocate(struct ma_state *mas, gfp_t gfp)
> >   	mas_reset(mas);
> >   	return ret;
> >   }
> > +EXPORT_SYMBOL_GPL(mas_preallocate);
> >   /*
> >    * mas_destroy() - destroy a maple state.
