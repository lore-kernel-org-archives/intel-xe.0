Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE777CAC59A
	for <intel-xe@archiver.kernel.org>; Thu, 18 Sep 2025 12:01:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DA7110E75A;
	Thu, 18 Sep 2025 12:01:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YFkGb0fS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BF3010E751;
 Thu, 18 Sep 2025 12:01:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758196877; x=1789732877;
 h=date:from:to:cc:subject:in-reply-to:message-id:
 references:mime-version;
 bh=3VrV0r/7sFyl5F4TubYigAv7VWt8XYYaz1UaEADQbj4=;
 b=YFkGb0fSGmrUhCoB3PoW7ZBUEECHwemeXeLh1HQ9y1kqESfdV5wsS1HU
 p6gavx1b2QrTVvEgF3r98R4aZcls2ivY+zEAfimYPLKfKlrJLOWHyHihI
 Xch77ccpvXupsvtTeuf9XBKnFCZNKDdAH96qHt02oQtxmTHnRMltFW+oa
 sl5ZNPHyadrtNK3PvQtQ+F6InMKiVLOd5y9BTZaGGYgTcxIgcFv81W8lG
 X/cbeteuJoMyXKTyH/MMWrWIZoFmyKaCq0Gutl0cagk4DRvdddHiw8IDD
 /+CBBNdZBWCt+5l80n5jv6asg8ak9oK1Vd9/gXahBKez0jAg9qZLNsu0l Q==;
X-CSE-ConnectionGUID: lg1xUXY0TUye3RBBLGBxeQ==
X-CSE-MsgGUID: JOr6H+ykQWSIKJV7yNoaOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11556"; a="64152842"
X-IronPort-AV: E=Sophos;i="6.18,274,1751266800"; d="scan'208,223";a="64152842"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2025 05:01:14 -0700
X-CSE-ConnectionGUID: 1bXq6OUiQ0+bDkEDPZAGdA==
X-CSE-MsgGUID: VbCcxOdoQ8+6Pv0mBfe3Yw==
X-ExtLoop1: 1
Received: from administrator-system-product-name.igk.intel.com
 ([10.91.214.181])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2025 05:01:11 -0700
Date: Thu, 18 Sep 2025 14:01:09 +0200 (CEST)
From: =?ISO-8859-2?Q?Micha=B3_Grzelak?= <michal.grzelak@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 ville.syrjala@linux.intel.com, michal.grzelak@intel.com
Subject: Re: [PATCH v2 00/15] drm/i915: vlv clock cleanups
In-Reply-To: <cover.1757688216.git.jani.nikula@intel.com>
Message-ID: <dc4baf0c-420b-3486-98bd-24c4c53b5b0b@intel.com>
References: <cover.1757688216.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1044490097-1758196873=:965976"
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

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1044490097-1758196873=:965976
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

Hi Jani,

On Fri, 12 Sep 2025, Jani Nikula wrote:
> This is v2 of [1]. There were issues with sideband get/put, discovered
> in CI, so I ended up doing what Ville suggested in [2], and handling
> sideband get/put inside the functions. This is done in new patches 1-2,
> which obviously caused some rebase churn in the rest. I also removed
> vlv_get_cck_clock_hpll() completely, this is new patch 11.
>
> I added r-b/ack from the previous version in some patches, dropped them
> from others, depending on how much changes there were. Sorry about the
> trouble, please look into this again.
>
> BR,
> Jani.
>
> [1] https://lore.kernel.org/r/cover.1755607980.git.jani.nikula@intel.com
> [2] https://lore.kernel.org/r/aMAqlVAw2NqlwQ5_@intel.com
>
> Jani Nikula (15):
>  drm/i915: do cck get/put inside vlv_get_hpll_vco()
>  drm/i915: do cck get/put inside vlv_get_cck_clock()
>  drm/i915: add vlv_clock_get_gpll()
>  drm/i915: add vlv_clock_get_czclk()
>  drm/i915: add vlv_clock_get_hrawclk()
>  drm/i915: make vlv_get_cck_clock_hpll() static
>  drm/i915: add vlv_clock_get_cdclk()
>  drm/i915: make vlv_get_cck_clock() static
>  drm/i915: rename vlv_get_hpll_vco() to vlv_clock_get_hpll_vco()
>  drm/i915: cache the results in vlv_clock_get_hpll_vco() and use it
>    more
>  drm/i915: remove vlv_get_cck_clock_hpll()
>  drm/i915: remove intel_update_czclk() as unnecessary
>  drm/i915: log HPLL frequency similar to CZCLK
>  drm/i915: move hpll and czclk caching under display
>  drm/i915: split out vlv_clock.[ch]

