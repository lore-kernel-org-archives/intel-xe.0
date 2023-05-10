Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20C6BC77B75
	for <intel-xe@archiver.kernel.org>; Wed, 10 May 2023 00:31:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C714F10E446;
	Wed, 10 May 2023 00:31:43 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EBCA10E456
 for <intel-xe@lists.freedesktop.org>; Wed, 10 May 2023 00:31:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683678702; x=1715214702;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=BqxMQz77M00+or9wab/+Gbw/iIpI/3EF/UL8uLWYM5U=;
 b=SHAPRpcaNynVgkIhPQ8wjbpH5JhbmvWtUfyvQbTBJ3dMcf0BtpZHxTXs
 H77VxtvFRbTIubfl2O4WE8O+MgJemnwrz79hQ68qArtrwovStxI2KkRM2
 +WCKmkTu5Lpaa7sZp4rYlLLZu7v+dLgCpBYdEzXeBgiBVG8Rr9YHyOSCF
 ZNv/hgdEwbPeu+EArcQPmIXOqaFRsZkRWRTM/BNht132Uy2xL+gsqL9oS
 dS8JZRAXoCl+cECK5npphZU15DQS5CV/ke4JxA1yAGjjpwVExJTf+nHv2
 qoL/eWK37mXPHoUQUt4eX8aLEnhHYSBLYeRCCly8JqZwnXZ0ZGpdkn1wY w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="348927272"
X-IronPort-AV: E=Sophos;i="5.99,263,1677571200"; d="scan'208";a="348927272"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2023 17:31:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="764085461"
X-IronPort-AV: E=Sophos;i="5.99,263,1677571200"; d="scan'208";a="764085461"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga008.fm.intel.com with ESMTP; 09 May 2023 17:31:41 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 9 May 2023 17:31:41 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 9 May 2023 17:31:41 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.171)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 9 May 2023 17:31:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aGdvXEDNnYINZ400klGc5cBJdUZ4t8XKrYl06SXrMuZ5o7L1Iqmlv2LhsdjZp2VycuOb/Op1X7eZDEg0NJ8QBceXzm4KWFgiIh2bfxLkV6ik3mmtJvAMeMckMDyiy4HNyaOua+qPJhJy743bduN86lwcCe55+l86soFxTaHP//FIRmGzF013hEBOG/A6kwHhBp4eVMnl/6T/ppZ2qp+8+pDX0faIOL189bJt9pMPqp2rC/+zMrgNRkZC+Wo0pRWCCz5WuCHfdymnUv28YV0thBMYWGgqL9UUZsxRT/GNakbnvM4ogEmGOPuwnLfie6EgjXO8DbpIOiJ/SSPuoxeGLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W20WJ9KwKcXQfMSev7KNrQtrcLndtbsI4sqVwAVZkkA=;
 b=h1e4IlAf8XVpRFBygAp8AZOeyqs1Y3FhHJYKRyaWL1DPqAqxOILsnibO/hGFAP5Md57Z462TtsnHJGlO2ABgbkGODBgBBqbHN602DXaAeuD5cEu3ggBv47D7b6qMYhh7k2A7pNNa+Jc25WgG2W/1WN3jTpKZX+xa250IPEg/NyoDlL1nZtgFtnEIHi7aK+c3sVNim0BKwty7+LN1GfNhWtmcbvZPtMhh/S4I6Xio33dBvIaqqMTGdeABejHC0RFBoLF/l/GI01h7rqqco67PaIm/x7ZQaOH+6OX4XnUaH7oLZgCI7RwbA/KS9CsspJgwKXkOlsUBT0W5x//J5i687g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM4PR11MB5993.namprd11.prod.outlook.com (2603:10b6:8:5c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.33; Wed, 10 May
 2023 00:31:39 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e%4]) with mapi id 15.20.6363.032; Wed, 10 May 2023
 00:31:39 +0000
Date: Wed, 10 May 2023 00:31:03 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Message-ID: <ZFrlxwyIg4HCd1Yx@DUT025-TGLU.fm.intel.com>
References: <20230502001727.3211096-1-matthew.brost@intel.com>
 <20230502001727.3211096-15-matthew.brost@intel.com>
 <8d88f83a-290e-c7fd-7e02-00ecc034c4e5@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8d88f83a-290e-c7fd-7e02-00ecc034c4e5@linux.intel.com>
