Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6613606A31E
	for <intel-xe@archiver.kernel.org>; Mon, 23 Nov 2026 19:48:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=rENqZXuI
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F4E010EC7E;
	Mon, 23 Nov 2026 19:48:39 +0000 (UTC)
Received: from mta1.migadu.com (out-124.mta1.migadu.com [95.215.58.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F76510F1AD
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Nov 2026 19:48:33 +0000 (UTC)
X-Envelope-To: intel-xe@lists.freedesktop.org
DKIM-Signature: a=rsa-sha256; bh=rTMoIv3DzAud5qjlbtnRSvXY007vCDcg7JaAYuxydsY=; 
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795463311; v=1; x=1796068111;
 b=rENqZXuIz0LUEwAkwzw94rRfAVPlSFMxohS4vu2tE3B1MCveK9MtKmq+LPr8OeQEu0bFOpJC
 OsgyxNLIJUkCsECix2ZpePv7chw3UntB9or1PeF6gnXbz6zx3uvITFt23gJtiypO7YiTvu7+CYW
 /xxUQgzJv+5gvL2aUUammABQ=
X-Envelope-To: intel-xe@lists.freedesktop.org
Received: by smtp.migadu.com with ESMTPS id 42586a383188ab19;
 Mon, 23 Nov 2026 19:42:26 +0000
X-Mizu-Trace-ID: 42586a383188ab19
X-Migadu-Flow: FLOW_OUT
Content-Type: text/plain;
	charset=utf-8
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.300.60\))
Subject: Re: [PATCH v2] drm/i915/color: Program the 3D LUT on the plane's own
 pipe with joiner
From: Matthew Schwartz <matthew.schwartz@linux.dev>
In-Reply-To: <e564c1bb-3b90-4331-a2b3-02489ceaa096@intel.com>
Date: Mon, 23 Nov 2026 11:42:00 -0800
Cc: =?utf-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 Uma Shankar <uma.shankar@intel.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <A44DFD1C-A1EC-401D-AAE2-8BF129E0BECE@linux.dev>
References: <20261119165925.683691-1-chaitanya.kumar.borah@intel.com>
 <20261123090251.934904-1-chaitanya.kumar.borah@intel.com>
 <awQO4Lln7Y1YQQ6d@intel.com> <e564c1bb-3b90-4331-a2b3-02489ceaa096@intel.com>
To: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
X-Mailer: Apple Mail (2.3901.300.60)
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
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



