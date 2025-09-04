Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9EE5CA1013
	for <intel-xe@archiver.kernel.org>; Thu,  4 Sep 2025 15:47:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8092610E263;
	Thu,  4 Sep 2025 15:47:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=deltatee.com header.i=@deltatee.com header.b="YV5aWqfu";
	dkim-atps=neutral
X-Greylist: delayed 1914 seconds by postgrey-1.36 at gabe;
 Thu, 04 Sep 2025 15:47:18 UTC
Received: from ale.deltatee.com (ale.deltatee.com [204.191.154.188])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D55EC10E263;
 Thu,  4 Sep 2025 15:47:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=deltatee.com; s=20200525; h=Subject:In-Reply-To:From:References:Cc:To:
 MIME-Version:Date:Message-ID:content-disposition;
 bh=IKQDDvSx5KiQkDtirP4I1vd8wNU+lSEM/0uM6rLE0sA=; b=YV5aWqfuqp4bQXhSokJfg9J0DE
 w42OkyDIWIkdYkJbjw0uEfm801xiE4WtRQCqb+XcB9dMoE3cu/A80rezbEbkmPWnZmWCeYO3PJhfA
 yRGgJr0kngpXhYskmMLzGxMcBivC9lR+FkK83It/h/czV4qm/by7LQvHfcEsECTYFa9ddnMgrnbC5
 VqvtaqkoNFjouDBRaUjDLLReIDj4xmNKFhgVImbKJ8s31nAPkvL5KqSAUBVfqpZuQbVnx9+zSb9Tk
 F3uXX9rln8/QLiK80oyPGPWAD/01n1ACqyM4Lo0VBQS/fV/nSC1v+1+gcT3r/iQd1Pci70Rp8yXUg
 i5NqrT/Q==;
Received: from d104-157-31-28.abhsia.telus.net ([104.157.31.28]
 helo=[192.168.1.250]) by ale.deltatee.com with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <logang@deltatee.com>) id 1uuBgI-00DIjH-1Z;
 Thu, 04 Sep 2025 09:15:23 -0600
Message-ID: <f0479622-6f3e-4e86-95e6-61244053a8b3@deltatee.com>
Date: Thu, 4 Sep 2025 09:15:20 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Vivek Kasireddy <vivek.kasireddy@intel.com>,
 dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Cc: Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org
References: <20250903223403.1261824-1-vivek.kasireddy@intel.com>
 <20250903223403.1261824-2-vivek.kasireddy@intel.com>
Content-Language: en-CA
From: Logan Gunthorpe <logang@deltatee.com>
In-Reply-To: <20250903223403.1261824-2-vivek.kasireddy@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 104.157.31.28
X-SA-Exim-Rcpt-To: vivek.kasireddy@intel.com, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, bhelgaas@google.com, linux-pci@vger.kernel.org
X-SA-Exim-Mail-From: logang@deltatee.com
Subject: Re: [PATCH v3 1/5] PCI/P2PDMA: Don't enforce ACS check for device
 functions of Intel GPUs
X-SA-Exim-Version: 4.2.1 (built Wed, 06 Jul 2022 17:57:39 +0000)
X-SA-Exim-Scanned: Yes (on ale.deltatee.com)
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



On 2025-09-03 16:30, Vivek Kasireddy wrote:
> diff --git a/drivers/pci/p2pdma.c b/drivers/pci/p2pdma.c
> index da5657a02007..9484991c4765 100644
> --- a/drivers/pci/p2pdma.c
> +++ b/drivers/pci/p2pdma.c
> @@ -544,6 +544,18 @@ static unsigned long map_types_idx(struct pci_dev *client)
>  	return (pci_domain_nr(client->bus) << 16) | pci_dev_id(client);
>  }
>  
> +static bool pci_devfns_support_p2pdma(struct pci_dev *provider,
> +				      struct pci_dev *client)
> +{
> +	if (provider->vendor == PCI_VENDOR_ID_INTEL) {
> +		if ((pci_is_vga(provider) && pci_is_vga(client)) ||
> +		    (pci_is_display(provider) && pci_is_display(client)))
> +			return pci_physfn(provider) == pci_physfn(client);
> +	}

Do we not also need to check that the client has a vendor of
PCI_VENDOR_ID_INTEL?

> @@ -705,7 +717,9 @@ int pci_p2pdma_distance_many(struct pci_dev *provider, struct device **clients,
>  		return -1;
>  
>  	for (i = 0; i < num_clients; i++) {
> -		pci_client = find_parent_pci_dev(clients[i]);
> +		pci_client = dev_is_pf(clients[i]) ?
> +				pci_dev_get(to_pci_dev(clients[i])) :
> +				find_parent_pci_dev(clients[i]);

I don't understand this hunk. Why would this need special handling if
dev_is_pf()?. find_parent_pci_dev() looks like it will do the same thing
just look at the parents if it is not a PCI devices.

Logan
