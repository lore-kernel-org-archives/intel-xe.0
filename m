Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB2F3CAC5AC
	for <intel-xe@archiver.kernel.org>; Tue, 23 Sep 2025 13:36:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9070710E190;
	Tue, 23 Sep 2025 13:36:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="3H1ZCxjj";
	dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 371F610E190;
 Tue, 23 Sep 2025 13:36:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Transfer-Encoding
 :Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=qit3OXxpZh2ogtg5RstC5cs1VSqpbAxG4rhPfkTl5lc=; b=3H1ZCxjjBOdKNRVAfEFtmda4XE
 r6k9RE3NhaDKZGRQYCcecwPguTadehXBN5HoI5W5ztvjEoy3NIfXmJJf1EGXze48EbdYnG5Htn2Jy
 yQhGjPozo/FBt0U86G1DZtZb3EnjQY+iS/kbB0WsmkJley70/cjDqE+aHbU2r4rm35g3lOOzya38m
 oDyYAgnCSj0ih+4mTdDcFE539cgrvFnAYK7OrsUCnAmtBTapEfwY/u5MbLht+UItnDDD2hOiIKFp9
 VhS/dpdN3r39gCtXzTwseCjAv6IfMu+0rEZNC6BcFfGqyyl/1K/y/rj2f7LhAV6DwYAyuFw/fXYdQ
 LZYwwGCA==;
Received: from hch by bombadil.infradead.org with local (Exim 4.98.2 #2 (Red
 Hat Linux)) id 1v13C1-0000000DX9j-3ykz;
 Tue, 23 Sep 2025 13:36:29 +0000
Date: Tue, 23 Sep 2025 06:36:29 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc: Jason Gunthorpe <jgg@nvidia.com>, Matthew Brost <matthew.brost@intel.com>,
 "Kasireddy, Vivek" <vivek.kasireddy@intel.com>,
 Simona Vetter <simona.vetter@ffwll.ch>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Logan Gunthorpe <logang@deltatee.com>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v4 1/5] PCI/P2PDMA: Don't enforce ACS check for device
 functions of Intel GPUs
Message-ID: <aNKiXTGs75fldDYS@infradead.org>
References: <20250919122931.GR1391379@nvidia.com>
 <IA0PR11MB718504F59BFA080EC0963E94F812A@IA0PR11MB7185.namprd11.prod.outlook.com>
 <045c6892-9b15-4f31-aa6a-1f45528500f1@amd.com>
 <20250922122018.GU1391379@nvidia.com>
 <IA0PR11MB718580B723FA2BEDCFAB71E9F81DA@IA0PR11MB7185.namprd11.prod.outlook.com>
 <aNI9a6o0RtQmDYPp@lstrano-desk.jf.intel.com>
 <aNJB1r51eC2v2rXh@lstrano-desk.jf.intel.com>
 <80d2d0d1-db44-4f0a-8481-c81058d47196@amd.com>
 <20250923121528.GH1391379@nvidia.com>
 <522d3d83-78b5-4682-bb02-d2ae2468d30a@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <522d3d83-78b5-4682-bb02-d2ae2468d30a@amd.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
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

On Tue, Sep 23, 2025 at 02:45:10PM +0200, Christian König wrote:
> On 23.09.25 14:15, Jason Gunthorpe wrote:
> > On Tue, Sep 23, 2025 at 09:52:04AM +0200, Christian König wrote:
> >> For example the ISP driver part of amdgpu provides the V4L2
> >> interface and when we interchange a DMA-buf with it we recognize that
> >> it is actually the same device we work with.
> > 
> > One of the issues here is the mis-use of dma_map_resource() to create
> > dma_addr_t for PCI devices. This was never correct.
> 
> That is not a mis-use at all but rather exactly what dma_map_resource() was created for.

It isn't.  dma_map_resource was not created for PCIe P2P, and does not
work for the general case of PCIe P2P including offsets and switches.
Using it always was a big, and the drm driver maitaintainers were
constanty reminded of that and chose to ignore it with passion.