> On Nov 23, 2026, at 2:47=E2=80=AFAM, Borah, Chaitanya Kumar =
<chaitanya.kumar.borah@intel.com> wrote:
>=20
>=20
>=20
> On 11/23/2026 3:31 PM, Ville Syrj=C3=A4l=C3=A4 wrote:
>> On Mon, Nov 23, 2026 at 02:32:51PM +0530, Chaitanya Kumar Borah =
wrote:
>>> With joiner, a secondary pipe plane gets its hw state from the =
primary
>>> pipe's plane, but its own uapi.crtc stays NULL. =
intel_color_load_3dlut()
>>> and intel_color_plane_commit_arm() take the CRTC from uapi.crtc, so =
they
>>> skip the secondary plane and its pipe's 3D LUT is never loaded or
>>> enabled, leaving that part of the screen without it.
>>>=20
>>> Use hw.crtc, the CRTC the plane is actually on. The linked Y-plane =
of a
>>> planar YUV scanout also has hw.crtc set but no 3D LUT state of its =
own,
>>> so skip it in intel_color_plane_commit_arm() to keep it from =
clearing
>>> LUT_3D_CTL.
>>>=20
>>> v2:
>>> - Correct the commit message (Sashiko)
>>> - Skip the linked Y-plane (Sashiko)
>>>=20
>>> Cc: Uma Shankar <uma.shankar@intel.com>
>>> Cc: Matthew Schwartz <matthew.schwartz@linux.dev>
>>> Fixes: 65db7a1f9cf7 ("drm/i915/color: Add 3D LUT to color pipeline")
>>> Signed-off-by: Chaitanya Kumar Borah =
<chaitanya.kumar.borah@intel.com>
>>> ---
>>> Matthew, the is_y_plane check is only needed to keep this patch
>>> regression free on its own: with hw.crtc the linked Y-plane would
>>> otherwise reach glk_lut_3d_commit() and clear LUT_3D_CTL. If you
>>> rebase your series on top of this patch, the check can be dropped in
>>> your patch 1 [1], since the owning-plane check there already skips
>>> the Y-plane, which is never PLANE_PRIMARY.
>>>=20
>>> [1] =
https://lore.kernel.org/intel-gfx/20261118191514.2931270-2-matthew.schwart=
z@linux.dev/
>>>=20
>>>  drivers/gpu/drm/i915/display/intel_color.c | 8 ++++++--
>>>  1 file changed, 6 insertions(+), 2 deletions(-)
>>>=20
>>> diff --git a/drivers/gpu/drm/i915/display/intel_color.c =
b/drivers/gpu/drm/i915/display/intel_color.c
>>> index 4070dc8d97d9..e5d40575aa95 100644
>>> --- a/drivers/gpu/drm/i915/display/intel_color.c
>>> +++ b/drivers/gpu/drm/i915/display/intel_color.c
>>> @@ -4278,7 +4278,11 @@ void intel_color_plane_commit_arm(struct =
intel_dsb *dsb,
>>>     const struct intel_plane_state *plane_state)
>>>  {
>>>   struct intel_display *display =3D to_intel_display(plane_state);
>>> - struct intel_crtc *crtc =3D to_intel_crtc(plane_state->uapi.crtc);
>>> + struct intel_crtc *crtc =3D to_intel_crtc(plane_state->hw.crtc);
>>> +
>>> + /* The linked Y-plane has no 3D LUT state of its own */
>>> + if (plane_state->is_y_plane)
>>> + return;
>> I didn't think we exposed the 3D LUT property on anything but
>> one of the HDR planes?
>=20
> Right, it's only exposed on the primary plane (PLANE_1). The check
> keeps the current Y-plane behaviour: with uapi.crtc the linked Y-plane
> was skipped, but with hw.crtc it would reach glk_lut_3d_commit() with
> no LUT state and clear LUT_3D_CTL, disabling the LUT that PLANE_1 just
> enabled.
>=20
>>>     if (crtc && intel_color_crtc_has_3dlut(display, crtc->pipe))
>>>   glk_lut_3d_commit(dsb, crtc, !!plane_state->hw.lut_3d);
>> This is where the problem seems to be. Why is this not checking
>> that the plane is actually the one exposing the 3D LUT?
>=20
> Ack, the missing ownership check is the underlying bug. Matthew
> already fixes it in his series [1] by letting only the owning
> plane program LUT_3D_CTL, so I kept this patch limited to the joiner
> problem and otherwise preserved the existing behaviour. The secondary
> pipe's overlays now hit the same pre-existing issue as the primary
> pipe's, and Matthew's patch fixes both. His patch can then also drop
> the Y-plane check.
>=20
> Let me know if you would rather have it folded into this patch.

We could also just combine them to make it a 3-patch series to keep this =
simple. I have no real preference.

Matt

>=20
>> Also the 'crtc' NULL check looks completely pointless. This
>> shouldn't even be called for a disabled plane.
>=20
> Ack. I just kept it as a defensive check. Will remove in v3.
>=20
> [1] =
https://lore.kernel.org/intel-gfx/20261118191514.2931270-2-matthew.schwart=
z@linux.dev/
>=20
> Thank you.
>=20
> =3D=3D
> Chaitanya
>=20
>>> @@ -4318,7 +4322,7 @@ intel_color_load_3dlut(struct intel_dsb *dsb,
>>>          const struct intel_plane_state *plane_state)
>>>  {
>>>   struct intel_display *display =3D to_intel_display(plane_state);
>>> - struct intel_crtc *crtc =3D to_intel_crtc(plane_state->uapi.crtc);
>>> + struct intel_crtc *crtc =3D to_intel_crtc(plane_state->hw.crtc);
>>>     if (crtc && intel_color_crtc_has_3dlut(display, crtc->pipe))
>>>   glk_load_lut_3d(dsb, crtc, plane_state->hw.lut_3d);
>>> --=20
>>> 2.50.1


