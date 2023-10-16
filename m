Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD716CDB483
	for <intel-xe@archiver.kernel.org>; Mon, 16 Oct 2023 11:31:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC34510E1BC;
	Mon, 16 Oct 2023 11:31:08 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5629C10E1BC
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Oct 2023 11:31:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697455867; x=1728991867;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=hPCjpL9hAlu+O/cXdi70sU4C6ZPeyHGFEzDuTe1oRYI=;
 b=mi6E7jPsnjtDkbQvpmjl5g8eppr+foTu0somZmaXdrzSv9mrQ+G8/Y1m
 JJNc+Z0rCAa+hvSFaAP6VdUbQHfQpUjS3/UIY9ihBL25h+sFIDXFxpiNb
 QoVDBUJucAPBx1d4IDtQC3+pdxFb4/bmTc8zx5HLb+fQxyfeKzBeZufbw
 NCJ20iAx+K8WlJVn9c/Erd3Ev2JPsrqJcY4u6kQ0eL3a7KaKgo2yudjzl
 RpOP9f6GNDJBvD9xNe6aR6eTzjUvQM/38js8UHRAec3mkNp2w/hEYySZU
 vAtmFI1HxbPpndP/U+X2E3YCjOAGat5fZjgBAD1bHjPb+DjxbLxS0palV A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="389363969"
X-IronPort-AV: E=Sophos;i="6.03,229,1694761200"; d="scan'208";a="389363969"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2023 04:31:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="755657732"
X-IronPort-AV: E=Sophos;i="6.03,229,1694761200"; d="scan'208";a="755657732"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Oct 2023 04:31:06 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 16 Oct 2023 04:31:06 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Mon, 16 Oct 2023 04:31:06 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Mon, 16 Oct 2023 04:31:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SfmV618dzvZmCx9RuEaDbzhJummDLw+9SbpPmJYp+FXihCOwlrqI6ZfRkEFzxkRfjlYZW7eRxexACZg6D33CIQH4p9QaRyqc7woxoIeZDBMYPpimzo4fg6jpd8hmSasOHs6AG3+3IxJnUu3A7hBCsrHuQz0ZmOOUrCzCtL+xRsDOSGlOyS3x1jKa3rnSp26d/ju32GkhOfCL0CaptiKvuhHFe/CVpJmqNayBFsY/1FTh+5iRp20zZg1EZ9jif+oQJs88KDan1QmmWMm+gl7Xe0+ousW61/jA1iIjnR7cMu458E5gmB/3CAGhtVuhL1Xcjd6zm7q7NW+voCndNXjXLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8MJwl4SWbFu+VgVdnIt0noczdi9h8t0JETD+u3X2Q5Q=;
 b=ZiijBt8Q4a7LtIatb2quPfqAvCQ4jVm+EdN6XQdhyQ9Rq0fr1RVkKWZJwt/CeDkvBfoh4tYFrNU29BxzO5Dj/9yHjnwxbgJL/YiIVa/rbMY/2HNX8h+qX3ndLAUvPDMyESOV0OBSCWgXmSE02FM+mJs4DCr6A1R7zi3DNpkuQW74Os334U3/NtEguAQcDvC1XS7UobF1Wz64ljSdmtjdcBf36MJwRJqNS0QcIbSVQ3jxWSNAHx9F0JpZUxiUzuSh0K/YgaXtZYGI9gtB3wjFp2ft4yPxAVbZfrO5m/W7qbqEgGiJvfDqNTTSc+1cnxijTy5TEYUxOzGr+hKvI7Js8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by CH3PR11MB7273.namprd11.prod.outlook.com (2603:10b6:610:141::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.35; Mon, 16 Oct
 2023 11:31:03 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5772:f514:b746:5723]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5772:f514:b746:5723%5]) with mapi id 15.20.6886.034; Mon, 16 Oct 2023
 11:31:03 +0000
Date: Mon, 16 Oct 2023 13:30:55 +0200
From: Francois Dugast <francois.dugast@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Message-ID: <ZS0e78Xxknp8fy1H@fdugast-desk.home>
References: <20231013102226.2961-1-thomas.hellstrom@linux.intel.com>
 <ZSmlgS88PD4QI+k8@intel.com>
 <51dcf3d7-fe44-cebd-7922-b29e3d864cbc@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <51dcf3d7-fe44-cebd-7922-b29e3d864cbc@linux.intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: FR0P281CA0242.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:af::12) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|CH3PR11MB7273:EE_