Although I have just issued my r-b on the rest of the series, I would
have one question. Can't we add on top of the series a separate commit
with rename of vlv_get_cck_clock() into vlv_clock_get_cck()?  It would
be more consistent with the rest of the function names in vlv_clock.c.
Patch with what I am meaning is in the attachment.

BR,
Michał
--8323329-1044490097-1758196873=:965976
Content-Type: text/x-diff; name=0001-drm-i915-rename-vlv_get_cck_clock-to-vlv_clock_get_c.patch
Content-Transfer-Encoding: BASE64
Content-ID: <46c21666-87a8-ee50-ba4b-15d2a0296c08@intel.com>
Content-Description: rfc.patch
Content-Disposition: attachment; filename=0001-drm-i915-rename-vlv_get_cck_clock-to-vlv_clock_get_c.patch

RnJvbSAwODQ5MjZlZWE5Y2M1MzQ3ZmVmNmVhM2QxZjlmMGM0MmU1MTBmNWZl
IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQ0KRnJvbTogPT9VVEYtOD9xP01p
Y2hhPUM1PTgyPTIwR3J6ZWxhaz89IDxtaWNoYWwuZ3J6ZWxha0BpbnRlbC5j
b20+DQpEYXRlOiBUaHUsIDE4IFNlcCAyMDI1IDEzOjQzOjE2ICswMjAwDQpT
dWJqZWN0OiBbUEFUQ0hdIGRybS9pOTE1OiByZW5hbWUgdmx2X2dldF9jY2tf
Y2xvY2soKSB0byB2bHZfY2xvY2tfZ2V0X2NjaygpDQpNSU1FLVZlcnNpb246
IDEuMA0KQ29udGVudC1UeXBlOiB0ZXh0L3BsYWluOyBjaGFyc2V0PVVURi04
DQpDb250ZW50LVRyYW5zZmVyLUVuY29kaW5nOiA4Yml0DQpPcmdhbml6YXRp
b246IEludGVsIFRlY2hub2xvZ3kgUG9sYW5kIHNwLiB6IG8uby4gLSB1bC4g
U2xvd2Fja2llZ28gMTczLCA4MC0yOTggR2RhbnNrIC0gS1JTIDEwMTg4MiAt
IE5JUCA5NTctMDctNTItMzE2DQoNCktlZXAgdGhlIGNvbnZlbnRpb24gb2Yg
bmFtaW5nIHZsdl9jbG9jayogaW5zdGVhZCBvZiB2bHZfKl9jbG9jay4NCg0K
U2lnbmVkLW9mZi1ieTogTWljaGHFgiBHcnplbGFrIDxtaWNoYWwuZ3J6ZWxh
a0BpbnRlbC5jb20+DQotLS0NCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNw
bGF5L3Zsdl9jbG9jay5jIHwgMTAgKysrKystLS0tLQ0KIDEgZmlsZSBjaGFu
Z2VkLCA1IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pDQoNCmRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L3Zsdl9jbG9j
ay5jIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS92bHZfY2xvY2su
Yw0KaW5kZXggMmM1NTA4M2Q4ZmRiLi5lNDQ5OWNiZjQ0MjAgMTAwNjQ0DQot
LS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L3Zsdl9jbG9jay5j
DQorKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L3Zsdl9jbG9j
ay5jDQpAQCAtMjksNyArMjksNyBAQCBpbnQgdmx2X2Nsb2NrX2dldF9ocGxs
X3ZjbyhzdHJ1Y3QgZHJtX2RldmljZSAqZHJtKQ0KIAlyZXR1cm4gZGlzcGxh
eS0+dmx2X2Nsb2NrLmhwbGxfZnJlcTsNCiB9DQogDQotc3RhdGljIGludCB2
bHZfZ2V0X2Nja19jbG9jayhzdHJ1Y3QgZHJtX2RldmljZSAqZHJtLA0KK3N0
YXRpYyBpbnQgdmx2X2Nsb2NrX2dldF9jY2soc3RydWN0IGRybV9kZXZpY2Ug
KmRybSwNCiAJCQkgICAgIGNvbnN0IGNoYXIgKm5hbWUsIHUzMiByZWcsIGlu
dCByZWZfZnJlcSkNCiB7DQogCXUzMiB2YWw7DQpAQCAtNTEsNyArNTEsNyBA
QCBzdGF0aWMgaW50IHZsdl9nZXRfY2NrX2Nsb2NrKHN0cnVjdCBkcm1fZGV2
aWNlICpkcm0sDQogaW50IHZsdl9jbG9ja19nZXRfaHJhd2NsayhzdHJ1Y3Qg
ZHJtX2RldmljZSAqZHJtKQ0KIHsNCiAJLyogUkFXQ0xLX0ZSRVFfVkxWIHJl
Z2lzdGVyIHVwZGF0ZWQgZnJvbSBwb3dlciB3ZWxsIGNvZGUgKi8NCi0JcmV0
dXJuIHZsdl9nZXRfY2NrX2Nsb2NrKGRybSwgImhyYXdjbGsiLCBDQ0tfRElT
UExBWV9SRUZfQ0xPQ0tfQ09OVFJPTCwNCisJcmV0dXJuIHZsdl9jbG9ja19n
ZXRfY2NrKGRybSwgImhyYXdjbGsiLCBDQ0tfRElTUExBWV9SRUZfQ0xPQ0tf
Q09OVFJPTCwNCiAJCQkJIHZsdl9jbG9ja19nZXRfaHBsbF92Y28oZHJtKSk7
DQogfQ0KIA0KQEAgLTYwLDcgKzYwLDcgQEAgaW50IHZsdl9jbG9ja19nZXRf
Y3pjbGsoc3RydWN0IGRybV9kZXZpY2UgKmRybSkNCiAJc3RydWN0IGludGVs
X2Rpc3BsYXkgKmRpc3BsYXkgPSB0b19pbnRlbF9kaXNwbGF5KGRybSk7DQog
DQogCWlmICghZGlzcGxheS0+dmx2X2Nsb2NrLmN6Y2xrX2ZyZXEpIHsNCi0J
CWRpc3BsYXktPnZsdl9jbG9jay5jemNsa19mcmVxID0gdmx2X2dldF9jY2tf
Y2xvY2soZHJtLCAiY3pjbGsiLCBDQ0tfQ1pfQ0xPQ0tfQ09OVFJPTCwNCisJ
CWRpc3BsYXktPnZsdl9jbG9jay5jemNsa19mcmVxID0gdmx2X2Nsb2NrX2dl
dF9jY2soZHJtLCAiY3pjbGsiLCBDQ0tfQ1pfQ0xPQ0tfQ09OVFJPTCwNCiAJ
CQkJCQkJCSAgdmx2X2Nsb2NrX2dldF9ocGxsX3Zjbyhkcm0pKTsNCiAJCWRy
bV9kYmdfa21zKGRybSwgIkNaIGNsb2NrIHJhdGU6ICVkIGtIelxuIiwgZGlz
cGxheS0+dmx2X2Nsb2NrLmN6Y2xrX2ZyZXEpOw0KIAl9DQpAQCAtNzAsMTIg
KzcwLDEyIEBAIGludCB2bHZfY2xvY2tfZ2V0X2N6Y2xrKHN0cnVjdCBkcm1f
ZGV2aWNlICpkcm0pDQogDQogaW50IHZsdl9jbG9ja19nZXRfY2RjbGsoc3Ry
dWN0IGRybV9kZXZpY2UgKmRybSkNCiB7DQotCXJldHVybiB2bHZfZ2V0X2Nj
a19jbG9jayhkcm0sICJjZGNsayIsIENDS19ESVNQTEFZX0NMT0NLX0NPTlRS
T0wsDQorCXJldHVybiB2bHZfY2xvY2tfZ2V0X2Njayhkcm0sICJjZGNsayIs
IENDS19ESVNQTEFZX0NMT0NLX0NPTlRST0wsDQogCQkJCSB2bHZfY2xvY2tf
Z2V0X2hwbGxfdmNvKGRybSkpOw0KIH0NCiANCiBpbnQgdmx2X2Nsb2NrX2dl
dF9ncGxsKHN0cnVjdCBkcm1fZGV2aWNlICpkcm0pDQogew0KLQlyZXR1cm4g
dmx2X2dldF9jY2tfY2xvY2soZHJtLCAiR1BMTCByZWYiLCBDQ0tfR1BMTF9D
TE9DS19DT05UUk9MLA0KKwlyZXR1cm4gdmx2X2Nsb2NrX2dldF9jY2soZHJt
LCAiR1BMTCByZWYiLCBDQ0tfR1BMTF9DTE9DS19DT05UUk9MLA0KIAkJCQkg
dmx2X2Nsb2NrX2dldF9jemNsayhkcm0pKTsNCiB9DQotLSANCjIuNDUuMg0K
DQo=

--8323329-1044490097-1758196873=:965976--
