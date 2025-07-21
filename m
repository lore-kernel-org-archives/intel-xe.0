Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 477DAC83F34
	for <intel-xe@archiver.kernel.org>; Tue, 22 Jul 2025 12:46:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E3D610E677;
	Tue, 22 Jul 2025 12:46:36 +0000 (UTC)
X-Greylist: delayed 443 seconds by postgrey-1.36 at gabe;
 Mon, 21 Jul 2025 21:59:52 UTC
Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD66410E089
 for <intel-xe@lists.freedesktop.org>; Mon, 21 Jul 2025 21:59:52 +0000 (UTC)
Received: from [192.168.0.105] (unknown [114.241.87.235])
 by APP-01 (Coremail) with SMTP id qwCowABHNqqTtn5oK_EvBg--.13363S2;
 Tue, 22 Jul 2025 05:52:20 +0800 (CST)
Message-ID: <dca5e72c-ab77-4bcc-af3b-8ac504f3629e@iscas.ac.cn>
Date: Tue, 22 Jul 2025 05:52:19 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] PCI: hide mysterious 8MB 64-bit pref BAR on Intel Arc
 PCIe Switch
To: Icenowy Zheng <uwu@icenowy.me>, Bjorn Helgaas <bhelgaas@google.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: linux-pci@vger.kernel.org, intel-xe@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Han Gao <rabenda.cn@gmail.com>
References: <20250721173057.867829-1-uwu@icenowy.me>
Content-Language: en-US
From: Vivian Wang <wangruikang@iscas.ac.cn>
In-Reply-To: <20250721173057.867829-1-uwu@icenowy.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: qwCowABHNqqTtn5oK_EvBg--.13363S2
X-Coremail-Antispam: 1UD129KBjvJXoWxXryxtF17tw43tr1UJFW8Zwb_yoWrJF15pF
 WrGwsagr93tFy7WwsrZw129rZYvan5G34Ykr9Fvr9FvanxC345K39rtFn0qFy7WrZ7Wa1r
 Xay5t347Ga4Du3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUkab7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
 0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
 A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xII
 jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwV
 C2z280aVCY1x0267AKxVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVAC
 Y4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJV
 W8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7CjxVAaw2AFwI0_Jw0_GFyl
 42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJV
 WUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAK
 I48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r
 4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY
 6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07betCcUUUUU=
X-Originating-IP: [114.241.87.235]
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/
X-Mailman-Approved-At: Tue, 22 Jul 2025 12:46:35 +0000
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

On 7/22/25 01:30, Icenowy Zheng wrote:

> The upstream port device of Intel Arc series dGPUs' internal PCIe switch
> contains a mysterious 8MB 64-bit prefetchable BAR. All reads to memory
> mapped to that BAR returns 0xFFFFFFFF and writes have no effect.

Reading all-ones is certainly not a good indication that this BAR does
nothing. My guess would be that maybe it's some write-only registers
like MSI doorbells.

AMD has docs on how their GPUs have a tiny doorbell default-2M 64bit
pref BAR [1], which I find interesting, even though very indirect as
evidence.

[1]: https://rocm.docs.amd.com/en/latest/how-to/Bar-Memory.html#bar-configuration-for-amd-gpus

> When the PCI bus isn't configured by any firmware (e.g. a PCIe
> controller solely initialized by Linux kernel), the PCI space allocation
> algorithm of Linux will allocate the main VRAM BAR of Arc dGPU device at
> base+0, and then the 8MB BAR at base+256M, which prevents the main VRAM
> BAR gets resized. As the functionality and performance of Arc dGPU will
> get severely restricted with small BAR, this makes a problem.

While trying to look around for if any documentation is available on the
"mysterious BAR", I found that this problem has indeed been discovered
before with no satisfactory resolution. Linking for posterity:

[2]: https://issues.redhat.com/browse/RHEL-3672
[3]: https://github.com/raspberrypi/linux/issues/6621

If my doorbell theory was correct, and that this is analogous for
amdgpu, there is this interesting comment in
drivers/gpu/drm/amd/amdgpu/amdgpu_device.c since commit d6895ad39f3b
("drm/amdgpu: resize VRAM BAR for CPU access v6"):

  /* Free the VRAM and doorbell BAR, we most likely need to move both. */

That seems to be the right way *if* it makes sense that the "mysterious
BAR" is supposed to be managed by the GPU driver. Of course, only
someone from Intel can confirm for sure what's going on...

Vivian "dramforever" Wang

> Hide the mysterious 8MB BAR to Linux PCI subsystem, to allow resizing
> the VRAM BAR to VRAM size with the Linux PCI space allocation algorithm.
>
> Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
> ---
>  drivers/pci/quirks.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>
> diff --git a/drivers/pci/quirks.c b/drivers/pci/quirks.c
> index d7f4ee634263..df304bfec6e9 100644
> --- a/drivers/pci/quirks.c
> +++ b/drivers/pci/quirks.c
> @@ -3650,6 +3650,22 @@ DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_INTEL, 0x37d0, quirk_broken_intx_masking);
>  DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_INTEL, 0x37d1, quirk_broken_intx_masking);
>  DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_INTEL, 0x37d2, quirk_broken_intx_masking);
>  
> +/*
> + * Intel Arc dGPUs' internal switch upstream port contains a mysterious 8MB
> + * 64-bit prefetchable BAR that blocks resize of main dGPU VRAM BAR with
> + * Linux's PCI space allocation algorithm.
> + */
> +static void quirk_intel_xe_upstream(struct pci_dev *pdev)
> +{
> +	memset(&pdev->resource[0], 0, sizeof(pdev->resource[0]));
> +}
> +/* Intel Arc A380 PCI Express Switch Upstream Port */
> +DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_INTEL, 0x4fa1, quirk_intel_xe_upstream);
> +/* Intel Arc A770 PCI Express Switch Upstream Port */
> +DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_INTEL, 0x4fa0, quirk_intel_xe_upstream);
> +/* Intel Arc B580 PCI Express Switch Upstream Port */
> +DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_INTEL, 0xe2ff, quirk_intel_xe_upstream);
> +
>  static u16 mellanox_broken_intx_devs[] = {
>  	PCI_DEVICE_ID_MELLANOX_HERMON_SDR,
>  	PCI_DEVICE_ID_MELLANOX_HERMON_DDR,

