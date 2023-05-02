Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 858B6C77B73
	for <intel-xe@archiver.kernel.org>; Tue,  2 May 2023 19:35:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CC8310E03E;
	Tue,  2 May 2023 19:35:32 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4489110E03E
 for <intel-xe@lists.freedesktop.org>; Tue,  2 May 2023 19:35:31 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7DEB362806;
 Tue,  2 May 2023 19:35:30 +0000 (UTC)
Received: from rdvivi-mobl4 (unknown [192.55.55.58])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp.kernel.org (Postfix) with ESMTPSA id D8E8DC433D2;
 Tue,  2 May 2023 19:35:26 +0000 (UTC)
Date: Tue, 2 May 2023 15:35:23 -0400
From: Rodrigo Vivi <rodrigo.vivi@kernel.org>
To: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
Message-ID: <ZFFl+1z+fj7vfaig@rdvivi-mobl4>
References: <SJ1PR11MB62045FE4FFB7FB14C55FEC26816B9@SJ1PR11MB6204.namprd11.prod.outlook.com>
 <DM5PR11MB1324ACB1F1C2DC00FF6FB72DC16B9@DM5PR11MB1324.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DM5PR11MB1324ACB1F1C2DC00FF6FB72DC16B9@DM5PR11MB1324.namprd11.prod.outlook.com>
Subject: Re: [Intel-xe] [2/3] drm/xe: Size GT device memory correctly
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
Cc: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Apr 28, 2023 at 05:49:49PM +0000, Ruhl, Michael J wrote:
>    Hi Tejas,                                                                    
>                                                                                 
>                                                                                 
>                                                                                 
>    [mjruhl] comments inline                                                     

Folks, let's please stick with inline text mode only replies.
It is really hard to follow what was going on here on the discussion
and if something has changed on the new version of the series.


