Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB7FE606A31F
	for <intel-xe@archiver.kernel.org>; Mon, 26 Oct 2026 11:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TbQOURlo
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FE0210EE86;
	Mon, 26 Oct 2026 11:56:48 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EE6310EEA9
 for <intel-xe@lists.freedesktop.org>; Mon, 26 Oct 2026 11:56:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793015803; x=1824551803;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=vzmsqJi9MWsk5kQvHWBJz4ptGaSdkSggZJYYqHCO32M=;
 b=TbQOURlof+ZQBQLIMkiMYQGVvdIwpeqHevpXnE38EwAbtF6sDQ+oTndL
 mt9DeBUHFHS7p7yrUpiJ/KoV8k1m/Jq0gv/zLFa0/Y2XpwBskcXowi3BP
 1Dz9GfX/RJzbVTp7TvAJO1baUsokeIb/bKtddABzaNbs75qefdyRvt1mp
 yhplyaUb/sfyO57qduckj6UJygh9Zwb/a/yXq0CCweFcKGE6GmJOaX968
 7PyISrY3mxJlf6cr91fFlfvVteFfgodNy0Ca85fcWQZa70TRVs1F8XDPW
 B07h26Mswky1nHQALkdSeraEaSmnA7C+aoFM1oJvXxwmWcrsGsdRYzwIe g==;
X-CSE-ConnectionGUID: FFhE0RH7SdWWjqYX17JyDA==
X-CSE-MsgGUID: 3qz3WD/wTmOCDzfpHF7y4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11946"; a="1587512"
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="1587512"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2026 04:56:43 -0700
X-CSE-ConnectionGUID: wETve9itQzy9a8b4LSRDLg==
X-CSE-MsgGUID: X805h0kLSC+D/gOWVlOLqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="4598023"
Received: from black.igk.intel.com ([10.91.253.5])
 by fmviesa008.fm.intel.com with ESMTP; 26 Oct 2026 04:56:40 -0700
Received: by black.igk.intel.com (Postfix, from userid 1008)
 id 1569C99; Mon, 26 Oct 2026 12:56:39 +0100 (CET)
Date: Mon, 26 Oct 2026 12:56:39 +0100
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: "Vivekanandan, Balasubramani" <balasubramani.vivekanandan@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: "Kumar G, Naresh" <naresh.kumar.g@intel.com>,
 intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com,
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 Danilo Krummrich <dakr@kernel.org>,
 "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
Subject: Re: [PATCH] drm/xe/i2c: Fix use-after-free on driver unload
Message-ID: <at8_996Aarbq0_TO@black.igk.intel.com>
References: <20261009164241.923756-2-balasubramani.vivekanandan@intel.com>
 <7939f69c-bc63-4465-a578-8024e20c4eb8@intel.com>
 <aszdvyOY5zkyFTU1@bvivekan-mobl1>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aszdvyOY5zkyFTU1@bvivekan-mobl1>
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

+Andy

