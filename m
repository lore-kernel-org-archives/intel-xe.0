Return-Path: <intel-xe-bounces@lists.freedesktop.org>
Date: Tue, 24 Jan 2023 10:44:47 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
Message-ID: <Y8/87yxfO0zY1sYz@intel.com>
References: <20230112222538.2000142-1-rodrigo.vivi@intel.com>
 <20230112222538.2000142-27-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230112222538.2000142-27-rodrigo.vivi@intel.com>
MIME-Version: 1.0
Subject: Re: [Intel-xe] [PATCH 26/37] Revert "drm/xe: Validate BO on CPU
 fault"
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
To: intel-xe@lists.freedesktop.org, matthew.brost@intel.com, maarten.lankhorst@linux.intel.com, philippe.lecluse@intel.com, mchehab@kernel.org

On Thu, Jan 12, 2023 at 05:25:27PM -0500, Rodrigo Vivi wrote:
> From: Matthew Brost <matthew.brost@intel.com>
> 
> This reverts commit 48d84660be7607ccaacd76a2d653f51709cc5693.

Hi Matt, this commit doesn't exist after the big squased initial patch.
Could you please reply here with a commit subject and message?
I will add on a next interaction or when merging it.

Thanks,
Rodrigo.

> 
> Cc: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_bo.c | 13 ++++++-------
>  1 file changed, 6 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index da2c8a1c19ec..e224405bc4f6 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -875,14 +875,13 @@ static vm_fault_t xe_gem_fault(struct vm_fault *vmf)
>  
>  		trace_xe_bo_cpu_fault(bo);
>  
> -		if (should_migrate_to_system(bo))
> +		if (should_migrate_to_system(bo)) {
>  			r = xe_bo_migrate(bo, XE_PL_TT);
> -		else
> -			r = xe_bo_validate(bo, NULL, false);
> -		if (r == -EBUSY || r == -ERESTARTSYS)
> -			ret = VM_FAULT_NOPAGE;
> -		else if (r)
> -			ret = VM_FAULT_SIGBUS;
> +			if (r == -EBUSY || r == -ERESTARTSYS || r == -EINTR)
> +				ret = VM_FAULT_NOPAGE;
> +			else if (r)
> +				ret = VM_FAULT_SIGBUS;
> +		}
>  		if (!ret)
>  			ret = ttm_bo_vm_fault_reserved(vmf,
>  						       vmf->vma->vm_page_prot,
> -- 
> 2.38.1
> 