>                                                                                 
>                                                                                 
>                                                                                 
>    From: Upadhyay, Tejas <tejas.upadhyay@intel.com>                             
>    Sent: Friday, April 28, 2023 7:05 AM                                         
>    To: Ruhl, Michael J <michael.j.ruhl@intel.com>                               
>    Cc: intel-xe@lists.freedesktop.org                                           
>    Subject: [2/3] drm/xe: Size GT device memory correctly                       
>                                                                                 
>                                                                                 
>                                                                                 
>    Few comments inline over email as I have not yet got subscription :          
>                                                                                 
>                                                                                 
>                                                                                 
>    First of all I could  not apply patch, it looks like some patch landed       
>    yesterday which needs you patch to respin.                                   
>                                                                                 
>                                                                                 
>                                                                                 
>    [mjruhl] Hmmm, not sure why… I will make sure to rebase                      
>                                                                                 
>                                                                                 
>                                                                                 
>    diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h                            
>    b/drivers/gpu/drm/xe/regs/xe_gt_regs.h                                       
>                                                                                 
>    index 05a03129dc54..dac24b99f526 100644                                      
>                                                                                 
>    --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h                                   
>                                                                                 
>    +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h                                   
>                                                                                 
>    @@ -75,7 +75,8 @@                                                            
>                                                                                 
>     #define GEN12_VE1_AUX_NV                         _MMIO(0x42b8)              
>                                                                                 
>    #define   AUX_INV                                REG_BIT(0)                  
>                                                                                 
>                                                                                 
>                                                                                 
>    -#define XEHP_TILE0_ADDR_RANGE                    MCR_REG(0x4900)            
>                                                                                 
>    +#define XEHP_TILE_ADDR_RANGE(_idx)               MCR_REG(0x4900 + (_idx)    
>    * 4)                                                                         
>                                                                                 
>    +                                                                            
>                                                                                 
>    #define XEHP_FLAT_CCS_BASE_ADDR                  MCR_REG(0x4910)             
>                                                                                 
>                                                                                 
>                                                                                 
>     #define CHICKEN_RASTER_1                         MCR_REG(0x6204)            
>                                                                                 
>    diff --git a/drivers/gpu/drm/xe/xe_device_types.h                            
>    b/drivers/gpu/drm/xe/xe_device_types.h                                       
>                                                                                 
>    index 24dc5d2e9e05..ebd297ff6fcd 100644                                      
>                                                                                 
>    --- a/drivers/gpu/drm/xe/xe_device_types.h                                   
>                                                                                 
>    +++ b/drivers/gpu/drm/xe/xe_device_types.h                                   
>                                                                                 
>    @@ -1,6 +1,6 @@                                                              
>                                                                                 
>     /* SPDX-License-Identifier: MIT */                                          
>                                                                                 
>    /*                                                                           
>                                                                                 
>    - * Copyright © 2022 Intel Corporation                                       
>                                                                                 
>    + * Copyright © 2022-2023 Intel Corporation                                  
>                                                                                 
>      */                                                                         
>                                                                                 
>                                                                                 
>                                                                                 
>     #ifndef _XE_DEVICE_TYPES_H_                                                 
>                                                                                 
>    @@ -202,6 +202,8 @@   struct xe_device {                                     
>                                                                                 
>                             * known as small-bar.                               
>                                                                                 
>                             */                                                  
>                                                                                 
>                            resource_size_t io_size;                             
>                                                                                 
>    +                        /** @base: Offset to apply for Device Physical      
>    Address control */                                                           
>                                                                                 
>    +                        resource_size_t base;                               
>                                                                                 
>                            /** @mapping: pointer to VRAM mappable space */      
>                                                                                 
>                            void *__iomem mapping;                               
>                                                                                 
>                    } vram;                                                      
>                                                                                 
>    diff --git a/drivers/gpu/drm/xe/xe_gt_types.h                                
>    b/drivers/gpu/drm/xe/xe_gt_types.h                                           
>                                                                                 
>    index 7c47d67aa8be..a2417cc2f696 100644                                      
>                                                                                 
>    --- a/drivers/gpu/drm/xe/xe_gt_types.h                                       
>                                                                                 
>    +++ b/drivers/gpu/drm/xe/xe_gt_types.h                                       
>                                                                                 
>    @@ -1,6 +1,6 @@                                                              
>                                                                                 
>     /* SPDX-License-Identifier: MIT */                                          
>                                                                                 
>    /*                                                                           
>                                                                                 
>    - * Copyright © 2022 Intel Corporation                                       
>                                                                                 
>    + * Copyright © 2022-2023 Intel Corporation                                  
>                                                                                 
>      */                                                                         
>                                                                                 
>                                                                                 
>                                                                                 
>     #ifndef _XE_GT_TYPES_H_                                                     
>                                                                                 
>    @@ -149,12 +149,14 @@   struct xe_gt {                                       
>                                                                                 
>                             * @io_size: IO size of this VRAM instance           
>                                                                                 
>                             *                                                   
>                                                                                 
>                             * This represents how much of this VRAM we can      
>    access                                                                       
>                                                                                 
>    -                        * via the CPU through the VRAM BAR. This can be     
>    smaller                                                                      
>                                                                                 
>    -                        * than @size, in which case only part of VRAM is    
>    CPU                                                                          
>                                                                                 
>    -                        * accessible (typically the first 256M). This       
>                                                                                 
>    -                        * configuration is known as small-bar.              
>                                                                                 
>    +                        * via the CPU through the VRAM BAR.                 
>                                                                                 
>    +                        * This can be smaller than the actual @size, in     
>    which                                                                        
>                                                                                 
>    +                        * case only part of VRAM is CPU accessible          
>    (typically                                                                   
>                                                                                 
>    +                        * the first 256M). This configuration is known as   
>    small-bar.                                                                   
>                                                                                 
>                             */                                                  
>                                                                                 
>                            resource_size_t io_size;                             
>                                                                                 
>    +                        /** @base: offset of VRAM starting base */          
>                                                                                 
>    +                        resource_size_t base;                               
>                                                                                 
>                            /** @size: size of VRAM. */                          
>                                                                                 
>                            resource_size_t size;                                
>                                                                                 
>                            /** @mapping: pointer to VRAM mappable space */      
>                                                                                 
>    diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c     
>                                                                                 
>    index 6c1591a4f43e..60c1b92a87f7 100644                                      
>                                                                                 
>    --- a/drivers/gpu/drm/xe/xe_mmio.c                                           
>                                                                                 
>    +++ b/drivers/gpu/drm/xe/xe_mmio.c                                           
>                                                                                 
>    @@ -3,6 +3,8 @@                                                              
>                                                                                 
>      * Copyright © 2021-2023 Intel Corporation                                  
>                                                                                 
>      */                                                                         
>                                                                                 
>                                                                                 
>                                                                                 
>    +#include <linux/minmax.h>                                                   
>                                                                                 
>    +                                                                            
>                                                                                 
>    #include "xe_mmio.h"                                                         
>                                                                                 
>                                                                                 
>                                                                                 
>     #include <drm/drm_managed.h>                                                
>                                                                                 
>    @@ -184,32 +186,83 @@   int xe_determine_lmem_bar_size(struct xe_device      
>    *xe)                                                                         
>                                                                                 
>           if (!xe->mem.vram.io_size)                                            
>                                                                                 
>                    return -EIO;                                                 
>                                                                                 
>                                                                                 
>                                                                                 
>    +       xe->mem.vram.base = 0; /* DPA offset */                              
>                                                                                 
>    +                                                                            
>                                                                                 
>           /* set up a map to the total memory area. */                          
>                                                                                 
>           xe->mem.vram.mapping = ioremap_wc(xe->mem.vram.io_start,              
>    xe->mem.vram.io_size);                                                       
>                                                                                 
>                                                                                 
>                                                                                 
>            return 0;                                                            
>                                                                                 
>    }                                                                            
>                                                                                 
>                                                                                 
>                                                                                 
>    +/*                                                                          
>                                                                                 
>    + * 4 possible sizes:                                                        
>                                                                                 
>    + * - io size (from pci_resource_len of LMEM bar)                            
>                                                                                 
>    + * - TILEx size                                                             
>                                                                                 
>    + * - GSMBASE offset (TILEx - "stolen")                                      
>                                                                                 
>    + * - CSSBASE offset (TILEx - CSS space necessary)                           
>                                                                                 
>    + *                                                                          
>                                                                                 
>    + * NOTE: CSSBASE is always lower/smaller offset then GSMBASE.               
>                                                                                 
>    + *                                                                          
>                                                                                 
>    + * The actual available size of memory is to the CCS or GSM base.           
>                                                                                 
>    + * NOTE: multi-tile bases will include the tile offset.                     
>                                                                                 
>    + */                                                                         
>                                                                                 
>    +int xe_mmio_vram_tile_size(struct xe_gt *gt, u64 *vram_size, u64            
>    *tile_size, u64 *tile_offset)                                                
>                                                                                 
>    +{                                                                           
>                                                                                 
>    +       u64 offset;                                                          
>                                                                                 
>    +       int err;                                                             
>                                                                                 
>    +       u32 reg;                                                             
>                                                                                 
>    +                                                                            
>                                                                                 
>    +       err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);                     
>                                                                                 
>    +       if (err)                                                             
>                                                                                 
>    +                return err;                                                 
>                                                                                 
>    +                                                                            
>                                                                                 
>    +       if (gt->xe->info.has_flat_ccs) {                                     
>                                                                                 
>    +                reg = xe_gt_mcr_unicast_read_any(gt,                        
>    XEHP_FLAT_CCS_BASE_ADDR);                                                    
>                                                                                 
>    +                offset = (u64)REG_FIELD_GET(GENMASK(31, 8), reg) *          
>    SZ_64K;                                                                      
>                                                                                 
>    +       } else {                                                             
>                                                                                 
>    +                offset = xe_mmio_read64(gt, GEN12_GSMBASE.reg);             
>                                                                                 
>    +       }                                                                    
>                                                                                 
>    +                                                                            
>                                                                                 
>    +       if (unlikely(gt->xe->info.platform == XE_DG1)) {                     
>                                                                                 
>    +                *tile_size = offset;                                        
>                                                                                 
>    +                *tile_offset = 0;                                           
>                                                                                 
>    +       } else {                                                             
>                                                                                 
>    +                reg = xe_gt_mcr_unicast_read_any(gt,                        
>    XEHP_TILE_ADDR_RANGE(gt->info.id));                                          
>                                                                                 
>    +                *tile_size = (u64)REG_FIELD_GET(GENMASK(14, 8), reg) *      
>    SZ_1G;                                                                       
>                                                                                 
>    +                *tile_offset = (u64)REG_FIELD_GET(GENMASK(7, 1), reg) *     
>    SZ_1G;                                                                       
>                                                                                 
>    +       }                                                                    
>                                                                                 
>    +                                                                            
>                                                                                 
>    +       /* remove the tile offset so we have just the available size */      
>                                                                                 
>    +       *vram_size = offset - *tile_offset;                                  
>                                                                                 
>    +                                                                            
>                                                                                 
>    +       return xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);                    
>                                                                                 
>    +}                                                                           
>                                                                                 
>    +                                                                            
>                                                                                 
>    int xe_mmio_probe_vram(struct xe_device *xe)                                 
>                                                                                 
>    {                                                                            
>                                                                                 
>    +       resource_size_t io_size;                                             
>                                                                                 
>    +       u64 available_size = 0;                                              
>                                                                                 
>    +       u64 total_size = 0;                                                  
>                                                                                 
>           struct xe_gt *gt;                                                     
>                                                                                 
>    +       u64 tile_offset;                                                     
>                                                                                 
>    +       u64 tile_size;                                                       
>                                                                                 
>    +       u64 vram_size;                                                       
>                                                                                 
>           int err;                                                              
>                                                                                 
>           u8 id;                                                                
>                                                                                 
>                                                                                 
>                                                                                 
>            if (!IS_DGFX(xe)) {                                                  
>                                                                                 
>    -                xe->mem.vram.mapping = 0;                                   
>                                                                                 
>    -                xe->mem.vram.io_start = 0;                                  
>                                                                                 
>    -                xe->mem.vram.io_size = 0;                                   
>                                                                                 
>    -                                                                            
>                                                                                 
>    -                for_each_gt(gt, xe, id) {                                   
>                                                                                 
>    -                        gt->mem.vram.mapping = 0;                           
>                                                                                 
>    -                        gt->mem.vram.size = 0;                              
>                                                                                 
>    -                        gt->mem.vram.io_start = 0;                          
>                                                                                 
>    -                        gt->mem.vram.io_size = 0;                           
>                                                                                 
>    -                }                                                           
>                                                                                 
>    +                memset(&xe->mem.vram, 0, sizeof(xe->mem.vram));             
>                                                                                 
>    +                for_each_gt(gt, xe, id)                                     
>                                                                                 
>    +                        memset(&gt->mem.vram, 0, sizeof(gt->mem.vram));     
>                                                                                 
>                   return 0;                                                     
>                                                                                 
>           }                                                                     
>                                                                                 
>                                                                                 
>                                                                                 
>    +       /* Get the size of the gt0 vram for later accessibility comparison   
>    */                                                                           
>                                                                                 
>    +       gt = xe_device_get_gt(xe, 0);                                        
>                                                                                 
>    +       err = xe_mmio_vram_tile_size(gt, &vram_size, &tile_size,             
>    &tile_offset);                                                               
>                                                                                 
>    +       if (err)                                                             
>                                                                                 
>    +                return err;                                                 
>                                                                                 
>    +                                                                            
>                                                                                 
>           err = xe_determine_lmem_bar_size(xe);                                 
>                                                                                 
>           if (err)                                                              
>                                                                                 
>                    return err;                                                  
>                                                                                 
>    @@ -217,57 +270,53 @@   int xe_mmio_probe_vram(struct xe_device *xe)         
>                                                                                 
>           drm_info(&xe->drm, "VISIBLE VRAM: %pa, %pa\n",                        
>    &xe->mem.vram.io_start,                                                      
>                                                                                 
>                     &xe->mem.vram.io_size);                                     
>                                                                                 
>                                                                                 
>                                                                                 
>    -       /* FIXME: Assuming equally partitioned VRAM, incorrect */            
>                                                                                 
>    -       if (xe->info.tile_count > 1) {                                       
>                                                                                 
>    -                u8 adj_tile_count = xe->info.tile_count;                    
>                                                                                 
>    -                resource_size_t size, io_start, io_size;                    
>                                                                                 
>    +       /* small bar issues will only cover gt0 sizes */                     
>                                                                                 
>    +       if (xe->mem.vram.io_size < vram_size)                                
>                                                                                 
>    +                drm_warn(&xe->drm, "Restricting VRAM size to PCI resource   
>    size (0x%llx->0x%llx)\n",                                                    
>                                                                                 
>    +                        vram_size, (u64)xe->mem.vram.io_size);              
>                                                                                 
>                                                                                 
>                                                                                 
>    -                for_each_gt(gt, xe, id)                                     
>                                                                                 
>    -                        if (xe_gt_is_media_type(gt))                        
>                                                                                 
>    -                                --adj_tile_count;                           
>                                                                                 
>    +       io_size = xe->mem.vram.io_size;                                      
>                                                                                 
>                                                                                 
>                                                                                 
>    -                XE_BUG_ON(!adj_tile_count);                                 
>                                                                                 
>    +       /* gt specific ranges */                                             
>                                                                                 
>    +       for_each_gt(gt, xe, id) {                                            
>                                                                                 
>    +                if (xe_gt_is_media_type(gt))                                
>                                                                                 
>    +                        continue;                                           
>                                                                                 
>                                                                                 
>                                                                                 
>    -                size = xe->mem.vram.io_size / adj_tile_count;               
>                                                                                 
>    -                io_start = xe->mem.vram.io_start;                           
>                                                                                 
>    -               io_size = xe->mem.vram.io_size;                              
>                                                                                 
>    +                err = xe_mmio_vram_tile_size(gt, &vram_size, &tile_size,    
>    &tile_offset);                                                               
>                                                                                 
>    +                if (err)                                                    
>                                                                                 
>    +                        return err;                                         
>                                                                                 
>                                                                                 
>                                                                                 
>    -                for_each_gt(gt, xe, id) {                                   
>                                                                                 
>    -                        if (id && !xe_gt_is_media_type(gt)) {               
>                                                                                 
>    -                                io_size -= min(io_size, size);              
>                                                                                 
>    -                                io_start += io_size;                        
>                                                                                 
>    -                        }                                                   
>                                                                                 
>    +                gt->mem.vram.io_start = xe->mem.vram.io_start +             
>    tile_offset;                                                                 
>                                                                                 
>                                                                                 
>                                                                                 
>    -                        gt->mem.vram.size = size;                           
>                                                                                 
>    -                                                                            
>                                                                                 
>    -                        /*                                                  
>                                                                                 
>    -                        * XXX: multi-tile small-bar might be wild.          
>    Hopefully                                                                    
>                                                                                 
>    -                        * full tile without any mappable vram is not        
>    something                                                                    
>                                                                                 
>    -                        * we care about.                                    
>                                                                                 
>    -                        */                                                  
>                                                                                 
>    -                                                                            
>                                                                                 
>    -                        gt->mem.vram.io_size = min(size, io_size);          
>                                                                                 
>    -                        if (io_size) {                                      
>                                                                                 
>    -                                gt->mem.vram.io_start = io_start;           
>                                                                                 
>    -                                gt->mem.vram.mapping =                      
>    xe->mem.vram.mapping +                                                       
>                                                                                 
>    -                                         (io_start -                        
>    xe->mem.vram.io_start);                                                      
>                                                                                 
>    -                        } else {                                            
>                                                                                 
>    -                                drm_err(&xe->drm, "Tile without any CPU     
>    visible VRAM. Aborting.\n");                                                 
>                                                                                 
>    -                                return -ENODEV;                             
>                                                                                 
>    -                        }                                                   
>                                                                                 
>    +                /* io_size "could be 0" for small-bar systems, so no CPU    
>    access */                                                                    
>                                                                                 
>    +                gt->mem.vram.io_size = min_t(u64, vram_size, io_size);      
>                                                                                 
>    +                                                                            
>                                                                                 
>    +                gt->mem.vram.base = xe->mem.vram.base + tile_offset;        
>                                                                                 
>    +                gt->mem.vram.size = vram_size;                              
>                                                                                 
>    +                gt->mem.vram.mapping = xe->mem.vram.mapping +               
>    tile_offset;                                                                 
>                                                                                 
>    +                                                                            
>                                                                                 
>    +                drm_info(&xe->drm, "VRAM[%u, %u]: %pa, %pa\n", id,          
>    gt->info.vram_id,                                                            
>                                                                                 
>    +                        &gt->mem.vram.io_start, &gt->mem.vram.size);        
>                                                                                 
>    +                                                                            
>                                                                                 
>    +                if (gt->mem.vram.io_size < gt->mem.vram.size)               
>                                                                                 
>    +                        drm_info(&xe->drm, "VRAM[%u, %u]: CPU access        
>    limited to %pa\n", id,                                                       
>                                                                                 
>    +                                gt->info.vram_id, &gt->mem.vram.io_size);   
>                                                                                 
>    +                                                                            
>                                                                                 
>    +                /* calculate total size using tile size to get the          
>    correct HW sizing */                                                         
>                                                                                 
>    +                total_size += tile_size;                                    
>                                                                                 
>    +                available_size += vram_size;                                
>                                                                                 
>    I think you can make this available_size = vram_size; instead as last GT     
>    for which this loop runs,                                                    
>                                                                                 
>    Will get total available size. Otherwise you may get more size than actual   
>    available. For example,                                                      
>                                                                                 
>    10 bytes for tile0, 10 bytes for tile1, 20 bytes for tile2 should return     
>    total 40b, but I think with                                                  
>                                                                                 
>    Above logic you will get 10 + 20 + 40. I am assuming offset is incremental   
>    per tile. If you can give                                                    
>                                                                                 
>    Memory offset overall snapshot, that might help in case I am wrong.          
>                                                                                 
>                                                                                 
>                                                                                 
>    [mjruhl] vram_size, tile_size, and tile_offset are accessed for each gt.     
>    so vram_size is the “tile size – any stolen” portion.  So                    
>                                                                                 
>    vram should be the “available memory for the specific tile”, not an          
>    accumulation of tiles.  So the addition should be 10 + 10 + 20.              
>                                                                                 
>    I will double check my logic.                                                
>                                                                                 
>                                                                                 
>                                                                                 
>    -                        drm_info(&xe->drm, "VRAM[%u, %u]: %pa, %pa\n",      
>                                                                                 
>    -                                id, gt->info.vram_id,                       
>    &gt->mem.vram.io_start,                                                      
>                                                                                 
>    -                                &gt->mem.vram.size);                        
>                                                                                 
>    +                if (total_size > xe->mem.vram.io_size) {                    
>                                                                                 
>    +                        drm_warn(&xe->drm, "VRAM: %pa is larger than        
>    resource %pa\n",                                                             
>                                                                                 
>    +                                &total_size, &xe->mem.vram.io_size);        
>                                                                                 
>                                                                                 
>                                                                                 
>                    }                                                            
>                                                                                 
>    -       } else {                                                             
>                                                                                 
>    -                gt->mem.vram.size = xe->mem.vram.io_size;                   
>                                                                                 
>    -                gt->mem.vram.io_start = xe->mem.vram.io_start;              
>                                                                                 
>    -                gt->mem.vram.io_size = xe->mem.vram.io_size;                
>                                                                                 
>    -                gt->mem.vram.mapping = xe->mem.vram.mapping;                
>                                                                                 
>                                                                                 
>                                                                                 
>    -                drm_info(&xe->drm, "VRAM: %pa\n", &gt->mem.vram.size);      
>                                                                                 
>    +                io_size -= min_t(u64, tile_size, io_size);                  
>                                                                                 
>           }                                                                     
>                                                                                 
>    +                                                                            
>                                                                                 
>    +       drm_info(&xe->drm, "Available VRAM: %pa, %pa\n",                     
>    &xe->mem.vram.io_start,                                                      
>                                                                                 
>    +                &available_size);                                           
>                                                                                 
>    +                                                                            
>                                                                                 
>    Here it can be little more readable, but its my opinion, up to you :         
>                                                                                 
>    drm_info(&xe->drm, "Available VRAM: start addr: %pa, size: %pa\n",           
>    &xe->mem.vram.io_start,                                                      
>                                                                                 
>                     &available_size);                                           
>                                                                                 
>    [mjruhl] Yeah waffled on adding the start/addr info.  Will add.              
>                                                                                 
>                                                                                 
>                                                                                 
>           return 0;                                                             
>                                                                                 
>    }                                                                            
>                                                                                 
>                                                                                 
>                                                                                 
>    @@ -287,9 +336,6 @@   static void xe_mmio_probe_tiles(struct xe_device       
>    *xe)                                                                         
>                                                                                 
>           if (xe->info.media_verx100 >= 1300)                                   
>                                                                                 
>                    xe->info.tile_count *= 2;                                    
>                                                                                 
>                                                                                 
>                                                                                 
>    -       drm_info(&xe->drm, "tile_count: %d, adj_tile_count %d\n",            
>                                                                                 
>    -                xe->info.tile_count, adj_tile_count);                       
>                                                                                 
>    -                                                                            
>                                                                                 
>           if (xe->info.tile_count > 1) {                                        
>                                                                                 
>                    const int mmio_bar = 0;                                      
>                                                                                 
>                    size_t size;                                                 
>                                                                                 
>    diff --git a/drivers/gpu/drm/xe/xe_mmio.h b/drivers/gpu/drm/xe/xe_mmio.h     
>                                                                                 
>    index 1a32e0f52261..1c588db0b074 100644                                      
>                                                                                 
>    --- a/drivers/gpu/drm/xe/xe_mmio.h                                           
>                                                                                 
>    +++ b/drivers/gpu/drm/xe/xe_mmio.h                                           
>                                                                                 
>    @@ -1,6 +1,6 @@                                                              
>                                                                                 
>     /* SPDX-License-Identifier: MIT */                                          
>                                                                                 
>    /*                                                                           
>                                                                                 
>    - * Copyright © 2021 Intel Corporation                                       
>                                                                                 
>    + * Copyright © 2021-2023 Intel Corporation                                  
>                                                                                 
>      */                                                                         
>                                                                                 
>                                                                                 
>                                                                                 
>     #ifndef _XE_MMIO_H_                                                         
>                                                                                 
>    @@ -120,6 +120,6 @@   static inline bool xe_mmio_in_range(const struct       
>    xe_mmio_range *range, u32 reg)                                               
>                                                                                 
>    }                                                                            
>                                                                                 
>                                                                                 
>                                                                                 
>     int xe_mmio_probe_vram(struct xe_device *xe);                               
>                                                                                 
>    -int xe_mmio_total_vram_size(struct xe_device *xe, u64 *vram_size, u64       
>    *flat_ccs_base);                                                             
>                                                                                 
>    +int xe_mmio_vram_tile_size(struct xe_gt *gt, u64 *vram_size, u64            
>    *tile_size, u64 *tile_offset);                                               
>                                                                                 
>                                                                                 
>                                                                                 
>     #endif                                                                      
>                                                                                 
>    diff --git a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c                          
>    b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c                                     
>                                                                                 
>    index 9136c035db0e..acc11f580db4 100644                                      
>                                                                                 
>    --- a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c                                 
>                                                                                 
>    +++ b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c                                 
>                                                                                 
>    @@ -12,9 +12,11 @@                                                           
>                                                                                 
>     #include <drm/ttm/ttm_range_manager.h>                                      
>                                                                                 
>                                                                                 
>                                                                                 
>     #include "regs/xe_regs.h"                                                   
>                                                                                 
>    +#include "regs/xe_gt_regs.h"                                                
>                                                                                 
>    #include "xe_bo.h"                                                           
>                                                                                 
>    #include "xe_device.h"                                                       
>                                                                                 
>    #include "xe_gt.h"                                                           
>                                                                                 
>    +#include "xe_gt_mcr.h"                                                      
>                                                                                 
>    #include "xe_mmio.h"                                                         
>                                                                                 
>    #include "xe_res_cursor.h"                                                   
>                                                                                 
>    #include "xe_ttm_stolen_mgr.h"                                               
>                                                                                 
>    @@ -51,21 +53,26 @@   bool xe_ttm_stolen_cpu_access_needs_ggtt(struct        
>    xe_device *xe)                                                               
>                                                                                 
>           return GRAPHICS_VERx100(xe) < 1270 && !IS_DGFX(xe);                   
>                                                                                 
>    }                                                                            
>                                                                                 
>                                                                                 
>                                                                                 
>    -static s64 detect_bar2_dgfx(struct xe_device *xe, struct                    
>    xe_ttm_stolen_mgr *mgr)                                                      
>                                                                                 
>    +static s64 detect_bar2_dgfx(struct xe_gt *gt, struct xe_ttm_stolen_mgr      
>    *mgr)                                                                        
>                                                                                 
>    {                                                                            
>                                                                                 
>    -       u64 vram_size, stolen_size;                                          
>                                                                                 
>    +       u64 stolen_size;                                                     
>                                                                                 
>    +       u64 tile_offset;                                                     
>                                                                                 
>    +       u64 tile_size;                                                       
>                                                                                 
>    +       u64 vram_size;                                                       
>                                                                                 
>                                                                                 
>                                                                                 
>    -       vram_size = xe->mem.vram.io_size;                                    
>                                                                                 
>    +       if (drm_WARN_ON(&gt->xe->drm,                                        
>                                                                                 
>    +                        xe_mmio_vram_tile_size(gt, &vram_size,              
>    &tile_size, &tile_offset)) < 0)                                              
>                                                                                 
>    +                return 0;                                                   
>                                                                                 
>                                                                                 
>                                                                                 
>            /* Use DSM base address instead for stolen memory */                 
>                                                                                 
>    -       mgr->stolen_base = xe_mmio_read64(to_gt(xe), GEN12_DSMBASE.reg) &    
>    GEN12_BDSM_MASK;                                                             
>                                                                                 
>    -       if (drm_WARN_ON(&xe->drm, vram_size < mgr->stolen_base))             
>                                                                                 
>    +       mgr->stolen_base = (xe_mmio_read64(gt, GEN12_DSMBASE.reg) &          
>    GEN12_BDSM_MASK) - tile_offset;                                              
>                                                                                 
>    +       if (drm_WARN_ON(&gt->xe->drm, tile_size < mgr->stolen_base))         
>                                                                                 
>                    return 0;                                                    
>                                                                                 
>                                                                                 
>                                                                                 
>    -       stolen_size = vram_size - mgr->stolen_base;                          
>                                                                                 
>    +       stolen_size = tile_size - mgr->stolen_base;                          
>                                                                                 
>    Should it be tile_offset instead,                                            
>                                                                                 
>    stolen_size = tile_offset - mgr->stolen_base;                                
>                                                                                 
>    [mjruhl] The DSMBASE value (register)will be the offset to the DSM plus      
>    the tile offset.  So I need to subtract the tile_offset                      
>                                                                                 
>    from the register value to get the base.  Once we get the base, the size     
>    is calculated with the above tile_size value.                                
>                                                                                 
>    Thank you for your comments!                                                 
>                                                                                 
>    M                                                                            
>                                                                                 
>                                                                                 
>                                                                                 
>    Thanks,                                                                      
>                                                                                 
>    Tejas                                                                        
>                                                                                 
>    -       if (mgr->stolen_base + stolen_size <= vram_size)                     
>                                                                                 
>    -                mgr->io_base = xe->mem.vram.io_start + mgr->stolen_base;    
>                                                                                 
>    +       if (mgr->stolen_base + stolen_size <= tile_size)                     
>                                                                                 
>    +                mgr->io_base = gt->mem.vram.io_start + mgr->stolen_base;    
>                                                                                 
>                                                                                 
>                                                                                 
>            /*                                                                   
>                                                                                 
>            * There may be few KB of platform dependent reserved memory at the   
>    end                                                                          
>                                                                                 
>    @@ -133,7 +140,7 @@   void xe_ttm_stolen_mgr_init(struct xe_device *xe)      
>                                                                                 
>           int err;                                                              
>                                                                                 
>                                                                                 
>                                                                                 
>            if (IS_DGFX(xe))                                                     
>                                                                                 
>    -                stolen_size = detect_bar2_dgfx(xe, mgr);                    
>                                                                                 
>    +                stolen_size = detect_bar2_dgfx(to_gt(xe), mgr);             
>                                                                                 
>           else if (GRAPHICS_VERx100(xe) >= 1270)                                
>                                                                                 
>                    stolen_size = detect_bar2_integrated(xe, mgr);               
>                                                                                 
>           else                                                                  
>                                                                                 
>                                                                                 