X-MS-Office365-Filtering-Correlation-Id: 85e73f25-7e74-4b12-fc29-08dbce3b60ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QurP1GUK9RKBqFNYIB0A0legNK+GjcqHbeF7Ge2BwJsBjJzeqngKfOMPj7oPGEQoBsjfZdeKrXkqkOJLGTLNbos40XUSFHbGEy+e5r+KhxWgp0iGPosGC+FgM3IGa9Da93YBLZpmF2BvXM5dX9InvhLpE5GWrPicKIRUsvk8fCrqrP7WnpfcyXgitZf1HY403DH/iod642u6AJQaq7l0s0Leg+B9EXx9Wd4FCitp4P4VQc65HBYLM9en6xESuryvU3RBsIjYM6DHjGbiViQb7oG6Dx3TpSgS+uw0/protrC/YuCCiEDTi+g8p/LAuZtQBg9q/+OQAdgr6FeQP9ZBSE2nt81FgLri2MJ2D0HYsIfL4AfMduawY7Ni3ap0FXas+bAcbT+tI/iI6bgXEX2a2zOMxeG8o4OyQynfwWXES/pirwZSl8nAGLZ6JqBYVWnjuzubWOik2wrOH1Wa+JibnFTbt9YGOvKj36U6e4YxTKw3T3vL8wPFWaJZW9lsDo7PU1iI6Q/3YMV2yKP//ql9+Xz3A73T5YysVeKq0MHMzqo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(346002)(366004)(376002)(136003)(39860400002)(230922051799003)(64100799003)(186009)(451199024)(1800799009)(53546011)(83380400001)(26005)(66574015)(5660300002)(4326008)(41300700001)(8936002)(8676002)(44832011)(36756003)(86362001)(82960400001)(966005)(6486002)(2906002)(9686003)(478600001)(316002)(54906003)(66556008)(36916002)(66946007)(6916009)(66476007)(6506007)(6512007)(6666004)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WWl3RmtWSytIbFNObHRYUFRiNkUvcFNtdFIrbTdrVUZTdEduaFVtSDhuVVhZ?=
 =?utf-8?B?K1d0Ny85ZjdQQ2N5eUs3VHJLVnFDdHZ4emJiMEV5b1ltZGJ0c3dsdnpuNU9E?=
 =?utf-8?B?YlFueUNxY2ZlWWtxbVRYbU5meEQ0RnFwaFBlcDd4cXJUOWxDU2tSTllRbFhx?=
 =?utf-8?B?U3Zsa0QvMjVSK3o2SHRnMDVEdWZkdnE4dURnRy82STcxUCs4RGVCUkduekt2?=
 =?utf-8?B?YTNzTnI0aEF6TFl3QnpjL1ViaGlOL1lqRHdobmRHRmVJdEVGQ1J4Z0JMYVJX?=
 =?utf-8?B?aVJyTG1IZnVmK0U1SWRRRlNNVGtTeE9JMUd5eHM3K2lubXVySjc0VHNadlVV?=
 =?utf-8?B?elNQL2pGaFNZVm5heDh3dUsybjhhUDNIMWxwc3ZVYkVuc2hDaHhQVGF5RlJV?=
 =?utf-8?B?ekZXWGwvQklZOHNEMHpaS0Q3aFJqcXlFZWl6U0JJd1BiOUtRU0pneWdKdjBB?=
 =?utf-8?B?K09uK2JlaThBRHZuUUduSXg2dzFCR29oY2lLanFyOXN0UGMzamFSQ3dncmx4?=
 =?utf-8?B?S0Q4b1dNS2EvUDJlcklqSUNQbkx6clNJRlNPQTVuSExEdjFqMllTV2s1YnlH?=
 =?utf-8?B?eVBSdjZaVW1mVS9XZDg3S1dWSlhETjBEcmowNHlHVjdRQXJKNEtjZ2s5QUkr?=
 =?utf-8?B?VWl2VG0xeXR0S2xydGppSHJFQzM3TmZDSFRzajJIUW95VXBEUHVSc0txK0dS?=
 =?utf-8?B?T2tQRlIyS3R6Z3oyUTlrc3QvcStielZUMzRzZWxIL3I1OUsweW85ZllsWHZ1?=
 =?utf-8?B?RkwyMnE5TExIblVCUFNuTXNud1FuWllsc3d1TXprcFZoYVUxR1dEajlEdlJU?=
 =?utf-8?B?eHgvVkJ0VXhNdVJ6OGFMMW5PeTFNL2tNREF5SFlxeEREWUJrby8vR1dlME5W?=
 =?utf-8?B?M3ZDbUpIZUo3WGdPOHJTb3pxQ3J3TVZTa0hkNzF3TjVZWk9ybURjd2pubWNM?=
 =?utf-8?B?RUtyOE95blJmSHVlZGJFZXN0S3p2RmkzelE0OUFibERhYjRpQ2sxWG9sZG15?=
 =?utf-8?B?OEo2WTJMZEkwNXl5bC9uQ2FsbUhFVEZaZVZzUkNsbElvbCsxRnRlMEhQN01P?=
 =?utf-8?B?VmFlNTU1QnFuN0pDeHNKTnNNMjF4T2U0bXk5Zzk4RHgzbGxpYVZQd3JZTG1w?=
 =?utf-8?B?OXV4NmRPMC8rWDl2YVlCTzc5SFlBWlpmbVJ2Ry9Dc0NRcU1HWllEamFIMlRo?=
 =?utf-8?B?TnBXK3k4TWh1RnFFTU14bXVyTHVHcXZ3YWNzZ2t4OXNydTd3RGV6V3lJaGhC?=
 =?utf-8?B?R3F3T25td1NXODBtTWRXT2E4ZmY0Mk1sS2pxUVY3LzQ1SDJ4aGRLc3cweHEw?=
 =?utf-8?B?a3lQNUVDY0sxUTFUR0E2TGlVZ2VRZ0FoZnhNWjgwYWhQakNiamg4anVKTlNj?=
 =?utf-8?B?RVloNDZ1a3ZDOHhyZUtVT2tOcUlCWEE5MFE0M3R3d3o0b0NEQ2RwdHMwaG9T?=
 =?utf-8?B?N091cE5yWmpRejVDaXd1ck5HZDRFL3BzcEhaMytOMm5UY09hcUJ3Mld6Z2FE?=
 =?utf-8?B?NHZYTVBmdXE5OHJ5cGtXSTBQbW9QY2lseHJBSlZxREZESmpQU2JyTW9iUlF3?=
 =?utf-8?B?RVM1cU1taDJTRUMzNWxDeUZWTGR3TjJaZzAwcFFySENzRjFrR3VRZGNaeE5r?=
 =?utf-8?B?bUwwekhXYXQ2LzNoNjcxWFFxUHZ4a25VTDVONzNhQ0w1Z1FTUFFuQktRQXVs?=
 =?utf-8?B?cXN0MlN0NS81UkIyRlUzNDk0YXd3ekxEYTVDdFN3QTk1Sm9qbVdweGo2cndR?=
 =?utf-8?B?eE1wL1hidmR6N1UrNmduVElxelFSczlhZDY2dEJ5US9QYXRsQWd5b0xES0FV?=
 =?utf-8?B?bVluUWpLTHQ1ZWdZaU9QdnBIZmM3TE1qSkd6OE03cHV3ajZnYkp5eHFZWEFz?=
 =?utf-8?B?dDJmMWFibFc2Q2lqS1YrbWtGdU5Ha0dTMVdlMGMxMlJTM1NqREQraW44bTQx?=
 =?utf-8?B?aDNJTVlTdXNoZWhvdW9MRVFIY3E1ZjI4ODRFT0ZLeEs4TjJlaE5xeXlMS3Mz?=
 =?utf-8?B?bFUxMktmTGtFYUo1N0ptOTdmejRVWUZYY3luekVVS05GMWRZU3ZJQzNtMFFK?=
 =?utf-8?B?cEdpWkZpN2QrRGI4aUMzWGJwZStGM3gyU3JjKzR3d3RsWkc0UkVmZTJGM0xq?=
 =?utf-8?B?bmNkNlpPcUZ2eVFDbGd6N0Ixd283WWVVN2toWkdFaEpXekx4TUpjeG9DQ2E2?=
 =?utf-8?B?TWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 85e73f25-7e74-4b12-fc29-08dbce3b60ff
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2023 11:31:03.0534 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N4/hOXwbCM6gZfh43AK/IJwNdMNJT53ZMVOXruO2aLI7QpWg61fE/wpAFdaTVLLSz3kM3Vsb+UVG1wMYVO20NzqQesRQQ1X8zQO6trxjmfU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7273
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [RFC PATCH] drm/xe/uAPi: Clarify the meaning of
 min_page_size and MIN_ALIGNMENT
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
Cc: intel-xe@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, Oct 16, 2023 at 01:03:07PM +0200, Thomas Hellström wrote:
> Hi,
> 
> On 10/13/23 22:16, Rodrigo Vivi wrote:
> > On Fri, Oct 13, 2023 at 12:22:26PM +0200, Thomas Hellström wrote:
> > > In particular, don't *enforce* alignment of buffer object sizes to
> > > MIN_ALIGNMENT, as enforcing that for imported dma-bufs would not
> > > really make sense.
> > > 
> > > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > > Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> > > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > Cc: Matthew Brost <matthew.brost@intel.com>
> > > Cc: Francois Dugast <francois.dugast@intel.com>
> > > Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > > ---
> > >   include/uapi/drm/xe_drm.h | 17 ++++++++++++-----
> > >   1 file changed, 12 insertions(+), 5 deletions(-)
> > > 
> > > diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> > > index d48d8e3c898c..5895c95879d1 100644
> > > --- a/include/uapi/drm/xe_drm.h
> > > +++ b/include/uapi/drm/xe_drm.h
> > > @@ -167,11 +167,10 @@ struct drm_xe_query_mem_region {
> > >   	 *
> > >   	 * When the kernel allocates memory for this region, the
> > >   	 * underlying pages will be at least @min_page_size in size.
> > > -	 *
> > > -	 * Important note: When userspace allocates a GTT address which
> > > -	 * can point to memory allocated from this region, it must also
> > > -	 * respect this minimum alignment. This is enforced by the
> > > -	 * kernel.
> > This old statement seems bold on the kernel is enforcing it. If we are
> > but intend to not enforce anymore we should also change the code in
> > the same patch, no?!
> > Also by the commit message I had the impression that this was removing
> > the enforcement, and not just the documentation about it.
> 
> This RFC was more intended to trigger a discussion on how to handle this.
> I'll actually bring back the above somewhat reworded and also rework the
> commit message a bit to reflect that this is an RFC for an uAPI change under
> discussion.
> 
> > 
> > > +	 * Buffer objects with an allowable placement in this region may
> > > +	 * be created with a smaller size, but for increased performance,
> > > +	 * user-space drivers should align sizes of such buffer objects
> > > +	 * to this value whenever possible.
> > >   	 */
> > >   	__u32 min_page_size;
> > >   	/**
> > > @@ -252,6 +251,14 @@ struct drm_xe_query_config {
> > >   #define XE_QUERY_CONFIG_REV_AND_DEVICE_ID	0
> > >   #define XE_QUERY_CONFIG_FLAGS			1
> > >   	#define XE_QUERY_CONFIG_FLAGS_HAS_VRAM		(0x1 << 0)
> > > +/*
> > > + * XE_QUERY_CONFIG_MIN_ALIGNMENT - GPU VM bind address - and size alignment.
> > > + * GPU virtual address mappings of buffer objects must have their VM addr and
> > > + * range aligned to this value, with the exception of buffer objects with
> > > + * allowable placement in system memory only. If this alignment results in
> > > + * a mapping beyond the end of the buffer object, accesses beyond the
> > > + * end of the buffer object have undefined reslut.
> > s/reslut/result.
> > 
> > Should we make this into a kernel doc?
> 
> It looks like all other defines of constants in this file doesn't use
> kerneldoc. If we want to do that, It looks like we need to break this out to
> a top-level DOC: section, similar to what's done for 
> XE_RESET_FAILED_UEVENT.
> 
> /Thomas
> 
> 

Hi Thomas,

A proposal to make constants visible in kernel doc is part of the
uAPI alignment series take 2:
https://patchwork.freedesktop.org/patch/562078/?series=124977&rev=1

Francois