X-ClientProxiedBy: BYAPR01CA0043.prod.exchangelabs.com (2603:10b6:a03:94::20)
 To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM4PR11MB5993:EE_
X-MS-Office365-Filtering-Correlation-Id: ccaf5fa1-f193-4730-32dd-08db50edeb3f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LOX/EJomig8XkzUigZ55JbFKm35CdcqCIJYB3X0f0c1MtdBZrss5/V5vi5+pQk00ECpvuNWk2ACgHqWQaAM65EcF0bIR7ilJS28vqc8aXTa+EgE7H8OnMtHibgG7WTzBljha16zm6OvHpl+Bz8EWX7WIdHK8np4+aAYleDYCsicb6SmQSYlohEQ5VH9LaZzA2+wpq14mmUpmrbW+swwKLNmQ4C7zeM2jWwFT+8aaAax6Qry1i/RYA5A0DAzk/lgtsNnAQE2J/w8d3Xy6xGZnjezAgikArzGLH4fGTQxBCajisf/v76AXvEV3GCnQU42AyRJn8c44tPbC2miDnSUF8QpJcexPCyI7VF1440Gq/F5082U1Axu9BAViTpGe5VsmhVsKDFFqwzUpAtTNdT+gLoR1yNPszITsQa3W0SP8PD8epgDwmSwnn978Dkn/+5VxFm05pw5UvHv3WXMjcImHHKkbt5PcUgOWnApP0snsMyfhqhgfyW8rUvg7aSv8698o1k661un5WMeMP6zk5yOBSjslLbr37WVyfkV1x1c97Rhi1BtthQAWbpGxMe4MPy98
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(396003)(366004)(376002)(136003)(346002)(451199021)(66574015)(66946007)(66556008)(66476007)(6916009)(4326008)(5660300002)(86362001)(478600001)(82960400001)(316002)(44832011)(38100700002)(26005)(6506007)(53546011)(6512007)(8936002)(8676002)(6486002)(2906002)(6666004)(4744005)(41300700001)(186003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?VVSiybou9s252heB8OeIKto26FbIp/kqHS5KTjGmhcVq7cWiMFnlKV/k6i?=
 =?iso-8859-1?Q?GRScuqkKk1RtMPCrQy+KFk4Bu2y0KvM44KPpSNSQNyg1B5TNPe1jwiD97A?=
 =?iso-8859-1?Q?GX6dVijbmQI+VFF+Nd8z5U4UI6wfYC5L10QjaZiX8Pyix3zyZ7H4CVbhHa?=
 =?iso-8859-1?Q?0iV1LvHD8T6BccZb8wdNY0aOpQqyo8Jb3Vkr1rar2LrgZFZYQkTdRhqZMr?=
 =?iso-8859-1?Q?zKnEip5+qrozYNCmFhfR0iq3Z87D29Cur02beUk64qlyZUlZaycXdj3+sL?=
 =?iso-8859-1?Q?yCEVCvwOC4UNW5T+dK5nJmEdelOnb/DvwyqMy72M01xMw+EbIVaydRmG8G?=
 =?iso-8859-1?Q?Ch8mVgxA+cYY3jPAR7cC8aFQTfB2NFn2o5VfWhN/XpOrVWDbQwIPUn/ujq?=
 =?iso-8859-1?Q?3PdB2ONz4X0zPFUSNrFkIIzYmo1EfsT+4I4c5LVUqcsGSYI9aY7Ngv81A/?=
 =?iso-8859-1?Q?5I77gZoblSuuF4mRx8w4typQkMfKOkD4D14nxYOgp11qy+tXDujyY+aKCV?=
 =?iso-8859-1?Q?Kl0KE41ie8rzgy9SOPkzZdC8/S2fDojY+VJnANTlNxsnTY4A9Xzmcbnd7i?=
 =?iso-8859-1?Q?zaV0EMqsjVKpUto4UXCqajBSp2yw0GTfVVLnvk106uSHKaqUjl8NHMkZgn?=
 =?iso-8859-1?Q?Qg48gr2cVJiJEkyiISVqJvWiPa80mDvWtUp9Z+alD/6ghHpa53r2Kl18U0?=
 =?iso-8859-1?Q?9+zm7hMHdiOAy/oisEOnJkEAnyONWc9dwZuoXr0g/8QkRTNJHER36yBEcu?=
 =?iso-8859-1?Q?IJXUdnTxySCThxyIGf488nL/wUSLzNrDYMSKDuUsX4OUrvDaR3OZX7W8hC?=
 =?iso-8859-1?Q?MByGmLFJySvwkqCuBqITo7FNyenOwvd7dNLLs2ZB2YbgTrDuX0NP5QHYAB?=
 =?iso-8859-1?Q?Ws+7QvHCYB9/r0pEEtPe99iKDYlMhbH0xOhYkt/zfqLTqJcf3rWsB0H+xQ?=
 =?iso-8859-1?Q?/5lbfj5sdn5B/7e5GUUB8cE1C7LWztjckODwR9Qovnn+Fgh7Odhwl9BH8r?=
 =?iso-8859-1?Q?YU/RNwVXMxeCRitY7/Zy8WxX1s1ZoPeLI04oUBjz+4AretRa02mPQbkQfY?=
 =?iso-8859-1?Q?yqiKzLbxAwF+696CHpCuqxak9giuX+IatPeK/OtHCdxIabguKIXR8qDsTl?=
 =?iso-8859-1?Q?e1Olud/+iUjGr+Kqk/RVhE33sazIhFOk4fjfiHVZ8z0jOhCvoNgVqa+lXv?=
 =?iso-8859-1?Q?Dm5PXG282lDtYhodreHLnAsVU8M/GbEkJbNI7k0Nbs1SUacD/+QFmxURAS?=
 =?iso-8859-1?Q?YrYYVDafUUENa0C+Pm+QV+VmXwTGsq/KD6h4WNLYJWDkUSaqwz8gVuuIVf?=
 =?iso-8859-1?Q?L5QE0JP2fGa54DkUFsKDRNsn4HunCFLS1X/eftkgDJvBR51dQtUAOoSF8F?=
 =?iso-8859-1?Q?TJ+4gvskRDpdVXFEuFn+YhH3xL31vuWJ4Sg8QgJN5ePYkYLJ0yvViwKnY4?=
 =?iso-8859-1?Q?54hTA7hz/pnW0LaZGYn6He+NmfiGQujufrNTUZ6F7lxpBcXZGWQaRz1L1X?=
 =?iso-8859-1?Q?CMTVPbF/uekEjAeWv97UFM2t5XEpjwfgqt6uxxgOjv9Uq6c3zCnp1uJZS2?=
 =?iso-8859-1?Q?juMqK1uoY+3YNIoNC0XL6ATh3ldMKI6t/W0KxsaxfIYAP/a/KlOEWcE/QO?=
 =?iso-8859-1?Q?dg7Udc5gFhZL/VjxubJEbluTwgy+FN+ezhxmZkfh3Rner3pnL+FluOHQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ccaf5fa1-f193-4730-32dd-08db50edeb3f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2023 00:31:38.8799 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H0pFl0nq4CkilKoA/+ApUKGrG9LerK9irEnk5c8H8uDqa58ppsc9+e7HRiLnK2pi+fbWBVWRvJ/mrsvbaGLV6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5993
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 14/31] maple_tree: Export mas_preallocate
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

On Tue, May 09, 2023 at 03:33:48PM +0200, Thomas Hellström wrote:
> 
> On 5/2/23 02:17, Matthew Brost wrote:
> > The DRM GPUVA implementation needs this function.
> 
> A more thorough explanation as to why  it's needed would help convince maple
> tree maintainers an export is needed.
> 
> Otherwise the change itself LGTM.
> 
> /Thomas
> 

I think version of this is in Linus tree. I think just get this after a
rebase.

Matt

> 
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >   lib/maple_tree.c | 1 +
> >   1 file changed, 1 insertion(+)
> > 
> > diff --git a/lib/maple_tree.c b/lib/maple_tree.c
> > index 9e2735cbc2b4..ae37a167e25d 100644
> > --- a/lib/maple_tree.c
> > +++ b/lib/maple_tree.c
> > @@ -5726,6 +5726,7 @@ int mas_preallocate(struct ma_state *mas, gfp_t gfp)
> >   	mas_reset(mas);
> >   	return ret;
> >   }
> > +EXPORT_SYMBOL_GPL(mas_preallocate);
> >   /*
> >    * mas_destroy() - destroy a maple state.
