Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F1E5C282CD
	for <intel-xe@archiver.kernel.org>; Mon,  3 Mar 2025 14:07:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B49310E420;
	Mon,  3 Mar 2025 14:07:07 +0000 (UTC)
Received: from mail.nfschina.com (unknown [42.101.60.213])
 by gabe.freedesktop.org (Postfix) with SMTP id 64C4110E274;
 Fri, 28 Feb 2025 03:33:56 +0000 (UTC)
Received: from [172.30.20.101] (unknown [180.167.10.98])
 by mail.nfschina.com (MailData Gateway V2.8.8) with ESMTPSA id C9C7B60A7A1EB; 
 Fri, 28 Feb 2025 11:33:44 +0800 (CST)
Message-ID: <558dba45-28e2-f8b0-f478-5b22c33c4fd6@nfschina.com>
Date: Fri, 28 Feb 2025 11:33:44 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Re: [PATCH] drm/xe: Select INTEL_VSEC to fix build dependency
Content-Language: en-US
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>
Cc: thomas.hellstrom@linux.intel.com, rodrigo.vivi@intel.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, ilpo.jarvinen@linux.intel.com,
 andriy.shevchenko@linux.intel.com, michael.j.ruhl@intel.com,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
X-MD-Sfrom: suhui@nfschina.com
X-MD-SrcIP: 180.167.10.98
From: Su Hui <suhui@nfschina.com>
In-Reply-To: <bwirms6gvkvu7guxlzmmlbxb3df6qctuqedarccqer4lsu3ehx@5n3jg2ujryxb>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 03 Mar 2025 14:07:06 +0000
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

On 2025/2/28 00:03, Lucas De Marchi wrote:
> On Thu, Feb 27, 2025 at 03:32:06PM +0800, Su Hui wrote:
>> When build randconfig, there is an error:
>> ld: drivers/gpu/drm/xe/xe_vsec.o: in function `xe_vsec_init':
>> xe_vsec.c:(.text+0x182): undefined reference to `intel_vsec_register'
>>
>> When CONFIG_DRM_XE=y and CONFIG_INTEL_VSEC=m is set, ld couldn't find
>> 'intel_vsec_register'. Select INTEL_VSEC to fix this error.
>>
>> Fixes: 0c45e76fcc62 ("drm/xe/vsec: Support BMG devices")
>> Signed-off-by: Su Hui <suhui@nfschina.com>
>> ---
>> drivers/gpu/drm/xe/Kconfig | 1 +
>> 1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
>> index b51a2bde73e2..7a60d96d2dd6 100644
>> --- a/drivers/gpu/drm/xe/Kconfig
>> +++ b/drivers/gpu/drm/xe/Kconfig
>> @@ -44,6 +44,7 @@ config DRM_XE
>>     select WANT_DEV_COREDUMP
>>     select AUXILIARY_BUS
>>     select HMM_MIRROR
>> +    select INTEL_VSEC
>
> intel_vsec is an x86 platform driver. I think we probably want to add a
> config that depends on INTEL_VSEC rather than selecting it like this.
> At the very least we need and `if x86` and also make sure the driver
> works without that part.
>
There is a recursive dependency between INTEL_VSEC and DRM_XE:

         symbol DRM_XE depends on INTEL_VSEC
         symbol INTEL_VSEC depends on X86_PLATFORM_DEVICES
         symbol X86_PLATFORM_DEVICES is selected by DRM_XE

So if using 'depends on INTEL_VSEC', we should remove 'select 
X86_PLATFORM_DEVICES', like this one:

  config DRM_XE
         tristate "Intel Xe Graphics"
         depends on DRM && PCI && MMU && (m || (y && KUNIT=y))
+       depends on !X86 || INTEL_VSEC || INTEL_VSEC=n
+       depends on !X86 || !ACPI || ACPI_WMI
         select INTERVAL_TREE
         # we need shmfs for the swappable backing store, and in particular
         # the shmem_readpage() which depends upon tmpfs
@@ -27,8 +29,6 @@ config DRM_XE
         select BACKLIGHT_CLASS_DEVICE if ACPI
         select INPUT if ACPI
         select ACPI_VIDEO if X86 && ACPI
-       select X86_PLATFORM_DEVICES if X86 && ACPI
-       select ACPI_WMI if X86 && ACPI

The 'select X86_PLATFORM_DEVICES' is introduced by 67a9e86dc130 
("drm/xe: select
X86_PLATFORM_DEVICES when ACPI_WMI is selected"), so both ACPI_WMI need 
to be changed.

Another choice is using 'select INTEL_VSEC if X86' and no need to change 
other things.
Any suggestion for these two choices?