On Mon, Oct 12, 2026 at 06:46:47PM +0530, Vivekanandan, Balasubramani wrote:
> On 12.10.2026 17:16, Kumar G, Naresh wrote:
> > Hi Bala,
> > 
> > I was investigating this issue earlier in sometime and found the root cause
> > in software _node_notify_remove().
> > 
> > It is a kind of ownership bug in driver/base/swnode.c
> > sofware_node_notify_remove(). when a manged swnode is mirrored onto a
> > 
> > second device(which is exactly what i2c-core does for the adapter's own
> > struct device), the old code does an extra
> > set_secondary_fwnode()/swnode_put()
> > 
> > for every device that tears down, not just the true owner. this is a
> > double-release/UAF risk. The following fix solves the issue without changing
> > i2c adapter registration flow.
> > 
> > The following code patch is suggested/provided to @heikki: waiting for his
> > inputs on the same.
> > 
> > Fixes: 151f6ff78cdf ("software node: Provide replacement for device_add_properties()")
> > Assisted-by: GitHub_Copilot:claude-sonnet-5
> > Signed-off-by: Nareshkumar Gollakoti<naresh.kumar.g@intel.com>
> > ---
> >  drivers/base/swnode.c | 18 +++++++++++++++---
> >  1 file changed, 15 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/base/swnode.c b/drivers/base/swnode.c
> > index 84a77ffa3dc4..2efcf12b4c21 100644
> > --- a/drivers/base/swnode.c
> > +++ b/drivers/base/swnode.c
> > @@ -1190,6 +1190,7 @@ void software_node_notify(struct device *dev)
> >  void software_node_notify_remove(struct device *dev)
> >  {
> >  	struct swnode *swnode;
> > +	bool owns_managed_fwnode;
> >  	swnode = dev_to_swnode(dev);
> >  	if (!swnode)
> > @@ -1198,6 +1199,16 @@ void software_node_notify_remove(struct device *dev)
> >  	sysfs_remove_link(&swnode->kobj, dev_name(dev));
> >  	sysfs_remove_link(&dev->kobj, "software_node");
> > +	/*
> > +	 * A managed node can end up mirrored onto more than one device (e.g.
> > +	 * a bus core copying the fwnode onto a child device, as i2c-core does
> > +	 * for an adapter's own struct device). Only the device that actually
> > +	 * owns the fwnode releases the creation reference and detaches it;
> > +	 * every other device only releases the reference software_node_notify()
> > +	 * took for it.
> > +	 */
> > +	owns_managed_fwnode = swnode->managed && swnode->fwnode.dev == dev;
> > +
> >  	/*
> >  	 * Drop the device pointer mirrored onto a secondary software node in
> >  	 * software_node_notify(). For a primary software node the core owns
> > @@ -1206,12 +1217,13 @@ void software_node_notify_remove(struct device *dev)
> >  	if (!device_match_fwnode(dev, &swnode->fwnode) && swnode->fwnode.dev == dev)
> >  		swnode->fwnode.dev = NULL;
> > +	if (owns_managed_fwnode)
> > +		set_secondary_fwnode(dev, NULL);
> > +
> >  	swnode_put(swnode);
> > -	if (swnode->managed) {
> > -		set_secondary_fwnode(dev, NULL);
> > +	if (owns_managed_fwnode)
> >  		swnode_put(swnode);
> > -	}
> >  }
> > 
> > 
> > Given that,
> > 
> > Is this rework still needed once the core fix landed?
> 
> We don't need this patch if the limitation in sharing the managed
> software nodes is fixed.

The below patch actually looks more correct to me compared to the
swnode patch above.

Andy, I'm sorry to bother you with this, but can you take a look.

Thanks,

> > On 10/9/2026 10:12 PM, Balasubramani Vivekanandan wrote:
> > > The kernel crashes when unloading the xe driver on CRI:
> > > 
> > >   Oops: general protection fault, probably for non-canonical address 0x6b6b6b6b6b6b6b73
> > >   RIP: 0010:platform_device_release+0x80/0x90
> > >   Call Trace:
> > >    device_release+0x44/0xa0
> > >    kobject_put+0x9b/0x250
> > >    put_device+0x13/0x30
> > >    platform_device_unregister+0x29/0x40
> > >    xe_i2c_remove+0x80/0xa0 [xe]
> > >    devm_action_release+0x16/0x30
> > >    release_nodes+0x3d/0x140
> > >    devres_release_all+0x96/0xd0
> > > 
> > > This started after commit 0f485f88656af ("drm/xe/i2c: use
> > > device_create_managed_software_node()"), which attaches a managed
> > > software node to a platform device created with platform_device_alloc().
> > > 
> > > Comment above the device_create_managed_software_node function cautions
> > > that the software node created by it should not be shared or reused as
> > > the lifetime of the node is linked to the device.
> > > 
> > > But the DesignWare i2c driver which creates an adapter device as a child
> > > of the platform device reuses the software node as its fwnode.
> > > (device_set_node() in i2c_dw_probe()).
> > > 
> > > During module unbind, when the adapter device is deleted, it drops the
> > > reference count for the software node and frees the software node.
> > > Later when the platform device is removed, it tries to dereference the
> > > software node pointer and results in use-after-free.
> > > 
> > > Instead of managed software node use a static struct software_node
> > > passed through platform_device_info.swnode to
> > > platform_device_register_full().
> > > But we have a blocker which doesn't allow to use
> > > platform_device_register_full() simply.
> > > 
> > > Currently the driver is using the two step alloc/add sequence while
> > > creating the platform device so that i2c->pdev is set before
> > > platform_device_add(), because xe_i2c_notifier() needs i2c->dev and it
> > > can run before platform_device_register_full() returns.
> > > 
> > > We can fix it by removing the dependency on i2c->dev in
> > > xe_i2c_notifier(). It is using it to match against the right adapter.
> > > Instead of using the device, use its parent to match.
> > > 
> > > Fixes: 0f485f88656af ("drm/xe/i2c: use device_create_managed_software_node()")
> > > Cc: Bartosz Golaszewski<bartosz.golaszewski@oss.qualcomm.com>
> > > Cc: Danilo Krummrich<dakr@kernel.org>
> > > Cc: Heikki Krogerus<heikki.krogerus@linux.intel.com>
> > > Signed-off-by: Balasubramani Vivekanandan<balasubramani.vivekanandan@intel.com>
> > > ---
> > >   drivers/gpu/drm/xe/xe_i2c.c | 45 +++++++++++++------------------------
> > >   1 file changed, 15 insertions(+), 30 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_i2c.c b/drivers/gpu/drm/xe/xe_i2c.c
> > > index b82caaff80d7b..c54a2375f07ef 100644
> > > --- a/drivers/gpu/drm/xe/xe_i2c.c
> > > +++ b/drivers/gpu/drm/xe/xe_i2c.c
> > > @@ -55,6 +55,10 @@ static const struct property_entry xe_i2c_adapter_properties[] = {
> > >   	{ }
> > >   };
> > > +static const struct software_node xe_i2c_adapter_node = {
> > > +	.properties = xe_i2c_adapter_properties,
> > > +};
> > > +
> > >   static inline void xe_i2c_read_endpoint(struct xe_mmio *mmio, void *ep)
> > >   {
> > >   	u32 *val = ep;
> > > @@ -98,7 +102,7 @@ static int xe_i2c_notifier(struct notifier_block *nb, unsigned long action, void
> > >   	struct device *dev = data;
> > >   	if (action == BUS_NOTIFY_ADD_DEVICE &&
> > > -	    adapter && dev->parent == &i2c->pdev->dev) {
> > > +	    adapter && dev->parent && dev->parent->parent == i2c->drm_dev) {
> > >   		i2c->adapter = adapter;
> > >   		schedule_work(&i2c->work);
> > >   		return NOTIFY_OK;
> > > @@ -110,41 +114,22 @@ static int xe_i2c_notifier(struct notifier_block *nb, unsigned long action, void
> > >   static int xe_i2c_register_adapter(struct xe_i2c *i2c)
> > >   {
> > >   	struct pci_dev *pci = to_pci_dev(i2c->drm_dev);
> > > +	struct platform_device_info info = {
> > > +		.parent = i2c->drm_dev,
> > > +		.name = adapter_name,
> > > +		.swnode = &xe_i2c_adapter_node,
> > > +	};
> > >   	struct platform_device *pdev;
> > > -	int ret;
> > > -	u32 id;
> > > -
> > > -	id = (pci_domain_nr(pci->bus) << 16) | pci_dev_id(pci);
> > > -
> > > -	/*
> > > -	 * Not using platform_device_register_full() here because we don't have
> > > -	 * a handle to the platform_device before it returns. xe_i2c_notifier()
> > > -	 * uses that handle, but it may be called before
> > > -	 * platform_device_register_full() is done.
> > > -	 */
> > > -	pdev = platform_device_alloc(adapter_name, id);
> > > -	if (!pdev)
> > > -		return -ENOMEM;
> > > -	ret = device_create_managed_software_node(&pdev->dev,
> > > -						  xe_i2c_adapter_properties,
> > > -						  NULL);
> > > -	if (ret)
> > > -		goto err_pdev_put;
> > > +	info.id = (pci_domain_nr(pci->bus) << 16) | pci_dev_id(pci);
> > > -	pdev->dev.parent = i2c->drm_dev;
> > > -	i2c->pdev = pdev;
> > > +	pdev = platform_device_register_full(&info);
> > > +	if (IS_ERR(pdev))
> > > +		return PTR_ERR(pdev);
> > > -	ret = platform_device_add(pdev);
> > > -	if (ret)
> > > -		goto err_pdev_put;
> > > +	i2c->pdev = pdev;
> > >   	return 0;
> > > -
> > > -err_pdev_put:
> > > -	platform_device_put(pdev);
> > > -
> > > -	return ret;
> > >   }
> > >   static void xe_i2c_unregister_adapter(struct xe_i2c *i2c)

-- 
heikki
