Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67C38606A320
	for <intel-xe@archiver.kernel.org>; Tue, 27 Oct 2026 13:15:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F92F10F4B2;
	Tue, 27 Oct 2026 13:15:57 +0000 (UTC)
X-Greylist: delayed 972 seconds by postgrey-1.36 at gabe;
 Fri, 23 Oct 2026 20:43:48 UTC
Received: from mxout013.mail.hostpoint.ch (mxout013.mail.hostpoint.ch
 [217.26.49.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71F2810E6E7
 for <intel-xe@lists.freedesktop.org>; Fri, 23 Oct 2026 20:43:48 +0000 (UTC)
Received: from asmtp013.mail.hostpoint.internal ([10.4.1.186]
 helo=asmtp013.mail.hostpoint.ch)
 by mxout013.mail.hostpoint.ch with esmtps (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.99.5 (FreeBSD)) (envelope-from <rodolfo@semprevivo.ch>)
 id 1xKLrS-00000000HYt-12Bo; Fri, 23 Oct 2026 22:27:34 +0200
Received: from [157.143.51.59] (helo=[192.168.1.164])
 by asmtp013.mail.hostpoint.ch with esmtpsa (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.99.5 (FreeBSD)) (envelope-from <rodolfo@semprevivo.ch>)
 id 1xKLrS-00000000OEN-0Ozm; Fri, 23 Oct 2026 22:27:34 +0200
X-Authenticated-Sender-Id: rodolfo@semprevivo.ch
Message-ID: <91bd4409-8121-4919-8556-8b49ec8f9304@semprevivo.ch>
Date: Fri, 23 Oct 2026 22:27:32 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-usb@vger.kernel.org
Cc: mathias.nyman@linux.intel.com, heikki.krogerus@linux.intel.com,
 intel-xe@lists.freedesktop.org
References: <ef5ba6ff-ed50-4bb6-ae6d-fb11f0a47954@semprevivo.ch>
Subject: =?UTF-8?Q?Panther_Lake_UCSI=3A_PPM_forces_DP_alt_mode_pin_assignmen?=
 =?UTF-8?Q?t_D_=282_lanes=29_for_C/E-only_partner=2C_no_4K60_=28was=3A_=5BBU?=
 =?UTF-8?Q?G=5D_Type-C_Subsystem_xHCI_=288086=3Ae331=2C_Panther_Lake=29_?=
 =?UTF-8?Q?=E2=80=94_repeated_err_-71_/_port_reset_failures_under_sustained_?=
 =?UTF-8?Q?DP+HID_load=29?=
Content-Language: en-US
From: Rodolfo Semprevivo <rodolfo@semprevivo.ch>
In-Reply-To: <ef5ba6ff-ed50-4bb6-ae6d-fb11f0a47954@semprevivo.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 27 Oct 2026 13:15:56 +0000
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
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

follow-up to my report below, with a corrected analysis. The xHCI was
the wrong suspect: the -71 errors come from the monitor's internal USB
2.0 hub, which sits on the standalone xHCI (8086:e37d, 00:14.0), not on
8086:e331. They only appear because the monitor resets when the DP link
fails.

Root cause: on the left TB4 port the PPM/EC configures DP alt mode with
pin assignment D (2 lanes), although the monitor only advertises C and E:

   port0-partner.0: svid ff01, active yes, vdo 0x00140045
   displayport/pin_assignment: C E   (nothing selected)
   displayport/configuration: [USB] sink
   xe: Port D/TC#1: TC port mode reset (disconnected -> dp-alt) pin 
assignment: D max lanes: 2
   xe: [LTTPR 1] Link Training passed at link rate = 540000, lane count = 2

2x HBR2 is not enough for 3840x2160@60 (594 MHz), so the picture drops
regardless of bpc/HDR. Lower resolutions at 60 Hz work. This also
explains why the dGPU route via the MUX failed identically: the lane
split is decided by the firmware, not by the GPU driver.

For comparison, an Alder Lake ASUS GU603ZW on the same kernel, with the
same monitor and cable:

   i915: Port D/TC#1: ... pin assignment: C max lanes: 4
   i915: Link Training passed at link rate = 540000, lane count = 4

and 4K60 is stable.

Linux cannot correct this. Writes to pin_assignment/configuration fail
with EOPNOTSUPP:

   typec_displayport port0-partner.0: firmware doesn't support alternate 
mode overriding
   ucsi_acpi USBC000:00: UCSI_GET_PDOS failed (-95)

So this looks like a firmware issue (reported to ASUS as well).
Questions:
1. Is the PPM choosing pin assignment D for a partner that does not
    advertise D a known issue on Panther Lake?
2. Should Linux warn about it (partner VDO lacks D but FIA reports D),
    or avoid the resulting 2-lane DSC mode?

System: ASUS ROG Zephyrus G16 GU606AX (Panther Lake, Core Ultra 9 386H),
BIOS GU606AX.304, kernel 7.3.0-4 (CachyOS), monitor ASUS ProArt
PA169CDV. Bug report: https://paste.cachyos.org/p/83e1bcf.log
Full drm.debug log available on request.

Thanks,
Rodolfo

